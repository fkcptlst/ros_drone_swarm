/*
 * @Author: lcf
 * @Date: 2022-02-03 16:54:57
 * @LastEditors: lcf
 * @LastEditTime: 2022-02-04 19:30:47
 * @FilePath: /swarm_ws2/src/swarm_control/src/virtual_sensor.cpp
 * @Description: 虚拟传感器节点
 * 
 */
#include "swarm_controller.h"
#include "uav_planner.h"
#include <random>
#include <vector>
#include <algorithm>
#include <prometheus_msgs/SensorMsg.h>

#include "sensor_utils.h"

using namespace std;

ros::Publisher sensorData_pub; //发布sensor data

Eigen::Vector3d navTargetPos; // NAVIGATION VARIABLE: L_t

void sensorData_pub_cb(const ros::TimerEvent &e); //定时更新传感器


bool with_prob_of(float prob);

int site_number = 0;

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>主 函 数<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
int main(int argc, char **argv)
{
    ros::init(argc, argv, "virtual_sensor");
    ros::NodeHandle nh("~");

    // 读取自己的飞行参数，变量初始化
    init(nh);

    // 建议控制频率 ： 10 - 50Hz, 控制频率取决于控制形式，若控制方式为速度或加速度应适当提高频率
    ros::Rate rate(controller_hz);

    if (flag_printf)
    {
        printf_param();
    }
    //【发布】commitment相关信息，用于self
    sensorData_pub = nh.advertise<prometheus_msgs::SensorMsg>(uav_name + "/prometheus/sensorBuffer", 1); // default buffer is 1

    //【订阅】本机状态信息
    drone_state_sub = nh.subscribe<prometheus_msgs::DroneState>(uav_name + "/prometheus/drone_state", 5, drone_state_cb); // update self state
    
    ros::Timer debug_timer = nh.createTimer(ros::Duration(10.0), debug_cb);
    ros::Timer sensorData_pub_Timer = nh.createTimer(ros::Duration(),sensorData_pub_cb); 
    
    cout<<"uav_"<<uav_id<<"sensor finished starting"<<endl;    
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

void sensorData_pub_cb(const ros::TimerEvent &e) //定时更新传感器
{
    //get site information
    ros::param::get("site_number",site_number);

    updateSensorRangeThreshold(); //check if param changed
    
    for (int i = 1; i <= site_number; i++)
    {
        double site_posx, site_posy, site_posz, site_quality;
        ros::param::get("site_posx_" + std::to_string(i), site_posx);
        ros::param::get("site_posy_" + std::to_string(i), site_posy);
        ros::param::get("site_posz_" + std::to_string(i), site_posz);
        ros::param::get("site_quality_" + std::to_string(i), site_quality);

        Eigen::Vector3d site_pos(site_posx, site_posy, site_posz);

        if((pos_drone - site_pos).squaredNorm() <= pos_drone[2]*pos_drone[2] + SensorRangeThreshold*SensorRangeThreshold)//within range
        {
            prometheus_msgs::SensorMsg siteFound;
            siteFound.sitePos[0] = site_posx;
            siteFound.sitePos[1] = site_posy;
            siteFound.sitePos[2] = site_posz;
            siteFound.quality = site_quality;

            siteFound.header.stamp = ros::Time::now();

            sensorData_pub.publish(siteFound);
        }
    }
}
