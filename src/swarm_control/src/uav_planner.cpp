/*
 * @Author: lcf
 * @Date: 2022-02-01 17:15:50
 * @LastEditors: lcf
 * @LastEditTime: 2022-02-01 18:06:13
 * @FilePath: /swarm_ws2/src/swarm_control/src/uav_planner.cpp
 * @Description: this node oversees everything involved in a single uav
 * 
 */
#include "swarm_controller.h"

using namespace std;

prometheus_msgs::SwarmCommand flightCommand;
ros::Publisher flightCommand_pub;
ros::Subscriber commBuffer_sub;

void sensorloop_cb(const ros::TimerEvent &e); //传感器的定时回调函数
void commandPublishLoop_cb(const ros::TimerEvent &e); //发布航行命令的定时回调函数
void comm_cb(const prometheus_msgs::DroneState::ConstPtr& state_msg); //通信触发的回调函数


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

    //【订阅】本机状态信息
    drone_state_sub = nh.subscribe<prometheus_msgs::DroneState>(uav_name + "/prometheus/drone_state", 10, drone_state_cb); //update self state
    //【订阅】通信来的信息
    commBuffer_sub = nh.subscribe<prometheus_msgs::DroneState>(uav_name + "/prometheus/commBuffer", 10, boost::bind(comm_cb,_1)); //update comm

    ros::Timer debug_timer = nh.createTimer(ros::Duration(10.0), debug_cb);
    ros::Timer commandPublishLoop_timer = nh.createTimer(ros::Duration(0.1), commandPublishLoop_cb);
    ros::Timer sensorLoop_timer = nh.createTimer(ros::Duration(0.5), sensorloop_cb);

    ros::spin();

    return 0;
}

void commandPublishLoop_cb(const ros::TimerEvent &e)
{
    flightCommand_pub.publish(flightCommand);
}
void sensorloop_cb(const ros::TimerEvent &e) //传感器的定时回调函数
{
    
}
void comm_cb(const prometheus_msgs::DroneState::ConstPtr& state_msg) //通信触发的回调函数
{

}
