/*
 * @Author: lcf
 * @Date: 2022-02-03 20:25:28
 * @LastEditors: lcf
 * @LastEditTime: 2022-03-25 16:13:03
 * @FilePath: /swarm_ws2/src/swarm_control/src/render_arena.cpp
 * @Description:
 *
 */
#include <iostream>
#include <ros/ros.h>
#include <visualization_msgs/Marker.h>
#include <visualization_msgs/MarkerArray.h>

#include "visualisation_utils.h"

using namespace std;

double SiteScale = 10;

/**
    <param name="site_number" value="3"/>

    <param name="site_posx_1" value="-30"/>
    <param name="site_posy_1" value="10"/>
    <param name="site_posz_1" value="0"/>
    <param name="site_quality_1" value="0.4"/>
 */

void marker_array_cb(const ros::TimerEvent &e)
{
    visualization_msgs::MarkerArray markerArray;

    // generate ground plane
    visualization_msgs::Marker groundPlaneMarker;

    groundPlaneMarker.header.frame_id = "/world";      // inertial frame
    groundPlaneMarker.header.stamp = ros::Time::now(); //如果使用ros::Time::now()或者其他非零值，rviz将仅仅显示距离当前时间很近的marker，其中足够近依据的是TF。然而对于0时间，不管是不是当前时间，都会显示marker。
    groundPlaneMarker.ns = "groundPlaneMarker";        // Set the namespace and id for this marker.  This serves to create a unique ID  51, Any marker sent with the same namespace and id will overwrite the old one
    groundPlaneMarker.lifetime = ros::Duration();
    // groundPlaneMarker.frame_locked = true;
    groundPlaneMarker.type = visualization_msgs::Marker::CUBE;
    groundPlaneMarker.action = visualization_msgs::Marker::ADD; //// Set the marker action.  Options are ADD, DELETE, and new in ROS Indigo: 3 (DELETEALL)
    groundPlaneMarker.color.r = 50.0;                          // RGBA color,
    groundPlaneMarker.color.g = 50.0;
    groundPlaneMarker.color.b = 50.0;
    groundPlaneMarker.color.a = 0.4; // transparency, betw 0 and 1

    // Set the pose of the marker.  This is a full 6DOF pose relative to the frame/time specified in the header
    groundPlaneMarker.pose.position.x = 0.0;
    groundPlaneMarker.pose.position.y = 0.0;
    groundPlaneMarker.pose.position.z = -0.1; //XXX
    // Set the scale of the marker -- 1x1x1 here means 1m on a side
    groundPlaneMarker.scale.x = 200.0;
    groundPlaneMarker.scale.y = 100.0;
    groundPlaneMarker.scale.z = 0.0;

    markerArray.markers.push_back(groundPlaneMarker);

    // generate site
    ros::param::get("site_radius",SiteScale);
    ros::param::get("site_number", site_number);
    for (int i = 1; i <= site_number; i++)
    {
        double site_posx, site_posy, site_posz, site_quality;
        ros::param::get("site_posx_" + std::to_string(i), site_posx);
        ros::param::get("site_posy_" + std::to_string(i), site_posy);
        ros::param::get("site_posz_" + std::to_string(i), site_posz);
        ros::param::get("site_quality_" + std::to_string(i), site_quality);

        if(site_quality > 0.000001) //site isn't zero，这么写防止double没对齐，如果site清除，则将quality置为0
        {
            visualization_msgs::Marker siteMarker;
            siteMarker.header.frame_id = "/world";      // inertial frame
            siteMarker.header.stamp = ros::Time::now(); //如果使用ros::Time::now()或者其他非零值，rviz将仅仅显示距离当前时间很近的marker，其中足够近依据的是TF。然而对于0时间，不管是不是当前时间，都会显示marker。
            siteMarker.ns = "siteMarker";        // Set the namespace and id for this marker.  This serves to create a unique ID  51, Any marker sent with the same namespace and id will overwrite the old one
            siteMarker.lifetime = ros::Duration(1.0);
            siteMarker.id = i;
            // siteMarker.frame_locked = true;
            siteMarker.type = visualization_msgs::Marker::CYLINDER;
            siteMarker.action = visualization_msgs::Marker::ADD; //// Set the marker action.  Options are ADD, DELETE, and new in ROS Indigo: 3 (DELETEALL)
            siteMarker.color.r = colorlist[i-1].r;                          // RGBA color,
            siteMarker.color.g = colorlist[i-1].g;
            siteMarker.color.b = colorlist[i-1].b;
            siteMarker.color.a = colorlist[i-1].a;

            // Set the pose of the marker.  This is a full 6DOF pose relative to the frame/time specified in the header
            siteMarker.pose.position.x = site_posx;
            siteMarker.pose.position.y = site_posy;
            siteMarker.pose.position.z = site_posz;
            // Set the scale of the marker -- 1x1x1 here means 1m on a side
            siteMarker.scale.x = SiteScale*2; //XXX
            siteMarker.scale.y = SiteScale*2;
            siteMarker.scale.z = 0.1;

            markerArray.markers.push_back(siteMarker);
        }

    }

    marker_array_pub.publish(markerArray);
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "render_arena");
    ros::NodeHandle nh("~");

    marker_array_pub = nh.advertise<visualization_msgs::MarkerArray>("/render_arena_topic", 10);

    ros::Timer marker_array_timer = nh.createTimer(ros::Duration(1.0), marker_array_cb);

    cout << "finished starting render_arena" << endl;

    ros::spin();
}