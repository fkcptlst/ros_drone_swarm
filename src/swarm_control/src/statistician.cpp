/*
 * @Author: lcf
 * @Date: 2022-03-25 23:41:46
 * @LastEditors: lcf
 * @LastEditTime: 2022-03-26 18:31:13
 * @FilePath: /swarm_ws2/src/swarm_control/src/statistician.cpp
 * @Description: node to process global experiment data
 *
 */

#include "swarm_controller.h"
#include "uav_planner.h"
#include "experiment_basics.h"

#define DEBUG_ON
#include "debug.h"

#include <nav_msgs/Odometry.h>
#include <prometheus_msgs/StatisticiansParchment.h>

using namespace std;

ros::Subscriber Drone_state_sub[MAX_UAV_NUM + 1]; //用于订阅drone_state
ros::Subscriber Commitment_sub[MAX_UAV_NUM + 1];  //用于订阅commitment

ros::Subscriber Gazebo_odom_sub[MAX_UAV_NUM + 1]; //用于订Odometry

ros::Publisher parchment_pub; // transmit to statisticians_scribble.py

prometheus_msgs::DroneState DroneStateList[MAX_UAV_NUM + 1];
prometheus_msgs::Commitment CommitmentList[MAX_UAV_NUM + 1];
nav_msgs::Odometry GazeboOdomList[MAX_UAV_NUM + 1];

bool DroneStateValidFlgList[MAX_UAV_NUM + 1]; //用于标记是否有效，避免发布已经失效的无人机信息

Eigen::Vector3d dronePos[MAX_UAV_NUM + 1]; // drone position vector

void drone_state_topicUpdate_cb(const prometheus_msgs::DroneState::ConstPtr &state_msg, int drone_id);
void commitment_topicUpdate_cb(const prometheus_msgs::Commitment::ConstPtr &commitment_msg, int drone_id);
void odomUpdate_cb(const nav_msgs::Odometry::ConstPtr &odom_msg, int drone_id); //更新每个无人机pos信息的callback function

void globalUpdate_cb(const ros::TimerEvent &e);
void initialize();

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>主 函 数<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
int main(int argc, char **argv)
{
    ros::init(argc, argv, "statistician");
    ros::NodeHandle nh("~");
    cout << ">>>>>>>>>>>>>>>>>>>>>>>>>>>>statistician<<<<<<<<<<<<<<<<<<<<<<<<< " << endl;
    // 读取参数，变量初始化
    init(nh);
    for (int i = 0; i <= MAX_UAV_NUM; i++)
    {
        DroneStateValidFlgList[i] = false;
    }

    // 建议控制频率 ： 10 - 50Hz, 控制频率取决于控制形式，若控制方式为速度或加速度应适当提高频率
    ros::Rate rate(controller_hz);

    if (flag_printf)
    {
        printf_param();
    }

    //【订阅】订阅所有飞机的信息
    for (int i = 1; i <= swarm_num_uav; i++)
    {
        Drone_state_sub[i] = nh.subscribe<prometheus_msgs::DroneState>("/uav" + std::to_string(i) + "/prometheus/drone_state", 3, boost::bind(drone_state_topicUpdate_cb, _1, i)); // TODO
        Gazebo_odom_sub[i] = nh.subscribe<nav_msgs::Odometry>("/uav" + std::to_string(i) + "/prometheus/ground_truth", 3, boost::bind(odomUpdate_cb, _1, i));                      // TODO
        Commitment_sub[i] = nh.subscribe<prometheus_msgs::Commitment>("/uav" + std::to_string(i) + "/prometheus/commitment", 10, boost::bind(commitment_topicUpdate_cb, _1, i));
    }

    //【发布】prometheus_msgs::StatisticiansParchment
    parchment_pub = nh.advertise<prometheus_msgs::StatisticiansParchment>("/statisticians_parchment", 1); //queue size = 1

    ros::Timer debug_timer = nh.createTimer(ros::Duration(10.0), debug_cb);
    ros::Timer globalUpdate_timer = nh.createTimer(ros::Duration(1), globalUpdate_cb); // TODO status update per 1 seconds, no less than 1 second

    ros::spin();

    return 0;
}

void initialize()
{
    for (int i = 0; i <= MAX_UAV_NUM; i++)
    {
        dronePos[i] = Eigen::Vector3d::Zero();
    }
}
void odomUpdate_cb(const nav_msgs::Odometry::ConstPtr &odom_msg, int drone_id) //更新每个无人机pos信息的callback function
{
    GazeboOdomList[drone_id] = *odom_msg;
    dronePos[drone_id] = Eigen::Vector3d(odom_msg->pose.pose.position.x, odom_msg->pose.pose.position.y, odom_msg->pose.pose.position.z);
}
void drone_state_topicUpdate_cb(const prometheus_msgs::DroneState::ConstPtr &state_msg, int drone_id) //更新每个无人机信息的callback function
{
    DroneStateList[drone_id] = *state_msg;

    if (state_msg->armed == true)                // TODO: need further check
        DroneStateValidFlgList[drone_id] = true; //标记获得新消息有效
    else
        DroneStateValidFlgList[drone_id] = false; //
}
void commitment_topicUpdate_cb(const prometheus_msgs::Commitment::ConstPtr &commitment_msg, int drone_id)
{
    CommitmentList[drone_id] = *commitment_msg;
}

bool compareSiteQuality(const Site a, const Site b) //used for vector sorting, desc
{
    return a.quality > b.quality;
}

void globalUpdate_cb(const ros::TimerEvent &e) // publish更新所有无人机信息的callback function
{
    vector<Site> sites; //original
    vector<Site> sorted_sites; //sorted_sites
    // get site information
    int site_number = 0;
    ros::param::get("/site_number", site_number); // update max site number

    for (int i = 1; i <= site_number; i++)
    {
        double site_posx, site_posy, site_posz;
        float site_quality;
        ros::param::get("/site_posx_" + std::to_string(i), site_posx);
        ros::param::get("/site_posy_" + std::to_string(i), site_posy);
        ros::param::get("/site_posz_" + std::to_string(i), site_posz);
        ros::param::get("/site_quality_" + std::to_string(i), site_quality);

        Site site(site_posx, site_posy, site_posz, site_quality);
        sites.push_back(site);
    }
    sorted_sites = sites;
    sort(sorted_sites.begin(), sorted_sites.end(), compareSiteQuality); // sort by quality, desc

    prometheus_msgs::StatisticiansParchment parchment;
    int total_functional_uav = 0; // reset before update
    int Sx = 0;                   // num of committed to current best
    int Sy = 0;                   // num of committed to previous
    int Sz = 0;                   // num of polling
    int Sw = 0;                   // num of others

    for (int i = 1; i <= swarm_num_uav; i++)
    {
        if (DroneStateValidFlgList[i] == true)
        {
            total_functional_uav++;
            if (CommitmentList[i].commitmentState == POLLING)
            {
                Sz++;
            }
            else // committed
            {
                Site current(CommitmentList[i].sitePos[0], CommitmentList[i].sitePos[1], CommitmentList[i].sitePos[2], CommitmentList[i].quality);
                if(current == sorted_sites[0]) //current best
                {
                    Sx++;
                }
                else if(current == sorted_sites[1])
                {
                    Sy++;
                }
                else
                {
                    Sw++;
                }

                for (int i = 1; i <= site_number; i++)
                {
                    if(current == sites[i])
                    {
                        parchment.S_site[i]++;
                        break;
                    }
                }
            }
            // generateCommitmentMarker(markerArray, CommitmentList[i], dronePos[i], i);
            // generate_uav_idMarker(markerArray, dronePos[i], i);
        }
        // else
        // {
        //     ROS_INFO("uav_id: %d is disarmed", i);
        // }
    }
    /*
    for(int i = 0; i <= MAX_UAV_NUM; i++)
    {
        DroneStateValidFlgList[i] = false;
    }
    */
    // It sucks
    parchment.total_functional_uav = total_functional_uav;
    parchment.Sx = Sx;
    parchment.Sy = Sy;
    parchment.Sz = Sz;
    parchment.Sw = Sw;
    parchment.header.stamp = ros::Time::now(); // add timestamp
    parchment_pub.publish(parchment);
}
