/*
 * @Author: lcf
 * @Date: 2022-02-03 23:11:34
 * @LastEditors: lcf
 * @LastEditTime: 2022-02-03 23:50:57
 * @FilePath: /swarm_ws2/src/swarm_control/src/status_visualisation.cpp
 * @Description:
 *
 */

#include <iostream>
#include <ros/ros.h>
#include <visualization_msgs/Marker.h>
#include <visualization_msgs/MarkerArray.h>

#include "swarm_controller.h"
#include "uav_planner.h"
#include "visualisation_utils.h"
#include "sensor_utils.h"

using namespace std;

ros::Publisher marker_array_pub; // visualization

ros::Subscriber commitmentSelf_sub; //订阅自己的commitment

prometheus_msgs::Commitment selfCommitment; // uav_id, commitmentState, sitePos, quality

const double minResolutionSeparation = 10; //10 m min separation of different sites

void commitmentSelf_cb(const prometheus_msgs::Commitment::ConstPtr &commitment_msg); //触发的回调函数

/**
    <param name="site_number" value="3"/>

    <param name="site_posx_1" value="-30"/>
    <param name="site_posy_1" value="10"/>
    <param name="site_posz_1" value="0"/>
    <param name="site_quality_1" value="0.4"/>
 */

int site_number = 0; //总共的地点数量

bool commitmentSiteposMatch(prometheus_msgs::Commitment a, prometheus_msgs::Commitment b) //see if two commitment sites are actually referring the same site
{
    Eigen::Vector3d aVec(a.sitePos[0], a.sitePos[1], a.sitePos[2]);
    Eigen::Vector3d bVec(b.sitePos[0], b.sitePos[1], b.sitePos[2]);
    if((aVec - bVec).squaredNorm() <= minResolutionSeparation*minResolutionSeparation)//within range
    {
        return true;
    }
    else
    {
        return false;
    }
}

void marker_array_cb(const ros::TimerEvent &e)
{
    visualization_msgs::MarkerArray markerArray;
    ///--------

    // generate commitmentMarker
    visualization_msgs::Marker commitmentMarker;
    commitmentMarker.header.frame_id = "/world";                        // inertial frame
    commitmentMarker.header.stamp = ros::Time::now();                   //如果使用ros::Time::now()或者其他非零值，rviz将仅仅显示距离当前时间很近的marker，其中足够近依据的是TF。然而对于0时间，不管是不是当前时间，都会显示marker。
    commitmentMarker.ns = "commitmentMarker_" + std::to_string(uav_id); // Set the namespace and id for this marker.  This serves to create a unique ID  51, Any marker sent with the same namespace and id will overwrite the old one
    commitmentMarker.lifetime = ros::Duration();
    // commitmentMarker.frame_locked = true;
    commitmentMarker.type = visualization_msgs::Marker::SPHERE;
    commitmentMarker.action = visualization_msgs::Marker::ADD; //// Set the marker action.  Options are ADD, DELETE, and new in ROS Indigo: 3 (DELETEALL)

    if (selfCommitment.commitmentState == UNCOMMITTED)
    {
        commitmentMarker.color.r = 255; // RGBA color,
        commitmentMarker.color.g = 255;
        commitmentMarker.color.b = 255;
        commitmentMarker.color.a = 0.7;

    }
    else
    {
        ros::param::get("site_number", site_number);
        for (int i = 0; i < site_number; i++)
        {
            double site_posx, site_posy, site_posz, site_quality;
            ros::param::get("site_posx_" + std::to_string(i), site_posx);
            ros::param::get("site_posy_" + std::to_string(i), site_posy);
            ros::param::get("site_posz_" + std::to_string(i), site_posz);
            ros::param::get("site_quality_" + std::to_string(i), site_quality);

            prometheus_msgs::Commitment temp;
            temp.sitePos[0] = site_posx;
            temp.sitePos[1] = site_posy;
            temp.sitePos[2] = site_posz;
            if(commitmentSiteposMatch(temp,selfCommitment))
            {
                commitmentMarker.color.r = colorlist[i - 1].r; // RGBA color,
                commitmentMarker.color.g = colorlist[i - 1].g;
                commitmentMarker.color.b = colorlist[i - 1].b;
                commitmentMarker.color.a = colorlist[i - 1].a;
                break;
            }
        }
    }
    // Set the pose of the marker.  This is a full 6DOF pose relative to the frame/time specified in the header
    commitmentMarker.pose.position.x = pos_drone[0];
    commitmentMarker.pose.position.y = pos_drone[1];
    commitmentMarker.pose.position.z = pos_drone[2];
    // Set the scale of the marker -- 1x1x1 here means 1m on a side
    commitmentMarker.scale.x = 5.0;
    commitmentMarker.scale.y = 5.0;
    commitmentMarker.scale.z = 0.1;

    markerArray.markers.push_back(commitmentMarker);

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

    ros::Timer marker_array_timer = nh.createTimer(ros::Duration(1.0), marker_array_cb);

    cout << "finished starting status_visualisation "<< uav_id << endl;

    ros::spin();
}