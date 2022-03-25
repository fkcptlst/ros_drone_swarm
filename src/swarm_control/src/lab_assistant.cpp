/*
 * @Author: lcf
 * @Date: 2022-03-25 12:42:22
 * @LastEditors: lcf
 * @LastEditTime: 2022-03-25 23:03:18
 * @FilePath: /swarm_ws2/src/swarm_control/src/lab_assistant.cpp
 * @Description: a node to control experiment setup
 *
 */
// ros头文件
#include <ros/ros.h>
#include <Eigen/Eigen>
#include <iostream>
// #include <boost/format.hpp>

// topic 头文件
#include <prometheus_msgs/SwarmCommand.h>
#include <prometheus_msgs/DroneState.h>
// #include <geometry_msgs/PoseStamped.h>

#include <string.h>

#include "experiment_basics.h"

#define DEBUG_ON
#include "debug.h"

using namespace std;

#define NODE_NAME "lab_assistant"
#define MAX_NUM 40
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>全 局 变 量<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
int swarm_num_uav;
string uav_name[MAX_NUM + 1];
int uav_id[MAX_NUM + 1];
prometheus_msgs::SwarmCommand swarm_command[MAX_NUM + 1];
ros::Publisher command_pub[MAX_NUM + 1];

Experiment_params currentParams;

int controller_num;
float formation_size;

// bool sim_mode;

vector<TimeTriggeredEvent> eventQueue;

ros::Time experimentBeginTime;

// Eigen::Vector3f virtual_leader_pos;
// Eigen::Vector3f virtual_leader_vel;

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>声 明 函 数<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
TimeTriggeredEvent makeArrangement(int second, void (*_handler)()); // create a time trigger event
void timeEventTasker_cb(const ros::TimerEvent &e);

void broadcastBeginExperiment();
void broadcastEndExperiment();
void set_experiment_parameters(Experiment_params parameters); // set global parameters

//----------------------------------------------------------------
void agenda1(); // experiment schedule 1
void set_params_1();
void set_params_2();

//----------------------------------------------------------------
void agenda2(); // experiment schedule 1

//----------------------------------------------------------------

static struct
{
    string description;
    void (*handler)();
} experimentAgendas[] = {
    {"agenda1", agenda1},
    {"agenda2", agenda2}};

#define experimentAgendas_NUM (sizeof(experimentAgendas) / sizeof(experimentAgendas[0]))

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>主 函 数<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
int main(int argc, char **argv)
{
    ros::init(argc, argv, NODE_NAME);
    ros::NodeHandle nh("~");

    experimentBeginTime = ros::Time(0);

    nh.param<int>("swarm_num_uav", swarm_num_uav, 1);
    // nh.param<bool>("sim_mode", sim_mode, true);

    for (int i = 1; i <= swarm_num_uav; i++)
    {
        //【发布】[publisher] 阵型
        command_pub[i] = nh.advertise<prometheus_msgs::SwarmCommand>("/uav" + std::to_string(i) + "/prometheus/swarm_command_ground", 1);
    }

    //固定的浮点显示
    cout.setf(ios::fixed);
    // setprecision(n) 设显示小数精度为n位
    cout << setprecision(2);
    //左对齐
    cout.setf(ios::left);
    // 强制显示小数点
    cout.setf(ios::showpoint);
    // 强制显示符号
    cout.setf(ios::showpos);

    int agendaIdx = 0;

    cout << "total available experiment agenda number: " << experimentAgendas_NUM << endl;
    cout << "please select experiment agendaIdx: ";
    cin >> agendaIdx;
    while (!(agendaIdx >= 0 && agendaIdx < experimentAgendas_NUM)) // if input not valid
    {
        cout << "error, please reselect experiment agendaIdx: ";
        cin >> agendaIdx;
    }

    cout << "selected experiment agenda: " << experimentAgendas[agendaIdx].description << endl;
    experimentBeginTime = ros::Time::now(); // set begin time of experiment

    experimentAgendas[agendaIdx].handler(); // arrange experiment according to agenda

    ros::Timer timeEventTasker_timer = nh.createTimer(ros::Duration(0.1), timeEventTasker_cb);

    while (ros::ok()) // todo: only check start_flag=0, other function need tested
    {
        ros::spinOnce();
        // TODO check for keyboard

        // ros::Duration(1.0).sleep();
    }
    return 0;
}

void broadcastBeginExperiment() //broadcast takeoff signal
{
    // DEBUG(
    //     TraceableInfo("all offboard,swarm_num_uav: %d\n",swarm_num_uav);)
    for (int i = 1; i <= swarm_num_uav; i++)
    {
        //     DEBUG(
        // TraceableInfo("sending to uav %d\n",i);)
        swarm_command[i].All_Offboard_Control_Flg = true;
        command_pub[i].publish(swarm_command[i]); //【发布】all offboard
    }
}
void broadcastEndExperiment() //broadcast landing signal
{
    for (int i = 1; i <= swarm_num_uav; i++)
    {
        swarm_command[i].All_Offboard_Control_Flg = false;
        command_pub[i].publish(swarm_command[i]); //【发布】all offboard OFF
    }
}

void set_experiment_parameters(Experiment_params parameters) // set global parameters
{
    currentParams = parameters; // update current parameters

    ros::param::set("site_number", parameters.site_number);
    ros::param::set("site_radius", parameters.site_radius);

    for (int i = 0; i < parameters.site_number; i++)
    {
        ros::param::set("/site_posx_" + std::to_string(i + 1), parameters.sites[i].sitePos[0]);
        ros::param::set("/site_posy_" + std::to_string(i + 1), parameters.sites[i].sitePos[1]);
        ros::param::set("/site_posz_" + std::to_string(i + 1), parameters.sites[i].sitePos[2]);

        ros::param::set("/site_quality_" + std::to_string(i + 1), parameters.sites[i].quality);
    }

    ros::param::set("sensorRange", parameters.sensorRange);
}

TimeTriggeredEvent makeArrangement(int second, void (*_handler)()) // create a time trigger event, push into event queue
{
    TimeTriggeredEvent event;
    event.handler = _handler;
    event.trigged_time = ros::Time(second + experimentBeginTime.sec);
    eventQueue.push_back(event);
    return event;
}

void timeEventTasker_cb(const ros::TimerEvent &e) // automatically executed, check for time events in the event queue
{
    static bool done = false;

    for (vector<TimeTriggeredEvent>::iterator it = eventQueue.begin(); it != eventQueue.end();)
    {
        if (it->executed == false && ros::Time::now() > it->trigged_time) // successfully executed
        {
            DEBUG(
                TraceableInfo("time event triggered, now time:%d, triggered time: %d\n", ros::Time::now().sec, it->trigged_time.sec);)
            it->handler();
            it->executed = true;
            it = eventQueue.erase(it);
        }
        else
        {
            it++;
        }
    }

    if (done == false && eventQueue.size() == 0) // all events done
    {
        done = true;
        DEBUG(
            TraceableInfo("event queue is empty\n");)
    }
}

void printEventQueue() //print event queue
{
    FlushPrint("printing event queue:\n");
    int i = 0;
    for (vector<TimeTriggeredEvent>::iterator it = eventQueue.begin(); it != eventQueue.end(); it++,i++)
    {
        FlushPrint("Event %d, ROS time:%d, experiment time:%d\n",i,it->trigged_time.sec,it->trigged_time.sec - experimentBeginTime.sec);
    }
    FlushPrint("end printing event queue\n");
}


//Experiment setups goes below
/************************************************************************************************************************************************************************************************************************************/ ///

// experiment setup 1
void agenda1() // experiment schedule
{
    TimeTriggeredEvent event1 = makeArrangement(0, set_params_1); //set default parameters
    TimeTriggeredEvent event2 = makeArrangement(1, broadcastBeginExperiment);
    TimeTriggeredEvent event3 = makeArrangement(6, set_params_2); //change parameters
    TimeTriggeredEvent event4 = makeArrangement(10, broadcastEndExperiment);
    printEventQueue();
}

void set_params_1()
{
    currentParams.sensorRange = 10;
    currentParams.site_number = 3;
    currentParams.site_radius = 10;
    currentParams.sensor_noise_stdev = 0.1;
    Site site1(-30,10,0,0.4);
    Site site2(30,30,0,0.6);
    Site site3(10,-20,0,0.8);

    currentParams.sites.push_back(site1);
    currentParams.sites.push_back(site2);
    currentParams.sites.push_back(site3);

    set_experiment_parameters(currentParams);
}

void set_params_2()
{
    Experiment_params params = currentParams;
    params.sites[2].sitePos[0] = 70;
    set_experiment_parameters(params);
}

/******************************************************************************************************************/ ///
// experiment setup 2
void agenda2() // experiment schedule
{
    TimeTriggeredEvent event1 = makeArrangement(0, set_params_1);
    TimeTriggeredEvent event2 = makeArrangement(120, set_params_1);
    printEventQueue();
}