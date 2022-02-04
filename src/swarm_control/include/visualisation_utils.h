/*
 * @Author: lcf
 * @Date: 2022-02-03 23:23:24
 * @LastEditors: lcf
 * @LastEditTime: 2022-02-04 16:44:26
 * @FilePath: /swarm_ws2/src/swarm_control/include/visualisation_utils.h
 * @Description: 
 * 
 */
#ifndef __VISUALISATION_UTILS_H
#define __VISUALISATION_UTILS_H

#include <iostream>
#include <ros/ros.h>
#include <visualization_msgs/Marker.h>
#include <visualization_msgs/MarkerArray.h>

#include "uav_planner.h"
#include "sensor_utils.h"

float colorTransparency = 0.5;
struct
{
    float r;
    float g;
    float b;
    float a;
}colorlist[] = {
    {255,0,0,colorTransparency}, //红
    {0,255,0,colorTransparency}, //绿
    {0,0,255,colorTransparency}, //蓝
    {255,255,0,colorTransparency},
    {255,0,255,colorTransparency},
    {0,255,255,colorTransparency},
    {255,0,0,colorTransparency},
    {0,255,0,colorTransparency},
    {0,0,255,colorTransparency},
    {255,255,0,colorTransparency},
    {255,0,255,colorTransparency},
    {0,255,255,colorTransparency},
    {255,0,0,colorTransparency},
    {0,255,0,colorTransparency},
    {0,0,255,colorTransparency},
    {255,255,0,colorTransparency},
    {255,0,255,colorTransparency},
    {0,255,255,colorTransparency}
}; //stores some pretty colors

const double minResolutionSeparation = 10; //10 m min separation of different sites

int site_number = 0; //总共的地点数量
ros::Publisher marker_array_pub; // visualization


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
/**
 * @description: 将无人机的commitment信息的marker压入 &markerArray, 主要用于可视化
 * @param {MarkerArray} &markerArray
 * @param {Commitment} commitment
 * @param {Vector3d} _pos_drone
 * @return {*}
 */
void generateCommitmentMarker(visualization_msgs::MarkerArray &markerArray, prometheus_msgs::Commitment commitment, Eigen::Vector3d _pos_drone,int uavId)
{
    // generate commitmentMarker
    visualization_msgs::Marker commitmentMarker;
    commitmentMarker.header.frame_id = "/world";                        // inertial frame
    commitmentMarker.header.stamp = ros::Time::now();                   //如果使用ros::Time::now()或者其他非零值，rviz将仅仅显示距离当前时间很近的marker，其中足够近依据的是TF。然而对于0时间，不管是不是当前时间，都会显示marker。
    commitmentMarker.ns = "commitmentMarker_" + std::to_string(uavId); // Set the namespace and id for this marker.  This serves to create a unique ID  51, Any marker sent with the same namespace and id will overwrite the old one
    commitmentMarker.lifetime = ros::Duration();
    // commitmentMarker.frame_locked = true;
    commitmentMarker.type = visualization_msgs::Marker::SPHERE;
    commitmentMarker.action = visualization_msgs::Marker::ADD; //// Set the marker action.  Options are ADD, DELETE, and new in ROS Indigo: 3 (DELETEALL)

    if (commitment.commitmentState != COMMITTED)
    {
        commitmentMarker.color.r = 255; // RGBA color,
        commitmentMarker.color.g = 255;
        commitmentMarker.color.b = 255;
        commitmentMarker.color.a = colorTransparency;
    }
    else
    {
    
        commitmentMarker.color.r = 255; // RGBA color,
        commitmentMarker.color.g = 255;
        commitmentMarker.color.b = 255;
        commitmentMarker.color.a = colorTransparency;

        ros::param::get("site_number", site_number);
        for (int i = 1; i <= site_number; i++)
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
            if(commitmentSiteposMatch(temp,commitment))
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
    commitmentMarker.pose.position.x = _pos_drone[0];
    commitmentMarker.pose.position.y = _pos_drone[1];
    commitmentMarker.pose.position.z = _pos_drone[2];
    // Set the scale of the marker -- 1x1x1 here means 1m on a side
    commitmentMarker.scale.x = 2.0;
    commitmentMarker.scale.y = 2.0;
    commitmentMarker.scale.z = 2.0;

    markerArray.markers.push_back(commitmentMarker);
}
/**
 * @description: 将无人机的uav_id压入markerArray，主要用于可视化
 * @param {MarkerArray} &markerArray
 * @param {Vector3d} _pos_drone
 * @param {int} uavId
 * @return {*}
 */
void generate_uav_idMarker(visualization_msgs::MarkerArray &markerArray, Eigen::Vector3d _pos_drone, int uavId)
{
    // generate uavIdMarker
    visualization_msgs::Marker uavIdMarker;
    uavIdMarker.header.frame_id = "/world";                        // inertial frame
    uavIdMarker.header.stamp = ros::Time::now();                   //如果使用ros::Time::now()或者其他非零值，rviz将仅仅显示距离当前时间很近的marker，其中足够近依据的是TF。然而对于0时间，不管是不是当前时间，都会显示marker。
    uavIdMarker.ns = "uavIdMarker_" + std::to_string(uavId); // Set the namespace and id for this marker.  This serves to create a unique ID  51, Any marker sent with the same namespace and id will overwrite the old one
    uavIdMarker.lifetime = ros::Duration();
    // uavIdMarker.frame_locked = true;
    uavIdMarker.type = visualization_msgs::Marker::TEXT_VIEW_FACING;
    uavIdMarker.action = visualization_msgs::Marker::ADD; //// Set the marker action.  Options are ADD, DELETE, and new in ROS Indigo: 3 (DELETEALL)
    uavIdMarker.pose.orientation.w = 1.0;

    uavIdMarker.color.r = 0; // RGBA color,
    uavIdMarker.color.g = 0;
    uavIdMarker.color.b = 0;
    uavIdMarker.color.a = 0.9;

    // Set the pose of the marker.  This is a full 6DOF pose relative to the frame/time specified in the header
    uavIdMarker.pose.position.x = _pos_drone[0];
    uavIdMarker.pose.position.y = _pos_drone[1];
    uavIdMarker.pose.position.z = _pos_drone[2];
    // Set the scale of the marker -- 1x1x1 here means 1m on a side
    //uavIdMarker.scale.x = 2.0;
    //uavIdMarker.scale.y = 2.0;
    uavIdMarker.scale.z = 2.0;

    ostringstream str;
    str << uavId;

    uavIdMarker.text = str.str();

    markerArray.markers.push_back(uavIdMarker);
}


#endif