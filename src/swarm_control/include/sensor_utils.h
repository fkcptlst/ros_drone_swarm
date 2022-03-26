/*
 * @Author: lcf
 * @Date: 2022-02-03 23:41:09
 * @LastEditors: lcf
 * @LastEditTime: 2022-03-26 13:51:12
 * @FilePath: /swarm_ws2/src/swarm_control/include/sensor_utils.h
 * @Description: 
 * 
 */

#ifndef SENSOR_UTILS_H
#define SENSOR_UTILS_H

double SensorRangeThreshold = 10; //10m sensor range, horizontal

void updateSensorRangeThreshold()
{
    ros::param::get("/sensor_range",SensorRangeThreshold);
}

#endif