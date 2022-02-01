/*
 * @Author: lcf
 * @Date: 2022-02-01 17:15:50
 * @LastEditors: lcf
 * @LastEditTime: 2022-02-01 23:52:26
 * @FilePath: /swarm_ws2/src/swarm_control/src/uav_planner.cpp
 * @Description: this node oversees everything involved in a single uav
 * 
 */
#include "swarm_controller.h"
#include "uav_planner.h"
#include <random>

using namespace std;

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>全局变量<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

prometheus_msgs::SwarmCommand flightCommand;
ros::Publisher flightCommand_pub;
ros::Publisher broadcast_pub;
ros::Subscriber commBuffer_sub;
NeighbourDroneState neighbourState[MAX_UAV_NUM+1];

float sensorReading = 0.0f;

bool collisionAvoidanceFlg = false;


//----algorithm -------
int commitmentState = UNCOMMITTED;
Site site_m; //OPINION VARIABLE: committed site or polling site
Eigen::Vector3f navTargetPos; //NAVIGATION VARIABLE: L_t
Site site_e; //newest sensor site, still questionable
Site site_v; //newest social info site, still questionable

const float sensorMinimumDiff = 0.05f; //传感器更新最小阈值epsilon


//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>函数原型<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

void broadcastLoop_cb(const ros::TimerEvent &e); //定时广播
void sensorloop_cb(const ros::TimerEvent &e); //传感器的定时回调函数
void commandPublishLoop_cb(const ros::TimerEvent &e); //发布航行命令的定时回调函数
void comm_cb(const prometheus_msgs::DroneState::ConstPtr& state_msg); //通信触发的回调函数
void comm_LRU_aging_cb(const ros::TimerEvent &e);


//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>主 函 数<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
int main(int argc, char **argv)
{
    ros::init(argc, argv, NODE_NAME);
    ros::NodeHandle nh("~");

    // 读取自己的飞行参数，变量初始化
    init(nh);

    
    // 建议控制频率 ： 10 - 50Hz, 控制频率取决于控制形式，若控制方式为速度或加速度应适当提高频率
    ros::Rate rate(controller_hz);

    if(flag_printf)
    {
        printf_param();
    }
    //【发布】决策的控制信息
    flightCommand_pub = nh.advertise<prometheus_msgs::SwarmCommand>(uav_name + "/prometheus/swarm_command", 1); // command publisher, default buffer is 1
    //【发布】opinion related
    broadcast_pub = nh.advertise<prometheus_msgs::SwarmCommand>(uav_name + "/prometheus/drone_state_extra", 1); // broadcast publisher, default buffer is 1

    //【订阅】本机状态信息
    drone_state_sub = nh.subscribe<prometheus_msgs::DroneState>(uav_name + "/prometheus/drone_state", 10, drone_state_cb); //update self state
    //【订阅】通信来的信息
    commBuffer_sub = nh.subscribe<prometheus_msgs::DroneState>(uav_name + "/prometheus/commBuffer", 10, boost::bind(comm_cb,_1)); //update comm

    ros::Timer debug_timer = nh.createTimer(ros::Duration(10.0), debug_cb);
    ros::Timer commandPublishLoop_timer = nh.createTimer(ros::Duration(0.1), commandPublishLoop_cb);
    ros::Timer broadcastLoop_timer = nh.createTimer(ros::Duration(0.1), broadcastLoop_cb);
    ros::Timer sensorLoop_timer = nh.createTimer(ros::Duration(0.5), sensorloop_cb);
    ros::Timer comm_LRU_aging_timer = nh.createTimer(ros::Duration(0.5), comm_LRU_aging_cb);

    ros::spin();

    return 0;
}

//-----------------TODO essentials-----------------------------------------------------------------------------------------------------------------------------------------------
bool with_prob_of(float prob)
{
    random_device rd;//random device
    mt19937 gen(rd());//seed
    int expanded = (int)(prob * 1000);
    uniform_int_distribution<> dist(0,1000);
    if(dist(gen)<expanded)
    {
        return true;
    }
    else
    {
        return false;
    }
}

void broadcastLoop_cb(const ros::TimerEvent &e)
{
    _DroneState.uav_id = uav_id;

    _DroneState.opinionValidFlg = true;
    _DroneState.voteValidFlg = false;
    _DroneState.commitmentState = commitmentState; //should be COMMITTED
    _DroneState.sitePos[0] = site_m.sitePos[0];
    _DroneState.sitePos[1] = site_m.sitePos[1];
    _DroneState.sitePos[2] = site_m.sitePos[2];
    _DroneState.quality = site_m.quality;

    broadcast_pub.publish(_DroneState);
}

/**
 * @description: 发布飞行控制命令的回调函数
 * @param {TimerEvent} &e
 * @return {*}
 */
void commandPublishLoop_cb(const ros::TimerEvent &e)
{
    //TODO implement collision avoidance, sensor integration
    flightCommand_pub.publish(flightCommand);
}

/**
 * @description: 通信触发的回调函数
 * @param {ConstPtr&} state_msg
 * @return {*}
 */
void comm_cb(const prometheus_msgs::DroneState::ConstPtr& state_msg) 
{
    int idx = state_msg->uav_id;
    if(idx < 0 || idx > MAX_UAV_NUM) //check index bound
    {
        return;
    }
    if(neighbourState[idx].age > 0 && neighbourState[idx].state.header.seq > state_msg->header.seq) //如果比上一次获得的信息新，则更新
    {
        neighbourState[idx].state = *state_msg;
        setNthBitTo1(neighbourState[idx].age,8); //更新age
    }
}

/**
 * @description: 用于记录的邻居信息的定时”老化”
 * @param {TimerEvent} &e
 * @return {*}
 */
void comm_LRU_aging_cb(const ros::TimerEvent &e) 
{
    for(int i = 0; i <= MAX_UAV_NUM; i++)
    {
        neighbourState[i].age = neighbourState[i].age >> 1;
    }
}
//-----------------TODO collision avoidance related-----------------------------------------------------------------------------------------------------------------------------------------------

//-----------------PROCESS ENVIRONMENTAL INFO--------------------------------------------------------------------------------------------------------------------------------------------------------------
/**
 * @description: 传感器更新loop
 * @param {TimerEvent} &e
 * @return {*}
 */
void sensorloop_cb(const ros::TimerEvent &e) 
{
    //TODO implement sensor-data acquisition
}

void processEnvInfo()
{
    if(site_e.validFlg && site_e != site_m) //if sensor new site is valid and new
    {
        if(site_e.quality > site_m.quality + sensorMinimumDiff) //compare rule
        {
            if(with_prob_of(site_e.quality))
            {
                site_m = site_e;
                site_e.validFlg = false; //reset valid flg
            }
        }
    }
}
//-----------------PROCESS SOCIAL INFO------------------------------------------------------------------------------------------------------------------------------------------------
/**
 * @description: process social information, every 2s
 * @param {TimerEvent} &e
 * @return {*}
 */
void socialLoop_cb(const ros::TimerEvent &e) //TODO
{
    if(site_v.validFlg && site_v != site_m)
    {
        site_m.sitePos = site_v.sitePos;
        site_m.quality = 0;
        navTargetPos = site_v.sitePos;
    }
}

//-----------------VOTING ----------------------------------------------------------------
/**
 * @description: every 500ms broadcast a vote
 * @param {TimerEvent} &e
 * @return {*}
 */
void votingLoop_cb(const ros::TimerEvent &e)
{
    if(with_prob_of(site_m.quality))
    {
        _DroneState.opinionValidFlg = true;
        _DroneState.voteValidFlg = true;
        _DroneState.commitmentState = commitmentState; //should be COMMITTED
        _DroneState.sitePos[0] = site_m.sitePos[0];
        _DroneState.sitePos[1] = site_m.sitePos[1];
        _DroneState.sitePos[2] = site_m.sitePos[2];
        _DroneState.quality = site_m.quality;

        broadcast_pub.publish(_DroneState);
    }
}

//-----------------TODO NAVIGATION ----------------------------------------------------------------