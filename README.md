<!--
 * @Author: lcf
 * @Date: 2022-02-01 00:18:41
 * @LastEditors: lcf
 * @LastEditTime: 2022-02-01 16:22:36
 * @FilePath: /swarm_ws2/README.md
 * @Description: 
 * 
-->

+ topic prometheus/drone_state 或者 uav1/prometheus/drone_state 是 [prometheus_msgs::DroneState](prometheus_msgs::DroneState) 类型，由swarm_estimator发布,相关初始化也在estimator的init里面
+ topic /prometheus/drone_trajectory 是 [nav_msgs::Path](nav_msgs::Path) 类型，由swarm_estimator发布
+ gazebo_sub = nh.subscribe[nav_msgs::Odometry](nav_msgs::Odometry)(uav_name + "/prometheus/ground_truth", 10, gazebo_cb); // swarm_estimator
+ command_sub = nh.subscribe[prometheus_msgs::SwarmCommand](prometheus_msgs::SwarmCommand)(uav_name +  "/prometheus/swarm_command", 10, swarm_command_cb); //swarm_controller

  # This is generally used to communicate timestamped data

  # in a particular coordinate frame.

  # sequence ID: consecutively increasing ID

  uint32 seq
  #Two-integer timestamp that is expressed as:

  # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')

  # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')

  # time-handling sugar is provided by the client library

  time stamp
  #Frame this data is associated with
  string frame_id
+ 超出geofence则land
+ send_pos_setpoint(pos_des, yaw_des); //position control
+ send_vel_xy_pos_z_setpoint(pos_des, vel_des, yaw_des); //velocity control
+ send_pos_vel_xyz_setpoint(pos_des, vel_des, yaw_des); //trejectory control
+ swarm_command: yaw_ref: 弧度制，1 rad = 57.29 deg
+ position_ref: relative to ground. takes ENU frame

> "## 控制命令的模式 \n"
> "uint8 Mode\n"
> "# enum Mode 控制模式枚举\n"
> "uint8 Idle=0\n"
> "uint8 Takeoff=1\n"
> "uint8 Hold=2\n"
> "uint8 Land=3\n"
> "uint8 Disarm=4\n"
> "uint8 Position_Control=5\n"
> "uint8 Velocity_Control=6\n"
> "uint8 Accel_Control=7\n"
> "uint8 Move=8\n"
> "uint8 User_Mode1=9\n"

+ // 无人机一旦接受到Disarm指令，则会屏蔽其他指令, swarm_controller.h有提到

//问题：formation_separation 是干啥的？

注：可能最后用Move Mode要好些
