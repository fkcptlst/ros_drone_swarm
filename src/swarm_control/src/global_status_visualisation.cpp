/*
 * @Author: lcf
 * @Date: 2022-01-31 21:34:24
 * @LastEditors: lcf
 * @LastEditTime: 2022-03-25 23:55:32
 * @FilePath: /swarm_ws2/src/swarm_control/src/global_status_visualisation.cpp
 * @Description: This node observes position of all vehicles and unicasts relevant info to each vehicle, modified from swarm_controller
 * 
 */

#include "swarm_controller.h"
#include "uav_planner.h"
#include "visualisation_utils.h"

#include <nav_msgs/Odometry.h>

using namespace std;


ros::Subscriber Drone_state_sub[MAX_UAV_NUM+1]; //用于订阅drone_state
ros::Subscriber Commitment_sub[MAX_UAV_NUM+1]; //用于订阅commitment

ros::Subscriber Gazebo_odom_sub[MAX_UAV_NUM+1]; //用于订Odometry


prometheus_msgs::DroneState DroneStateList[MAX_UAV_NUM+1];
prometheus_msgs::Commitment CommitmentList[MAX_UAV_NUM+1];
nav_msgs::Odometry GazeboOdomList[MAX_UAV_NUM+1];


bool DroneStateValidFlgList[MAX_UAV_NUM+1]; //用于标记是否有效，避免发布已经失效的无人机信息

Eigen::Vector3d dronePos[MAX_UAV_NUM+1]; //drone position vector

void drone_state_topicUpdate_cb(const prometheus_msgs::DroneState::ConstPtr& state_msg, int drone_id);
void commitment_topicUpdate_cb(const prometheus_msgs::Commitment::ConstPtr& commitment_msg, int drone_id);
void odomUpdate_cb(const nav_msgs::Odometry::ConstPtr& odom_msg, int drone_id); //更新每个无人机pos信息的callback function

void globalUpdate_cb(const ros::TimerEvent &e);
void initialize();

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>主 函 数<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
int main(int argc, char **argv)
{
    ros::init(argc, argv, "global_status_visualisation");
    ros::NodeHandle nh("~");
    cout << ">>>>>>>>>>>>>>>>>>>>>>>>>>>>global_status_visualisation<<<<<<<<<<<<<<<<<<<<<<<<< "<< endl;
    // 读取参数，变量初始化
    init(nh);
    for(int i = 0; i <= MAX_UAV_NUM; i++)
    {
        DroneStateValidFlgList[i] = false;
    }

    // 建议控制频率 ： 10 - 50Hz, 控制频率取决于控制形式，若控制方式为速度或加速度应适当提高频率
    ros::Rate rate(controller_hz);

    if(flag_printf)
    {
        printf_param();
    }

    //【订阅】订阅所有飞机的信息
    for(int i = 1; i <= swarm_num_uav; i++) 
    {
        Drone_state_sub[i] = nh.subscribe<prometheus_msgs::DroneState>("/uav"+std::to_string(i)+ "/prometheus/drone_state", 3, boost::bind(drone_state_topicUpdate_cb,_1,i));//TODO
        Gazebo_odom_sub[i] = nh.subscribe<nav_msgs::Odometry>("/uav"+std::to_string(i)+ "/prometheus/ground_truth", 3, boost::bind(odomUpdate_cb,_1,i));//TODO
        Commitment_sub[i] = nh.subscribe<prometheus_msgs::Commitment>("/uav"+std::to_string(i)+ "/prometheus/commitment", 10, boost::bind(commitment_topicUpdate_cb,_1,i));
    }

    //【发布】可视化markerArray
    marker_array_pub = nh.advertise<visualization_msgs::MarkerArray>("/status_visualisation", 10);

    ros::Timer debug_timer = nh.createTimer(ros::Duration(10.0), debug_cb);
    ros::Timer globalUpdate_timer = nh.createTimer(ros::Duration(0.05), globalUpdate_cb); //TODO status update per 0.05 seconds

    ros::spin();

    return 0;
}

void initialize() 
{
    for(int i = 0; i <= MAX_UAV_NUM; i++) 
    {
        dronePos[i] = Eigen::Vector3d::Zero();
    }
}
void odomUpdate_cb(const nav_msgs::Odometry::ConstPtr& odom_msg, int drone_id) //更新每个无人机pos信息的callback function
{
    GazeboOdomList[drone_id] = *odom_msg;
    dronePos[drone_id] = Eigen::Vector3d(odom_msg->pose.pose.position.x,odom_msg->pose.pose.position.y,odom_msg->pose.pose.position.z);
}
void drone_state_topicUpdate_cb(const prometheus_msgs::DroneState::ConstPtr& state_msg, int drone_id) //更新每个无人机信息的callback function
{
    DroneStateList[drone_id] = *state_msg;
    
    if(state_msg->armed == true) //TODO: need further check
        DroneStateValidFlgList[drone_id] = true; //标记获得新消息有效
    else
        DroneStateValidFlgList[drone_id] = false; //
}
void commitment_topicUpdate_cb(const prometheus_msgs::Commitment::ConstPtr& commitment_msg, int drone_id)
{
    CommitmentList[drone_id] = *commitment_msg;
}
void globalUpdate_cb(const ros::TimerEvent &e) //publish更新所有无人机信息的callback function
{
    visualization_msgs::MarkerArray markerArray;

    for(int i = 1; i <= swarm_num_uav; i++)
    {

                if(DroneStateValidFlgList[i] == true)
                {
                    generateCommitmentMarker(markerArray, CommitmentList[i],dronePos[i], i);
                    generate_uav_idMarker(markerArray, dronePos[i], i);
                }
                else
                {
                    ROS_INFO("uav_id: %d is disarmed",i);
                }
    }
    /*
    for(int i = 0; i <= MAX_UAV_NUM; i++)
    {
        DroneStateValidFlgList[i] = false;
        CommitmentValidFlgList[i] = false;
    }
    *///It sucks
    marker_array_pub.publish(markerArray);
}
