// Generated by gencpp from file prometheus_msgs/LogMessageDetection.msg
// DO NOT EDIT!


#ifndef PROMETHEUS_MSGS_MESSAGE_LOGMESSAGEDETECTION_H
#define PROMETHEUS_MSGS_MESSAGE_LOGMESSAGEDETECTION_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <prometheus_msgs/DroneState.h>
#include <prometheus_msgs/ControlCommand.h>
#include <prometheus_msgs/ControlOutput.h>
#include <prometheus_msgs/AttitudeReference.h>

namespace prometheus_msgs
{
template <class ContainerAllocator>
struct LogMessageDetection_
{
  typedef LogMessageDetection_<ContainerAllocator> Type;

  LogMessageDetection_()
    : header()
    , time(0.0)
    , Drone_State()
    , Control_Command()
    , Control_Output()
    , Attitude_Reference()  {
    }
  LogMessageDetection_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , time(0.0)
    , Drone_State(_alloc)
    , Control_Command(_alloc)
    , Control_Output(_alloc)
    , Attitude_Reference(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef float _time_type;
  _time_type time;

   typedef  ::prometheus_msgs::DroneState_<ContainerAllocator>  _Drone_State_type;
  _Drone_State_type Drone_State;

   typedef  ::prometheus_msgs::ControlCommand_<ContainerAllocator>  _Control_Command_type;
  _Control_Command_type Control_Command;

   typedef  ::prometheus_msgs::ControlOutput_<ContainerAllocator>  _Control_Output_type;
  _Control_Output_type Control_Output;

   typedef  ::prometheus_msgs::AttitudeReference_<ContainerAllocator>  _Attitude_Reference_type;
  _Attitude_Reference_type Attitude_Reference;





  typedef boost::shared_ptr< ::prometheus_msgs::LogMessageDetection_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::prometheus_msgs::LogMessageDetection_<ContainerAllocator> const> ConstPtr;

}; // struct LogMessageDetection_

typedef ::prometheus_msgs::LogMessageDetection_<std::allocator<void> > LogMessageDetection;

typedef boost::shared_ptr< ::prometheus_msgs::LogMessageDetection > LogMessageDetectionPtr;
typedef boost::shared_ptr< ::prometheus_msgs::LogMessageDetection const> LogMessageDetectionConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::prometheus_msgs::LogMessageDetection_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::prometheus_msgs::LogMessageDetection_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::prometheus_msgs::LogMessageDetection_<ContainerAllocator1> & lhs, const ::prometheus_msgs::LogMessageDetection_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.time == rhs.time &&
    lhs.Drone_State == rhs.Drone_State &&
    lhs.Control_Command == rhs.Control_Command &&
    lhs.Control_Output == rhs.Control_Output &&
    lhs.Attitude_Reference == rhs.Attitude_Reference;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::prometheus_msgs::LogMessageDetection_<ContainerAllocator1> & lhs, const ::prometheus_msgs::LogMessageDetection_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace prometheus_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::prometheus_msgs::LogMessageDetection_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::prometheus_msgs::LogMessageDetection_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::prometheus_msgs::LogMessageDetection_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::prometheus_msgs::LogMessageDetection_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::prometheus_msgs::LogMessageDetection_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::prometheus_msgs::LogMessageDetection_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::prometheus_msgs::LogMessageDetection_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d3769b72ec7278159f00ed883861af41";
  }

  static const char* value(const ::prometheus_msgs::LogMessageDetection_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd3769b72ec727815ULL;
  static const uint64_t static_value2 = 0x9f00ed883861af41ULL;
};

template<class ContainerAllocator>
struct DataType< ::prometheus_msgs::LogMessageDetection_<ContainerAllocator> >
{
  static const char* value()
  {
    return "prometheus_msgs/LogMessageDetection";
  }

  static const char* value(const ::prometheus_msgs::LogMessageDetection_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::prometheus_msgs::LogMessageDetection_<ContainerAllocator> >
{
  static const char* value()
  {
    return "std_msgs/Header header\n"
"\n"
"## 用于控制模块的log消息，可自行增加需要记录的话题\n"
"float32 time             ## [s]\n"
"\n"
"DroneState Drone_State\n"
"\n"
"ControlCommand Control_Command\n"
"\n"
"ControlOutput Control_Output\n"
"\n"
"AttitudeReference Attitude_Reference\n"
"\n"
"\n"
"\n"
"\n"
"\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: prometheus_msgs/DroneState\n"
"std_msgs/Header header\n"
"\n"
"## 机载电脑是否连接上飞控，true已连接，false则不是\n"
"bool connected\n"
"## 是否解锁，true为已解锁，false则不是\n"
"bool armed\n"
"## 是否降落，true为已降落，false则代表在空中\n"
"bool landed\n"
"## PX4飞控当前飞行模式\n"
"string mode\n"
"bool odom_valid\n"
"\n"
"## 系统启动时间\n"
"float32 time_from_start             ## [s]\n"
"\n"
"## 无人机状态量：位置、速度、姿态\n"
"float32[3] position                 ## [m]\n"
"float32  rel_alt                               ## [m] only for outdoor\n"
"float32[3] velocity                 ## [m/s]\n"
"float32[3] attitude                 ## [rad]\n"
"geometry_msgs/Quaternion attitude_q ## 四元数\n"
"float32[3] attitude_rate            ## [rad/s]\n"
"float32 battery_state               ## 电池状态    #float32\n"
"================================================================================\n"
"MSG: geometry_msgs/Quaternion\n"
"# This represents an orientation in free space in quaternion form.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"float64 w\n"
"\n"
"================================================================================\n"
"MSG: prometheus_msgs/ControlCommand\n"
"std_msgs/Header header\n"
"\n"
"## 控制命令的编号 防止接收到错误命令， 编号应该逐次递加\n"
"uint32 Command_ID\n"
"\n"
"## 消息来源\n"
"string source\n"
"## 控制命令的模式 \n"
"uint8 Mode\n"
"# enum Mode 控制模式枚举\n"
"uint8 Idle=0\n"
"uint8 Takeoff=1\n"
"uint8 Hold=2\n"
"uint8 Land=3\n"
"uint8 Move=4\n"
"uint8 Disarm=5\n"
"uint8 User_Mode1=6\n"
"uint8 User_Mode2=7\n"
"\n"
"## 控制参考量 \n"
"## 位置参考量：位置、速度、加速度、加加速度、加加加速度\n"
"## 角度参考量：偏航角、偏航角速度、偏航角加速度\n"
"PositionReference Reference_State\n"
"\n"
"================================================================================\n"
"MSG: prometheus_msgs/PositionReference\n"
"std_msgs/Header header\n"
"\n"
"## 位置控制参考量\n"
"\n"
"## 默认为 XYZ位置追踪模式 （sub_mode = 0）； 速度追踪启用时，控制器不考虑位置参考量及位置状态反馈\n"
"uint8 Move_mode\n"
"\n"
"uint8 XYZ_POS      = 0  ##0b00\n"
"uint8 XY_POS_Z_VEL = 1  ##0b01\n"
"uint8 XY_VEL_Z_POS = 2  ##0b10\n"
"uint8 XYZ_VEL = 3       ##0b11\n"
"uint8 XYZ_ACC = 4\n"
"uint8 TRAJECTORY   = 5  \n"
"\n"
"uint8 Move_frame\n"
"# 默认情况下均为ENU_FRAME,注意轨迹追踪和XYZ_ACC一定是ENU_FRAME\n"
"uint8 ENU_FRAME  = 0\n"
"uint8 BODY_FRAME = 1\n"
"uint8 MIX_FRAME = 2 ##2020.4.6 临时增加的模式，后期需要统一整合，该模式下，xy采用机体系控制，z采用enu系控制\n"
"\n"
"\n"
"\n"
"## 时刻： 用于轨迹追踪\n"
"float32 time_from_start          ## [s]\n"
"\n"
"## 参考量：位置、速度、加速度、加加速度、加加加速度\n"
"float32[3] position_ref          ## [m]\n"
"float32[3] velocity_ref          ## [m/s]\n"
"float32[3] acceleration_ref      ## [m/s^2]\n"
"## float32[3] jerk_ref              ## [m/s^3]\n"
"## float32[3] snap_ref              ## [m/s^4]\n"
"\n"
"## 角度参考量：偏航角、偏航角速度、偏航角加速度\n"
"bool Yaw_Rate_Mode                      ## True 代表控制偏航角速率\n"
"float32 yaw_ref                  ## [rad]\n"
"float32 yaw_rate_ref             ## [rad/s] \n"
"## float32 yaw_acceleration_ref     ## [rad/s] \n"
"================================================================================\n"
"MSG: prometheus_msgs/ControlOutput\n"
"std_msgs/Header header\n"
"\n"
"## 位置控制器输出： 期望推力及期望油门\n"
"float32[3] Thrust              ## [rad]  \n"
"float32[3] Throttle\n"
"\n"
"## NE控制器的中间变量\n"
"float32[3] u_l                 ## [0-1] 惯性系下的油门量\n"
"float32[3] u_d                 ## [rad]\n"
"float32[3] NE                  ## [rad]\n"
"  \n"
"\n"
"================================================================================\n"
"MSG: prometheus_msgs/AttitudeReference\n"
"std_msgs/Header header\n"
"\n"
"## 位置控制器输出： 期望油门 + 期望角度\n"
"float32[3] throttle_sp                 ## [0-1] 惯性系下的油门量\n"
"float32 desired_throttle               ## [0-1] 机体系z轴\n"
"float32[3] desired_attitude            ## [rad]\n"
"geometry_msgs/Quaternion desired_att_q ## 四元数\n"
;
  }

  static const char* value(const ::prometheus_msgs::LogMessageDetection_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::prometheus_msgs::LogMessageDetection_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.time);
      stream.next(m.Drone_State);
      stream.next(m.Control_Command);
      stream.next(m.Control_Output);
      stream.next(m.Attitude_Reference);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct LogMessageDetection_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::prometheus_msgs::LogMessageDetection_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::prometheus_msgs::LogMessageDetection_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "time: ";
    Printer<float>::stream(s, indent + "  ", v.time);
    s << indent << "Drone_State: ";
    s << std::endl;
    Printer< ::prometheus_msgs::DroneState_<ContainerAllocator> >::stream(s, indent + "  ", v.Drone_State);
    s << indent << "Control_Command: ";
    s << std::endl;
    Printer< ::prometheus_msgs::ControlCommand_<ContainerAllocator> >::stream(s, indent + "  ", v.Control_Command);
    s << indent << "Control_Output: ";
    s << std::endl;
    Printer< ::prometheus_msgs::ControlOutput_<ContainerAllocator> >::stream(s, indent + "  ", v.Control_Output);
    s << indent << "Attitude_Reference: ";
    s << std::endl;
    Printer< ::prometheus_msgs::AttitudeReference_<ContainerAllocator> >::stream(s, indent + "  ", v.Attitude_Reference);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PROMETHEUS_MSGS_MESSAGE_LOGMESSAGEDETECTION_H
