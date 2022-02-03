/*
 * @Author: lcf
 * @Date: 2022-02-03 23:23:24
 * @LastEditors: lcf
 * @LastEditTime: 2022-02-04 01:05:43
 * @FilePath: /swarm_ws2/src/swarm_control/include/visualisation_utils.h
 * @Description: 
 * 
 */
#ifndef __VISUALISATION_UTILS_H
#define __VISUALISATION_UTILS_H

struct
{
    float r;
    float g;
    float b;
    float a;
}colorlist[] = {
    {255,0,0,0.8}, //红
    {0,255,0,0.8}, //绿
    {0,0,255,0.8}, //蓝
    {255,255,0,0.8},
    {255,0,0,255.8},
    {0,255,255,0.8},
    {255,0,0,0.8},
    {0,255,0,0.8},
    {0,0,255,0.8},
    {255,255,0,0.8},
    {255,0,0,255.8},
    {0,255,255,0.8},
    {255,0,0,0.8},
    {0,255,0,0.8},
    {0,0,255,0.8},
    {255,255,0,0.8},
    {255,0,0,255.8},
    {0,255,255,0.8}
}; //stores some pretty colors

#endif