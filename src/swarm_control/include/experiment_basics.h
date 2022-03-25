/*
 * @Author: lcf
 * @Date: 2022-03-25 15:27:25
 * @LastEditors: lcf
 * @LastEditTime: 2022-03-25 22:36:45
 * @FilePath: /swarm_ws2/src/swarm_control/include/experiment_basics.h
 * @Description: useful datastructures, constants, and functions
 *
 */
#ifndef EXPERIMENT_BASICS_H
#define EXPERIMENT_BASICS_H

#include <vector>

using namespace std;

const float COLLISION_AVOIDANCE_COMMRANGE_THRESHOLD = 30.0; // 30m collision avoidance comm range
const float VOTING_COMMRANGE_THRESHOLD = 60.0;              // XXX 60m voting comm range

const float SiteMinSeparationThreshold = 20.0;    // 20m min site separation
const float WaypointMinSeparationThreshold = 3.0; // 3m min waypoint separation

const double CruiseHeight = 5.0; // 10m of cruise height
const int boundaryOffset = 70;   // TODO need adjust: 50 meters of boundary offset

enum
{
    UNCOMMITTED, // only likely to occur in the very beginning of the experiment
    POLLING,
    COMMITTED
};

typedef struct Site
{
    Eigen::Vector3d sitePos;
    float quality;
    Site()
    {
        sitePos.Zero();
        quality = 0.0f;
    }
    Site(double x, double y, double z,float q)
    {
        sitePos[0] = x;
        sitePos[1] = y;
        sitePos[2] = z;
        quality = q;
    }
    bool operator==(Site &b) // if two sites are close enough, then consider them to be the same
    {
        if ((sitePos - b.sitePos).squaredNorm() <= SiteMinSeparationThreshold * SiteMinSeparationThreshold)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    bool operator!=(Site &b) // if two sites are close enough, then consider them to be the same
    {
        if ((sitePos - b.sitePos).squaredNorm() > SiteMinSeparationThreshold * SiteMinSeparationThreshold)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    // void operator=

} Site;

typedef struct Experiment_params
{
    int site_number;
    vector<Site> sites;
    double site_radius;

    double sensor_noise_stdev;
    double sensorRange;

    Experiment_params() // constructor
    {
        site_number = 0;
        site_radius = 10;
        sensor_noise_stdev = 0.1;
        sensorRange = 10;
    }
} Experiment_params;

typedef struct TimeTriggeredEvent //for lab_assistant.cpp, time triggered to alter experiment parameters
{
    ros::Time trigged_time;
    bool executed;
    void (*handler)();

    TimeTriggeredEvent() //constructor
    {
        trigged_time = ros::Time(0);
        executed = false;
    }
} TimeTriggeredEvent;

#endif