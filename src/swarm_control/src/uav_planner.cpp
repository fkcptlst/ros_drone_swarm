/*
 * @Author: lcf
 * @Date: 2022-02-01 17:15:50
 * @LastEditors: lcf
 * @LastEditTime: 2022-02-02 15:26:36
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

ros::Publisher navDroneStateTX_pub; //发布drone_state
ros::Publisher commitmentTX_pub;    //发布commitment_state广播
ros::Publisher commitmentSelf_pub;  //用于常规发布commitment state用于记录或供本无人机使用

ros::Subscriber navDroneStateRX_sub; //订阅邻居无人机drone_state信息
ros::Subscriber commitmentRX_sub;    //订阅邻居无人机commitment信息

NeighbourDroneState neighbourState[MAX_UAV_NUM + 1];

float sensorReading = 0.0f;

bool collisionAvoidanceFlg = false;

//----algorithm -------
prometheus_msgs::Commitment selfCommitment; // uav_id, commitmentState, sitePos, quality
Site site_m;                  // OPINION VARIABLE: committed site or polling site
Eigen::Vector3f navTargetPos; // NAVIGATION VARIABLE: L_t
Site site_e;                  // newest sensor site, still questionable
Site site_v;                  // newest social info site, still questionable

const float sensorMinimumDiff = 0.05f; //传感器更新最小阈值epsilon

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>函数原型<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

void droneStateTXLoop_cb(const ros::TimerEvent &e); //定时广播位置
void commitmentTXLoop_cb(const ros::TimerEvent &e); //定时广播commitment

void commitmentRegularLoop_cb(const ros::TimerEvent &e); //定时广播commitment

void sensorloop_cb(const ros::TimerEvent &e);         //传感器的定时回调函数
void commandPublishLoop_cb(const ros::TimerEvent &e); //发布航行命令的定时回调函数

void droneStateRX_cb(const prometheus_msgs::DroneState::ConstPtr &state_msg);      //通信触发的回调函数
void commitmentRX_cb(const prometheus_msgs::Commitment::ConstPtr &commitment_msg); //通信触发的回调函数

void comm_LRU_aging_cb(const ros::TimerEvent &e);

void sync_selfCommitment_with_site_m();
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>主 函 数<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
int main(int argc, char **argv)
{
    ros::init(argc, argv, NODE_NAME);
    ros::NodeHandle nh("~");

    // 读取自己的飞行参数，变量初始化
    init(nh);
    selfCommitment.uav_id = uav_id;
    selfCommitment.commitmentState = UNCOMMITTED;

    // 建议控制频率 ： 10 - 50Hz, 控制频率取决于控制形式，若控制方式为速度或加速度应适当提高频率
    ros::Rate rate(controller_hz);

    if (flag_printf)
    {
        printf_param();
    }
    //【发布】决策的控制信息
    flightCommand_pub = nh.advertise<prometheus_msgs::SwarmCommand>(uav_name + "/prometheus/swarm_command", 1); // command publisher, default buffer is 1
    //【发布】飞行相关信息，用于避障
    navDroneStateTX_pub = nh.advertise<prometheus_msgs::DroneState>(uav_name + "/prometheus/commBuffer_TX/drone_state", 1); // broadcast publisher, default buffer is 1
    //【发布】commitment相关信息，用于social
    commitmentTX_pub = nh.advertise<prometheus_msgs::Commitment>(uav_name + "/prometheus/commBuffer_TX/commitment", 1); // broadcast publisher, default buffer is 1
    //【发布】commitment相关信息，用于self
    commitmentSelf_pub = nh.advertise<prometheus_msgs::Commitment>(uav_name + "/prometheus/commitment", 1); // default buffer is 1

    //【订阅】本机状态信息
    drone_state_sub = nh.subscribe<prometheus_msgs::DroneState>(uav_name + "/prometheus/drone_state", 10, drone_state_cb); // update self state
    //【订阅】通信来的邻居无人机位置速度信息
    navDroneStateRX_sub = nh.subscribe<prometheus_msgs::DroneState>(uav_name + "/prometheus/commBuffer_RX/drone_state", 10, boost::bind(droneStateRX_cb, _1)); // update comm
    //【订阅】通信来的邻居无人机commitment信息
    commitmentRX_sub = nh.subscribe<prometheus_msgs::Commitment>(uav_name + "/prometheus/commBuffer_RX/commitment", 10, boost::bind(commitmentRX_cb, _1)); // update comm

    ros::Timer debug_timer = nh.createTimer(ros::Duration(10.0), debug_cb);
    ros::Timer droneStateTXLoop_Timer = nh.createTimer(ros::Duration(0.1), droneStateTXLoop_cb);
    ros::Timer commitmentTXLoop_Timer = nh.createTimer(ros::Duration(0.1), commitmentTXLoop_cb);
    ros::Timer commitmentRegularLoop_Timer = nh.createTimer(ros::Duration(0.1), commitmentRegularLoop_cb);


    ros::Timer sensorLoop_timer = nh.createTimer(ros::Duration(0.5), sensorloop_cb);
    ros::Timer commandPublishLoop_timer = nh.createTimer(ros::Duration(0.1), commandPublishLoop_cb);

    ros::Timer comm_LRU_aging_timer = nh.createTimer(ros::Duration(0.5), comm_LRU_aging_cb);

    ros::spin();

    return 0;
}

//-----------------TODO essentials-----------------------------------------------------------------------------------------------------------------------------------------------
bool with_prob_of(float prob)
{
    random_device rd;  // random device
    mt19937 gen(rd()); // seed
    int expanded = (int)(prob * 1000);
    uniform_int_distribution<> dist(0, 1000);
    if (dist(gen) < expanded)
    {
        return true;
    }
    else
    {
        return false;
    }
}

void sync_selfCommitment_with_site_m() //a utility func
{
    selfCommitment.sitePos[0] = site_m.sitePos[0];
    selfCommitment.sitePos[1] = site_m.sitePos[0];
    selfCommitment.sitePos[2] = site_m.sitePos[0];
    selfCommitment.quality = site_m.quality;
}

void droneStateTXLoop_cb(const ros::TimerEvent &e)
{
    _DroneState.uav_id = uav_id;
    navDroneStateTX_pub.publish(_DroneState);
}

void commitmentRegularLoop_cb(const ros::TimerEvent &e)
{
    sync_selfCommitment_with_site_m();
    commitmentSelf_pub.publish(selfCommitment);
}

/**
 * @description: 发布飞行控制命令的回调函数
 * @param {TimerEvent} &e
 * @return {*}
 */
void commandPublishLoop_cb(const ros::TimerEvent &e)
{
    // TODO implement collision avoidance, sensor integration
    flightCommand_pub.publish(flightCommand);
}

/**
 * @description: drone_state通信触发的回调函数
 * @param {ConstPtr&} state_msg
 * @return {*}
 */
void droneStateRX_cb(const prometheus_msgs::DroneState::ConstPtr &state_msg)
{
    int idx = state_msg->uav_id;
    if (idx < 0 || idx > MAX_UAV_NUM) // check index bound
    {
        return;
    }
    if (neighbourState[idx].age > 0 && neighbourState[idx].state.header.seq > state_msg->header.seq) //如果比上一次获得的信息新，则更新
    {
        neighbourState[idx].state = *state_msg;
        setNthBitTo1(neighbourState[idx].age, 8); //更新age
    }
}

void commitmentRX_cb(const prometheus_msgs::Commitment::ConstPtr &commitment_msg)
{
    
}
/**
 * @description: 用于记录的邻居信息的定时”老化”
 * @param {TimerEvent} &e
 * @return {*}
 */
void comm_LRU_aging_cb(const ros::TimerEvent &e)
{
    for (int i = 0; i <= MAX_UAV_NUM; i++)
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
    // TODO implement sensor-data acquisition
}

void processEnvInfo()
{
    if (site_e.validFlg && site_e != site_m) // if sensor new site is valid and new
    {
        if (site_e.quality > site_m.quality + sensorMinimumDiff) // compare rule
        {
            if (with_prob_of(site_e.quality))
            {
                site_m = site_e;
                site_e.validFlg = false; // reset valid flg
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
void socialLoop_cb(const ros::TimerEvent &e) // TODO
{
    if (site_v.validFlg && site_v != site_m)
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
void commitmentTXLoop_cb(const ros::TimerEvent &e) //voting loop
{
    if (with_prob_of(site_m.quality))
    {
        sync_selfCommitment_with_site_m();
        commitmentTX_pub.publish(selfCommitment);
    }
}

//-----------------TODO NAVIGATION ----------------------------------------------------------------