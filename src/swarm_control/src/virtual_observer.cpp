/*
 * @Author: lcf
 * @Date: 2022-01-31 21:34:24
 * @LastEditors: lcf
 * @LastEditTime: 2022-02-01 17:55:02
 * @FilePath: /swarm_ws2/src/swarm_control/src/virtual_observer.cpp
 * @Description: This node observes position of all vehicles and unicasts relevant info to each vehicle, modified from swarm_controller
 * 
 */

#include "swarm_controller.h"

using namespace std;

const float COMMRANGE_THRESHOLD = 30.0; //30m comm range

ros::Subscriber observed_drone_state_sub[MAX_UAV_NUM+1]; //用于订阅
ros::Publisher observed_drone_state_pub[MAX_UAV_NUM+1]; //用于发布邻居信息

prometheus_msgs::DroneState observedDroneStateList[MAX_UAV_NUM+1];

Eigen::Vector3f observed_dronePos[MAX_UAV_NUM+1]; //drone position vector
uint32_t observed_drone_msgseq[MAX_UAV_NUM+1]; //msg counter, 防止使用初始的0位置导致无人机死锁

void topicUpdate_cb(const prometheus_msgs::DroneState::ConstPtr& state_msg, int drone_id);
void globalUpdate_cb(const ros::TimerEvent &e);
void initialize();

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>主 函 数<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
int main(int argc, char **argv)
{
    ros::init(argc, argv, "virtual_observer");
    ros::NodeHandle nh("~");
    cout << ">>>>>>>>>>>>>>>>>>>>>>>>>>>>Virtual Observer<<<<<<<<<<<<<<<<<<<<<<<<< "<< endl;
    // 读取参数，变量初始化
    init(nh);

    // 建议控制频率 ： 10 - 50Hz, 控制频率取决于控制形式，若控制方式为速度或加速度应适当提高频率
    ros::Rate rate(controller_hz);

    if(flag_printf)
    {
        printf_param();
    }

    //【订阅】订阅所有飞机的状态信息

    for(int i = 1; i <= swarm_num_uav; i++) 
    {
        observed_drone_state_sub[i] = nh.subscribe<prometheus_msgs::DroneState>("/uav"+std::to_string(i)+ "/prometheus/drone_state", 10, boost::bind(topicUpdate_cb,_1,i));
        observed_drone_state_pub[i] = nh.advertise<prometheus_msgs::DroneState>("/uav"+std::to_string(i)+ "/prometheus/commBuffer", 10);
    }

    ros::Timer debug_timer = nh.createTimer(ros::Duration(10.0), debug_cb);
    ros::Timer globalUpdate_timer = nh.createTimer(ros::Duration(0.5), globalUpdate_cb); //update per 0.5 seconds

    ros::spin();

    return 0;
}

void initialize() 
{
    for(int i = 0; i <= MAX_UAV_NUM; i++) 
    {
        observed_drone_msgseq[i] = 0;
        observed_dronePos[i] = Eigen::Vector3f::Zero();
    }
}
void topicUpdate_cb(const prometheus_msgs::DroneState::ConstPtr& state_msg, int drone_id) //更新每个无人机信息的callback function
{
    observedDroneStateList[drone_id] = *state_msg;
    observed_drone_msgseq[drone_id] = state_msg->header.seq;
    observed_dronePos[drone_id]  = Eigen::Vector3f(state_msg->position[0], state_msg->position[1], state_msg->position[2]); //get position
}
void globalUpdate_cb(const ros::TimerEvent &e) //publish更新所有无人机信息的callback function
{
    for(int i = 1; i <= swarm_num_uav; i++)
    {
        for(int j = i; j <= swarm_num_uav; j++)
        {
            if(observed_drone_msgseq[i] != 0 && observed_drone_msgseq[j] != 0)//check validity
            {
                if((observed_dronePos[j] - observed_dronePos[i]).squaredNorm() <= COMMRANGE_THRESHOLD*COMMRANGE_THRESHOLD) //j relative to i, vec_j - vec_i, within range
                {
                    observed_drone_state_pub[i].publish(observedDroneStateList[j]); //【发布】 邻居无人机drone_state
                    observed_drone_state_pub[j].publish(observedDroneStateList[i]);
                }
            }
        }
    }
}
