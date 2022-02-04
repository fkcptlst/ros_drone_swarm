/*
 * @Author: lcf
 * @Date: 2022-02-03 23:41:09
 * @LastEditors: lcf
 * @LastEditTime: 2022-02-04 15:07:32
 * @FilePath: /swarm_ws2/src/swarm_control/include/sensor_utils.h
 * @Description: 
 * 
 */

#ifndef SENSOR_UTILS_H
#define SENSOR_UTILS_H

double SensorRangeThreshold = 10; //10m sensor range, horizontal

void updateSensorRangeThreshold()
{
    ros::param::get("sensorRange",SensorRangeThreshold);
}

#endif