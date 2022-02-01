/*
 * @Author: lcf
 * @Date: 2022-02-01 19:03:19
 * @LastEditors: lcf
 * @LastEditTime: 2022-02-01 22:38:28
 * @FilePath: /swarm_ws2/src/swarm_control/include/uav_planner.h
 * @Description: 
 * 
 */
#ifndef UAV_PLANNER_H
#define UAV_PLANNER_H

#include "swarm_controller.h"

#define getNthBit(num,n) (((num)>>(n-1))&1)
#define setNthBitTo1(num,n) (((num)|(1<<(n-1))))
#define setNthBitTo0(num,n) (((num)&(0xff - (1<<(n-1)))))

const float COMMRANGE_THRESHOLD = 30.0; //30m comm range

const float SiteMinSeparationThreshold = 20.0; //20m min site separation

enum 
{
    UNCOMMITTED, //only likely to occur in the very beginning of the experiment
    POLLING,
    COMMITTED
};

typedef struct NeighbourDroneState 
{
    prometheus_msgs::DroneState state;
    uint8_t age; //记录信息的衰老情况
    NeighbourDroneState()//constructor
    {
        age = 0; 
    }
}NeighbourDroneState;

typedef struct Site
{
    Eigen::Vector3f sitePos;
    float quality;
    bool validFlg;
    Site()
    {
        sitePos.Zero();
        quality = 0.0f;
        validFlg = false;
    }
    bool operator==(Site &b) //if two sites are close enough, then consider them to be the same
    {
        if((sitePos - b.sitePos).squaredNorm() <= SiteMinSeparationThreshold*SiteMinSeparationThreshold)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    bool operator!=(Site &b) //if two sites are close enough, then consider them to be the same
    {
        if((sitePos - b.sitePos).squaredNorm() > SiteMinSeparationThreshold*SiteMinSeparationThreshold)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    //void operator=
    
}Site;

#endif /* UAV_PLANNER_H */