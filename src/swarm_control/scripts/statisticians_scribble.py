#!/usr/bin/python3
# -*- coding:utf-8  -*-
'''
Author: lcf
Date: 2022-03-23 23:00:05
LastEditors: lcf
LastEditTime: 2022-03-26 18:34:05
FilePath: /swarm_ws2/src/swarm_control/scripts/statisticians_scribble.py
Description:

'''
import rospy
from std_srvs.srv import Empty
from prometheus_msgs.msg import StatisticiansParchment

from matplotlib import pyplot as plt

import _thread
from matplotlib.animation import FuncAnimation

###global variables

experiment_begin_time = 0

msg_time = 0
total_functional_uav = 0
Sx = 0
Sy = 0
Sz = 0
Sw = 0
S_site = [0,0,0,0,0,0,0,0,0,0,0] #TODO

site_number = 0
# sites = []  # [x,y,z,quality]

#plot related
fig,ax = plt.subplots()
ln, = plt.plot([], [], 'ro')

timeList = []
dataList = []


###global variables

ax.set_ylim(0, 1) #TODO
ax.set_xlim(0, 600) #TODO 5min

fig.suptitle("Experiment")
ax.set_ylabel("percentage")
ax.set_xlabel("time")

# fig.grid(False)

def updateParamInfo():
    global experiment_begin_time
    global site_number
    # global sites

    experiment_begin_time = rospy.get_param('/experiment_begin_time')
    site_number = rospy.get_param('/site_number')
    # for i in range(1, site_number+1):
    #     site_posx = rospy.get_param('/site_posx_{i}')
    #     site_posy = rospy.get_param('/site_posy_{i}')
    #     site_posz = rospy.get_param('/site_posz_{i}')
    #     site_quality = rospy.get_param('/site_quality_{i}')
    #     sites.append([site_posx, site_posy, site_posz, site_quality])



def getStatisticianMessage_cb(msg):
    global msg_time
    global total_functional_uav
    global Sx
    global Sy
    global Sz
    global Sw
    global S_site
    
    global experiment_begin_time
    global site_number
    # global sites
    
    global timeList
    global dataList

    msg_time = msg.header.stamp.secs - experiment_begin_time
    total_functional_uav = msg.total_functional_uav
    Sx = msg.Sx
    Sy = msg.Sy
    Sz = msg.Sz
    Sw = msg.Sw
    
    updateParamInfo()
    
    S_site.clear() # clear list before updated
    for i in range(0,site_number):
        S_site.append(msg.S_site[i])
    timeList.append(msg_time)
    dataList.append(S_site[0]) #TODO
    rospy.loginfo("[Sx,Sy,Sz,Sw,total_functional_uav]: [%d, %d, %d, %d, %d]",
                  Sx, Sy, Sz, Sw, total_functional_uav)


def updatePlotFunc(arg):
    global site_number
    global dataList
    global msg_time
    
    print("Updating plot function: ")
    print("dataList")
    print(dataList)
    print("timeList")
    print(timeList)
    ln.set_data(timeList, dataList)
    return ln,

def plotThread():
    print("Plot thread\n")
    ani = FuncAnimation(fig, updatePlotFunc,blit=True)
    plt.show()
    # while True:
    #     updatePlotFunc()
    


if __name__ == '__main__':
    rospy.init_node('statisticians_scribble')
    print("statisticians_scribble started\n")
    while experiment_begin_time == 0: #while experiment has not started yet
        updateParamInfo()
    print("experiment started\n")
    rospy.Subscriber("/statisticians_parchment", StatisticiansParchment, getStatisticianMessage_cb)
    plotThread()
    _thread.start_new_thread(rospy.spin, ())
    # rospy.spin()
    # while not rospy.is_shutdown():
    #     print("Statistician's scribble\n")
