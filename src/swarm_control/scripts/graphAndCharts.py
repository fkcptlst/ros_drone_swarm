# -*- coding:utf-8  -*-
from colorText import color

import sys
import rospy
from std_srvs.srv import Empty


def helpFunc():
    print(commandDict)

###
commandDict = {"help":helpFunc}

rospy.init_node('experiment_console')

global site_number
global site

site_number = rospy.get_param('/site_number')
site = [] #[x,y,z,quality]

def updateSiteInfo():
    site_number = rospy.get_param('/site_number')
    for i in range(0,site_number):
        site_posx = rospy.get_param('/site_posx_{i}')
        site_posy = rospy.get_param('/site_posy_{i}')
        site_posz = rospy.get_param('/site_posz_{i}')
        site_quality = rospy.get_param('/site_quality_{i}')
        site.append([site_posx, site_posy, site_posz, site_quality])
        rospy.loginfo("site {i}: [%f, %f, %f, %f]", site_posx, site_posy, site_posz, site_quality)

# def updateCommitmentInfo():




while True:
    try:
        raw = input("$ ")
        arg = raw.split(" ")

        if(len(arg)==1):#without arg
            func = commandDict[arg[0]]
            func()
            #print("1")
        else:
            func = commandDict[arg[0]]
            func(arg[1:])
            #print(">1")
    except TypeError:
        print(color("red","ERR:")+"argument error")
    except KeyError:
        print(color("red","ERR:")+"command '"+arg[0]+"' not found")
