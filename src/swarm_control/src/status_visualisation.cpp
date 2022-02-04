/*
 * @Author: lcf
 * @Date: 2022-02-03 23:11:34
 * @LastEditors: lcf
 * @LastEditTime: 2022-02-04 15:55:46
 * @FilePath: /swarm_ws2/src/swarm_control/src/status_visualisation.cpp
 * @Description:
 *
 */

#include "visualisation_utils.h"

using namespace std;


ros::Subscriber commitmentSelf_sub; //订阅自己的commitment

prometheus_msgs::Commitment selfCommitment; // uav_id, commitmentState, sitePos, quality


void commitmentSelf_cb(const prometheus_msgs::Commitment::ConstPtr &commitment_msg); //触发的回调函数

void marker_array_cb(const ros::TimerEvent &e)
{
    visualization_msgs::MarkerArray markerArray;
    ///--------
    generateCommitmentMarker(markerArray, selfCommitment, pos_drone, uav_id);
    // TODO: further implement

    marker_array_pub.publish(markerArray);
}

void commitmentSelf_cb(const prometheus_msgs::Commitment::ConstPtr &commitment_msg) //触发的回调函数
{
    selfCommitment = *commitment_msg;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "status_visualisation");
    ros::NodeHandle nh("~");

    // 读取自己的飞行参数，变量初始化
    init(nh);
    selfCommitment.uav_id = uav_id;
    selfCommitment.commitmentState = UNCOMMITTED;

    ros::Rate rate(controller_hz);

    //【发布】marker 信息
    marker_array_pub = nh.advertise<visualization_msgs::MarkerArray>(uav_name + "/prometheus/status_visualisation", 10);
    //【订阅】本机状态信息
    drone_state_sub = nh.subscribe<prometheus_msgs::DroneState>(uav_name + "/prometheus/drone_state", 5, drone_state_cb); // update self state
    //【订阅】commitment相关信息，用于self
    commitmentSelf_sub = nh.subscribe<prometheus_msgs::Commitment>(uav_name + "/prometheus/commitment", 10, commitmentSelf_cb); // default buffer is 1

    ros::Timer marker_array_timer = nh.createTimer(ros::Duration(), marker_array_cb);

    cout << "finished starting status_visualisation "<< uav_id << endl;

    ros::spin();
}