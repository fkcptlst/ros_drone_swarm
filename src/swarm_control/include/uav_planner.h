/*
 * @Author: lcf
 * @Date: 2022-02-01 19:03:19
 * @LastEditors: lcf
 * @LastEditTime: 2022-04-04 10:00:32
 * @FilePath: /swarm_ws2/src/swarm_control/include/uav_planner.h
 * @Description: 
 * 
 */
#ifndef UAV_PLANNER_H
#define UAV_PLANNER_H

#include "swarm_controller.h"
#include <prometheus_msgs/Commitment.h>
#include <prometheus_msgs/SensorMsg.h>

#include "experiment_basics.h"

// #define getNthBit(num,n) (((num)>>(n-1))&1)
// #define setNthBitTo1(num,n) (((num)|(1<<(n-1))))
// #define setNthBitTo0(num,n) (((num)&(0xff - (1<<(n-1)))))

typedef struct NeighbourDroneState 
{
    prometheus_msgs::DroneState state;
    long long age; //记录信息的衰老情况
    NeighbourDroneState()//constructor
    {
        age = -1; //default is -1,invalid
        //0 is the newest state
        //each time period age++
    }
}NeighbourDroneState;


#endif /* UAV_PLANNER_H */