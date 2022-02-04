/*
 * @Author: lcf
 * @Date: 2022-02-01 17:15:50
 * @LastEditors: lcf
 * @LastEditTime: 2022-02-04 17:24:51
 * @FilePath: /swarm_ws2/src/swarm_control/src/uav_planner.cpp
 * @Description: this node oversees everything involved in a single uav
 *
 * @Notes: 现在采取的回调函数策略是非抢占式FIFO队列，如果效果不好可以考虑增加一个回调队列，做成非抢占式的多级队列调度（没有反馈，因为太复杂）；如果效果还不行
 * 就尝试多线程（注意加PV用于互斥）
 *
 */
#include "swarm_controller.h"
#include "uav_planner.h"
#include <random>
#include <vector>
#include <algorithm>

using namespace std;

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>全局变量<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

prometheus_msgs::SwarmCommand flightCommand;

ros::Publisher flightCommand_pub;

ros::Publisher navDroneStateTX_pub; //发布drone_state
ros::Publisher commitmentTX_pub;    //发布commitment_state广播
ros::Publisher commitmentSelf_pub;  //用于常规发布commitment state用于记录或供本无人机使用

ros::Subscriber navDroneStateRX_sub; //订阅邻居无人机drone_state信息
ros::Subscriber commitmentRX_sub;    //订阅邻居无人机commitment信息

ros::Subscriber sensorBuffer_sub; //订阅无人机传感器信息

ros::Subscriber groundCommand_sub; //订阅地面站
bool All_Offboard_Switch = false;

NeighbourDroneState neighbourState[MAX_UAV_NUM + 1];

float sensorReading = 0.0f;

bool collisionAvoidanceFlg = false;

//----algorithm -------
prometheus_msgs::Commitment selfCommitment; // uav_id, commitmentState, sitePos, quality
Site site_m;                                // OPINION VARIABLE: committed site or polling site
Eigen::Vector3d navTargetPos;               // NAVIGATION VARIABLE: L_t
Site site_e;                                // newest sensor site, still questionable
Site site_v;                                // newest social info site, still questionable

vector<Site> results; // use vector in case of multiple sites

const float sensorMinimumDiff = 0.05f; //传感器更新最小阈值epsilon

vector<prometheus_msgs::Commitment> neighbourCommitments; //记录收到的投票信息,buffer

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>函数原型<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

void droneStateTXLoop_cb(const ros::TimerEvent &e); //定时广播位置
void commitmentTXLoop_cb(const ros::TimerEvent &e); //定时广播commitment

void commitmentRegularLoop_cb(const ros::TimerEvent &e); //定时广播commitment

void sensorloop_cb(const ros::TimerEvent &e);     //传感器的定时回调函数
void navigationLoop_cb(const ros::TimerEvent &e); //发布航行命令的定时回调函数

void droneStateRX_cb(const prometheus_msgs::DroneState::ConstPtr &state_msg);      //通信触发的回调函数
void commitmentRX_cb(const prometheus_msgs::Commitment::ConstPtr &commitment_msg); //通信触发的回调函数

void sensorBuffer_cb(const prometheus_msgs::SensorMsg::ConstPtr &sensor_msg); //通信触发的回调函数

void comm_LRU_aging_cb(const ros::TimerEvent &e);

void sync_selfCommitment_with_site_m();

bool with_prob_of(float prob);
void processEnvInfo();
void sync_selfCommitment_with_site_m(); // a utility func

void socialLoop_cb(const ros::TimerEvent &e);

bool check_if_reached_waypoint(Eigen::Vector3d &waypoint);
void generateRandomWaypoint(Eigen::Vector3d &waypoint);

void swarm_command_ground_cb(const prometheus_msgs::SwarmCommand::ConstPtr &msg); //接收地面站信息

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>主 函 数<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
int main(int argc, char **argv)
{
    ros::init(argc, argv, "uav_planner");
    ros::NodeHandle nh("~");

    // 读取自己的飞行参数，变量初始化
    init(nh);
    selfCommitment.uav_id = uav_id;
    selfCommitment.commitmentState = UNCOMMITTED;
    All_Offboard_Switch = false;
    neighbourCommitments.clear();

    generateRandomWaypoint(navTargetPos);

    // 建议控制频率 ： 10 - 50Hz, 控制频率取决于控制形式，若控制方式为速度或加速度应适当提高频率
    ros::Rate rate(controller_hz);

    if (flag_printf)
    {
        printf_param();
    }
    //【发布】决策的控制信息
    flightCommand_pub = nh.advertise<prometheus_msgs::SwarmCommand>(uav_name + "/prometheus/swarm_command", 2); // command publisher, default buffer is 2
    //【发布】飞行相关信息，用于避障
    navDroneStateTX_pub = nh.advertise<prometheus_msgs::DroneState>(uav_name + "/prometheus/commBuffer_TX/drone_state", 2); // broadcast publisher, default buffer is 2
    //【发布】commitment相关信息，用于social
    commitmentTX_pub = nh.advertise<prometheus_msgs::Commitment>(uav_name + "/prometheus/commBuffer_TX/commitment", 1); // broadcast publisher, default buffer is 1
    //【发布】commitment相关信息，用于self
    commitmentSelf_pub = nh.advertise<prometheus_msgs::Commitment>(uav_name + "/prometheus/commitment", 1); // default buffer is 1

    //【订阅】本机状态信息
    drone_state_sub = nh.subscribe<prometheus_msgs::DroneState>(uav_name + "/prometheus/drone_state", 5, drone_state_cb); // update self state
    //【订阅】通信来的邻居无人机位置速度信息
    navDroneStateRX_sub = nh.subscribe<prometheus_msgs::DroneState>(uav_name + "/prometheus/commBuffer_RX/drone_state", 10, droneStateRX_cb); // update comm
    //【订阅】通信来的邻居无人机commitment信息
    commitmentRX_sub = nh.subscribe<prometheus_msgs::Commitment>(uav_name + "/prometheus/commBuffer_RX/commitment", 10, commitmentRX_cb); // update comm
    //【订阅】地面站命令
    groundCommand_sub = nh.subscribe<prometheus_msgs::SwarmCommand>(uav_name + "/prometheus/swarm_command_ground", 10, swarm_command_ground_cb);
    //【订阅】传感器信息
    sensorBuffer_sub = nh.subscribe<prometheus_msgs::SensorMsg>(uav_name + "/prometheus/sensorBuffer", 10, sensorBuffer_cb);

    ros::Timer debug_timer = nh.createTimer(ros::Duration(10.0), debug_cb);
    ros::Timer droneStateTXLoop_Timer = nh.createTimer(ros::Duration(0.1), droneStateTXLoop_cb);
    ros::Timer commitmentTXLoop_Timer = nh.createTimer(ros::Duration(0.1), commitmentTXLoop_cb);
    ros::Timer commitmentRegularLoop_Timer = nh.createTimer(ros::Duration(0.1), commitmentRegularLoop_cb);

    ros::Timer sensorLoop_timer = nh.createTimer(ros::Duration(0.5), sensorloop_cb);
    ros::Timer commandPublishLoop_timer = nh.createTimer(ros::Duration(0.5), navigationLoop_cb); // TODO this need fixing

    ros::Timer comm_LRU_aging_timer = nh.createTimer(ros::Duration(0.5), comm_LRU_aging_cb);

    ros::Timer socialLoop_timer = nh.createTimer(ros::Duration(0.5), socialLoop_cb);

    cout << "uav_" << uav_id << "finished starting" << endl;
    cout << (neighbourCommitments.empty() != true) << endl;

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

void sync_selfCommitment_with_site_m() // a utility func
{
    selfCommitment.sitePos[0] = site_m.sitePos[0];
    selfCommitment.sitePos[1] = site_m.sitePos[1];
    selfCommitment.sitePos[2] = site_m.sitePos[2];
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
    neighbourCommitments.push_back(*commitment_msg); //压入
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

void swarm_command_ground_cb(const prometheus_msgs::SwarmCommand::ConstPtr &msg)
{
    All_Offboard_Switch = msg->All_Offboard_Control_Flg;
    if (!All_Offboard_Switch) // if not all offboard, then pass message to swarm_controller
    {
        flightCommand_pub.publish(*msg);
    }
}

//-----------------PROCESS ENVIRONMENTAL INFO--------------------------------------------------------------------------------------------------------------------------------------------------------------
/**
 * @description: 传感器更新loop
 * @param {TimerEvent} &e
 * @return {*}
 */

void sensorBuffer_cb(const prometheus_msgs::SensorMsg::ConstPtr &sensor_msg) //通信触发的回调函数
{
    Site temp;
    temp.sitePos[0] = sensor_msg->sitePos[0];
    temp.sitePos[1] = sensor_msg->sitePos[1];
    temp.sitePos[2] = sensor_msg->sitePos[2];
    temp.quality = sensor_msg->quality;
    results.push_back(temp);
}

void sensorloop_cb(const ros::TimerEvent &e)
{
    // TODO implement sensor-data acquisition
    if (!results.empty()) // if there's site with scope
    {
        // XXX: select an appropriate site_e, current strategy: select max
        vector<Site>::iterator iter = results.begin();
        vector<Site>::iterator maxPtr = results.begin();
        for (; iter != results.end(); iter++)
        {
            if (iter->quality > maxPtr->quality)
            {
                maxPtr = iter;
            }
        }
        site_e = *maxPtr;
        results.clear();
    }
    processEnvInfo();
}

void processEnvInfo()
{
    if (site_e != site_m) // XXX: some differences from the original text,need furthur check. if sensor new site is valid and new 
    {
        if (selfCommitment.commitmentState != POLLING) //and self is not polling(if polling, then it's not supposed to make discovery)
        {
            // discovery
            if (site_e.quality > site_m.quality + sensorMinimumDiff) // compare rule
            {
                if (with_prob_of(site_e.quality))
                {
                    site_m = site_e;
                    selfCommitment.commitmentState = COMMITTED;
                    sync_selfCommitment_with_site_m();
                }
            }
        }
    }
    else // 1:resamping or 2: polling and reached destination
    {
        site_m.quality = site_e.quality;
        selfCommitment.commitmentState = COMMITTED;
    }
}
//-----------------PROCESS SOCIAL INFO------------------------------------------------------------------------------------------------------------------------------------------------
/**
 * @description: process social information, every 2s
 * @param {TimerEvent} &e
 * @return {*}
 */
void socialLoop_cb(const ros::TimerEvent &e)
{
    if (neighbourCommitments.empty() != true) // not empty, heard something
    {
        // XXX: select an appropriate site_v, current strategy: select max
        vector<prometheus_msgs::Commitment>::iterator iter = neighbourCommitments.begin();
        vector<prometheus_msgs::Commitment>::iterator maxPtr = neighbourCommitments.begin();
        for (; iter != neighbourCommitments.end(); iter++)
        {
            if (iter->quality > maxPtr->quality)
            {
                maxPtr = iter;
            }
        }
        site_v.quality = maxPtr->quality;
        site_v.sitePos[0] = maxPtr->sitePos[0];
        site_v.sitePos[1] = maxPtr->sitePos[1];
        site_v.sitePos[2] = maxPtr->sitePos[2];

        neighbourCommitments.clear(); // clear vector at the end
        //
        if (site_v != site_m)
        {
            site_m.sitePos = site_v.sitePos;
            site_m.quality = 0;
            navTargetPos = site_v.sitePos;

            selfCommitment.commitmentState = POLLING;
            sync_selfCommitment_with_site_m();
        }
    }
}

//-----------------VOTING ----------------------------------------------------------------
/**
 * @description: every 500ms broadcast a vote
 * @param {TimerEvent} &e
 * @return {*}
 */
void commitmentTXLoop_cb(const ros::TimerEvent &e) // voting loop
{
    if (with_prob_of(site_m.quality))
    {
        sync_selfCommitment_with_site_m();
        commitmentTX_pub.publish(selfCommitment);
    }
}

void generateRandomWaypoint(Eigen::Vector3d &waypoint)
{
    int boundaryOffset = 10;                                                                                               // 10 meters of boundary offset
    random_device rd;                                                                                                      // random device
    mt19937 gen(rd());                                                                                                     // seed
    uniform_int_distribution<> Xdistribut((int)(geo_fence_x[0] + boundaryOffset), (int)(geo_fence_x[1] - boundaryOffset)); // randomly select a waypoint in the region
    uniform_int_distribution<> Ydistribut((int)(geo_fence_y[0] + boundaryOffset), (int)(geo_fence_y[1] - boundaryOffset));
    waypoint[0] = (float)Xdistribut(gen);
    waypoint[1] = (float)Ydistribut(gen);
    waypoint[2] = CruiseHeight;
}

bool check_if_reached_waypoint(Eigen::Vector3d &waypoint)
{
    if ((pos_drone - waypoint).squaredNorm() <= WaypointMinSeparationThreshold * WaypointMinSeparationThreshold)
    {
        return true;
    }
    else
    {
        return false;
    }
}

//-----------------TODO NAVIGATION ----------------------------------------------------------------

void collisionAvoidance() // TODO collision avoidance implement
{
}
/**
 * @description: 发布飞行控制命令的回调函数
 * @param {TimerEvent} &e
 * @return {*}
 */
void navigationLoop_cb(const ros::TimerEvent &e)
{
    if (!All_Offboard_Switch) // if not all offboard, return
    {
        return;
    }

    collisionAvoidance();

    if (!collision_flag) // if is not on collision course
    {
        if (check_if_reached_waypoint(navTargetPos))
        {
            generateRandomWaypoint(navTargetPos);
        }
        else
        {
            // TODO check if too long hasn't reached the waypoint
        }

        // update flight command
        flightCommand.Mode = prometheus_msgs::SwarmCommand::Move;         // move mode
        flightCommand.Move_mode = prometheus_msgs::SwarmCommand::XYZ_POS; // XYZ_POS

        flightCommand.position_ref[0] = navTargetPos[0];
        flightCommand.position_ref[1] = navTargetPos[1];
        flightCommand.position_ref[2] = navTargetPos[2];

        // double cosVal = navTargetPos.dot(pos_drone) / (navTargetPos.norm()*pos_drone.norm());
        // flightCommand.yaw_ref = acos()
    }
    // publish flight command at the end
    flightCommand_pub.publish(flightCommand);
}
