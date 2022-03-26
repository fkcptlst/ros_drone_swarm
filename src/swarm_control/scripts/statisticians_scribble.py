#!/usr/bin/python3
# -*- coding:utf-8  -*-
'''
Author: lcf
Date: 2022-03-23 23:00:05
LastEditors: lcf
LastEditTime: 2022-03-26 13:50:45
FilePath: /swarm_ws2/src/swarm_control/scripts/statisticians_scribble.py
Description: 

'''
import rospy
from std_srvs.srv import Empty
from prometheus_msgs.msg import StatisticiansParchment


###

experiment_begin_time = 0

total_functional_uav = 0
Sx = 0
Sy = 0
Sz = 0
Sw = 0

site_number = 0
sites = [] #[x,y,z,quality]

def updateParamInfo():
    global experiment_begin_time
    global site_number
    global sites

    experiment_begin_time = rospy.get_param('/experiment_begin_time')
    site_number = rospy.get_param('/site_number')
    for i in range(0,site_number):
        site_posx = rospy.get_param('/site_posx_{i}')
        site_posy = rospy.get_param('/site_posy_{i}')
        site_posz = rospy.get_param('/site_posz_{i}')
        site_quality = rospy.get_param('/site_quality_{i}')
        sites.append([site_posx, site_posy, site_posz, site_quality])
        rospy.loginfo("site {i}: [%d, %d, %d, %f]", site_posx, site_posy, site_posz, site_quality)

def getStatisticianMessage_cb(msg):
    global total_functional_uav
    global Sx
    global Sy
    global Sz
    global Sw

    total_functional_uav = msg.total_functional_uav
    Sx = msg.Sx
    Sy = msg.Sy
    Sz = msg.Sz
    Sw = msg.Sw
    rospy.loginfo("[Sx,Sy,Sz,Sw,total_functional_uav]: [%d, %d, %d, %d, %d]", Sx, Sy, Sz, Sw, total_functional_uav)


if __name__ == '__main__':
    rospy.init_node('statisticians_scribble')
    print("statisticians_scribble started\n")
    rospy.Subscriber("/statisticians_parchment", StatisticiansParchment, getStatisticianMessage_cb)
    rospy.spin()
    # while not rospy.is_shutdown():
    #     print("Statistician's scribble\n")
