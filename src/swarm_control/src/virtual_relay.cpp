/*
 * @Author: lcf
 * @Date: 2022-01-31 21:34:24
 * @LastEditors: lcf
 * @LastEditTime: 2022-02-04 17:40:58
 * @FilePath: /swarm_ws2/src/swarm_control/src/virtual_relay.cpp
 * @Description: This node observes position of all vehicles and unicasts relevant info to each vehicle, modified from swarm_controller
 * 
 */

#include "swarm_controller.h"
#include "uav_planner.h"
#include "visualisation_utils.h"

using namespace std;


ros::Subscriber observed_drone_state_sub[MAX_UAV_NUM+1]; //用于订阅drone_state
ros::Subscriber observed_commitment_sub[MAX_UAV_NUM+1]; //用于订阅commitment

ros::Publisher observed_drone_state_pub[MAX_UAV_NUM+1]; //用于发布邻居drone_state信息
ros::Publisher observed_commitment_pub[MAX_UAV_NUM+1]; //用于发布邻居commitment信息

prometheus_msgs::DroneState observedDroneStateList[MAX_UAV_NUM+1];
prometheus_msgs::Commitment observedCommitmentList[MAX_UAV_NUM+1];

bool observedDroneStateValidFlgList[MAX_UAV_NUM+1]; //用于标记是否有效，避免重复发布历史信息
bool observedCommitmentValidFlgList[MAX_UAV_NUM+1]; //用于标记是否有效，避免重复发布历史信息


Eigen::Vector3d observed_dronePos[MAX_UAV_NUM+1]; //drone position vector
uint32_t observed_drone_msgseq[MAX_UAV_NUM+1]; //msg counter, 防止使用初始的0位置导致无人机死锁

void drone_state_topicUpdate_cb(const prometheus_msgs::DroneState::ConstPtr& state_msg, int drone_id);
void commitment_topicUpdate_cb(const prometheus_msgs::Commitment::ConstPtr& commitment_msg, int drone_id);

void globalUpdate_cb(const ros::TimerEvent &e);
void initialize();

void updateCommVisualisationMarker();

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>主 函 数<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
int main(int argc, char **argv)
{
    ros::init(argc, argv, "virtual_observer");
    ros::NodeHandle nh("~");
    cout << ">>>>>>>>>>>>>>>>>>>>>>>>>>>>Virtual Observer<<<<<<<<<<<<<<<<<<<<<<<<< "<< endl;
    // 读取参数，变量初始化
    init(nh);
    for(int i = 0; i <= MAX_UAV_NUM; i++)
    {
        observedDroneStateValidFlgList[i] = false;
    }

    // 建议控制频率 ： 10 - 50Hz, 控制频率取决于控制形式，若控制方式为速度或加速度应适当提高频率
    ros::Rate rate(controller_hz);

    if(flag_printf)
    {
        printf_param();
    }

    //【订阅】【发布】订阅所有飞机的信息
    for(int i = 1; i <= swarm_num_uav; i++) 
    {
        observed_drone_state_sub[i] = nh.subscribe<prometheus_msgs::DroneState>("/uav"+std::to_string(i)+ "/prometheus/commBuffer_TX/drone_state", 10, boost::bind(drone_state_topicUpdate_cb,_1,i));
        observed_drone_state_pub[i] = nh.advertise<prometheus_msgs::DroneState>("/uav"+std::to_string(i)+ "/prometheus/commBuffer_RX/drone_state", 1);
        observed_commitment_sub[i] = nh.subscribe<prometheus_msgs::Commitment>("/uav"+std::to_string(i)+ "/prometheus/commBuffer_TX/commitment", 10, boost::bind(commitment_topicUpdate_cb,_1,i));
        observed_commitment_pub[i] = nh.advertise<prometheus_msgs::Commitment>("/uav"+std::to_string(i)+ "/prometheus/commBuffer_RX/commitment", 1);
    }

    //【发布】可视化markerArray
    marker_array_pub = nh.advertise<visualization_msgs::MarkerArray>("/status_visualisation", 10); //TODO

    ros::Timer debug_timer = nh.createTimer(ros::Duration(10.0), debug_cb);
    ros::Timer globalUpdate_timer = nh.createTimer(ros::Duration(), globalUpdate_cb); //update per 0.5 seconds

    ros::spin();

    return 0;
}

void initialize() 
{
    for(int i = 0; i <= MAX_UAV_NUM; i++) 
    {
        observed_drone_msgseq[i] = 0;
        observed_dronePos[i] = Eigen::Vector3d::Zero();
    }
}
void drone_state_topicUpdate_cb(const prometheus_msgs::DroneState::ConstPtr& state_msg, int drone_id) //更新每个无人机信息的callback function
{
    observedDroneStateList[drone_id] = *state_msg;
    observed_drone_msgseq[drone_id] = state_msg->header.seq;
    observed_dronePos[drone_id]  = Eigen::Vector3d(state_msg->position[0], state_msg->position[1], state_msg->position[2]); //get position

    observedDroneStateValidFlgList[drone_id] = true; //标记获得新消息有效
}
void commitment_topicUpdate_cb(const prometheus_msgs::Commitment::ConstPtr& commitment_msg, int drone_id)
{
    observedCommitmentList[drone_id] = *commitment_msg;
    observedCommitmentValidFlgList[drone_id] = true; //标记获得新消息有效
}
void globalUpdate_cb(const ros::TimerEvent &e) //publish更新所有无人机信息的callback function
{
    for(int i = 1; i <= swarm_num_uav; i++)
    {
        for(int j = i; j <= swarm_num_uav; j++)
        {
            if(observed_drone_msgseq[i] != 0 && observed_drone_msgseq[j] != 0 && i!=j)//check validity, and don't send msg to my self
            {
                double squaredDist = (observed_dronePos[j] - observed_dronePos[i]).squaredNorm(); //j relative to i, vec_j - vec_i, within range
                if(squaredDist <= COLLISION_AVOIDANCE_COMMRANGE_THRESHOLD*COLLISION_AVOIDANCE_COMMRANGE_THRESHOLD) 
                {
                    if(observedDroneStateValidFlgList[i] == true)
                    {
                        observed_drone_state_pub[j].publish(observedDroneStateList[i]); //【发布】 邻居无人机drone_state
                    }
                    if(observedDroneStateValidFlgList[j] == true)
                    {
                        observed_drone_state_pub[i].publish(observedDroneStateList[j]);
                    }
                }
                if(squaredDist <= VOTING_COMMRANGE_THRESHOLD*VOTING_COMMRANGE_THRESHOLD)
                {
                    if(observedCommitmentValidFlgList[i] == true)
                    {
                        observed_commitment_pub[j].publish(observedCommitmentList[i]); //【发布】 邻居无人机commitment
                    }
                    if(observedCommitmentValidFlgList[j] == true)
                    {
                        observed_commitment_pub[i].publish(observedCommitmentList[j]);
                    }
                }
            }
        }
    }
    for(int i = 0; i <= MAX_UAV_NUM; i++)
    {
        observedDroneStateValidFlgList[i] = false;
        observedCommitmentValidFlgList[i] = false;
    }
}

/**
 * @description: 通信可视化
 * @param {*}
 * @return {*}
 */
void updateCommVisualisationMarker()//TODO
{

}