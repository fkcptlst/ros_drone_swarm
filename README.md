<!--
 * @Author: lcf
 * @Date: 2022-02-01 00:18:41
 * @LastEditors: lcf
 * @LastEditTime: 2022-02-01 01:25:42
 * @FilePath: /swarm_ws2/README.md
 * @Description: 
 * 
-->

topic prometheus/drone_state 或者 uav1/prometheus/drone_state 是 <prometheus_msgs::DroneState> 类型，由swarm_estimator发布,相关初始化也在estimator的init里面

topic /prometheus/drone_trajectory 是 <nav_msgs::Path> 类型，由swarm_estimator发布

gazebo_sub = nh.subscribe<nav_msgs::Odometry>(uav_name + "/prometheus/ground_truth", 10, gazebo_cb); // swarm_estimator

command_sub = nh.subscribe<prometheus_msgs::SwarmCommand>(uav_name + "/prometheus/swarm_command", 10, swarm_command_cb); //swarm_controller

# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id