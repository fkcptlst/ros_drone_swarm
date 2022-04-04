<!--
 * @Author: lcf
 * @Date: 2022-04-04 14:39:03
 * @LastEditors: lcf
 * @LastEditTime: 2022-04-04 14:39:03
 * @FilePath: /swarm_ws2/README_manual.md
 * @Description: 
 * 
-->

# How to Use

To launch experiment:

> roslaunch prometheus_gazebo sitl_experiment.launch

To record experiment (record all topics):

> rosbag record -a

To playback rosbag record:

> roslaunch prometheus_gazebo sitl_playback.launch
>
> rosbag play <bag name, e.g. 2022-04-03-21-17-37.bag, usually located under home dir>

To alter uav number:

1. go to workspace/src/swarm_control/scripts/launchfileGen.sh
2. modify the `swarm_number` variable
3. run the `launchfileGen.sh` script to bring changes into effect
