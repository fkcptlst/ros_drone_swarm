// Generated by gencpp from file prometheus_msgs/DroneState.msg
// DO NOT EDIT!


#ifndef PROMETHEUS_MSGS_MESSAGE_DRONESTATE_H
#define PROMETHEUS_MSGS_MESSAGE_DRONESTATE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <geometry_msgs/Quaternion.h>

namespace prometheus_msgs
{
template <class ContainerAllocator>
struct DroneState_
{
  typedef DroneState_<ContainerAllocator> Type;

  DroneState_()
    : header()
    , connected(false)
    , armed(false)
    , landed(false)
    , mode()
    , odom_valid(false)
    , time_from_start(0.0)
    , position()
    , rel_alt(0.0)
    , velocity()
    , attitude()
    , attitude_q()
    , attitude_rate()
    , battery_state(0.0)  {
      position.assign(0.0);

      velocity.assign(0.0);

      attitude.assign(0.0);

      attitude_rate.assign(0.0);
  }
  DroneState_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , connected(false)
    , armed(false)
    , landed(false)
    , mode(_alloc)
    , odom_valid(false)
    , time_from_start(0.0)
    , position()
    , rel_alt(0.0)
    , velocity()
    , attitude()
    , attitude_q(_alloc)
    , attitude_rate()
    , battery_state(0.0)  {
  (void)_alloc;
      position.assign(0.0);

      velocity.assign(0.0);

      attitude.assign(0.0);

      attitude_rate.assign(0.0);
  }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef uint8_t _connected_type;
  _connected_type connected;

   typedef uint8_t _armed_type;
  _armed_type armed;

   typedef uint8_t _landed_type;
  _landed_type landed;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _mode_type;
  _mode_type mode;

   typedef uint8_t _odom_valid_type;
  _odom_valid_type odom_valid;

   typedef float _time_from_start_type;
  _time_from_start_type time_from_start;

   typedef boost::array<float, 3>  _position_type;
  _position_type position;

   typedef float _rel_alt_type;
  _rel_alt_type rel_alt;

   typedef boost::array<float, 3>  _velocity_type;
  _velocity_type velocity;

   typedef boost::array<float, 3>  _attitude_type;
  _attitude_type attitude;

   typedef  ::geometry_msgs::Quaternion_<ContainerAllocator>  _attitude_q_type;
  _attitude_q_type attitude_q;

   typedef boost::array<float, 3>  _attitude_rate_type;
  _attitude_rate_type attitude_rate;

   typedef float _battery_state_type;
  _battery_state_type battery_state;





  typedef boost::shared_ptr< ::prometheus_msgs::DroneState_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::prometheus_msgs::DroneState_<ContainerAllocator> const> ConstPtr;

}; // struct DroneState_

typedef ::prometheus_msgs::DroneState_<std::allocator<void> > DroneState;

typedef boost::shared_ptr< ::prometheus_msgs::DroneState > DroneStatePtr;
typedef boost::shared_ptr< ::prometheus_msgs::DroneState const> DroneStateConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::prometheus_msgs::DroneState_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::prometheus_msgs::DroneState_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::prometheus_msgs::DroneState_<ContainerAllocator1> & lhs, const ::prometheus_msgs::DroneState_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.connected == rhs.connected &&
    lhs.armed == rhs.armed &&
    lhs.landed == rhs.landed &&
    lhs.mode == rhs.mode &&
    lhs.odom_valid == rhs.odom_valid &&
    lhs.time_from_start == rhs.time_from_start &&
    lhs.position == rhs.position &&
    lhs.rel_alt == rhs.rel_alt &&
    lhs.velocity == rhs.velocity &&
    lhs.attitude == rhs.attitude &&
    lhs.attitude_q == rhs.attitude_q &&
    lhs.attitude_rate == rhs.attitude_rate &&
    lhs.battery_state == rhs.battery_state;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::prometheus_msgs::DroneState_<ContainerAllocator1> & lhs, const ::prometheus_msgs::DroneState_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace prometheus_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::prometheus_msgs::DroneState_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::prometheus_msgs::DroneState_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::prometheus_msgs::DroneState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::prometheus_msgs::DroneState_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::prometheus_msgs::DroneState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::prometheus_msgs::DroneState_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::prometheus_msgs::DroneState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "617cd53e1bf2033ee7ce8098bf6675b8";
  }

  static const char* value(const ::prometheus_msgs::DroneState_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x617cd53e1bf2033eULL;
  static const uint64_t static_value2 = 0xe7ce8098bf6675b8ULL;
};

template<class ContainerAllocator>
struct DataType< ::prometheus_msgs::DroneState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "prometheus_msgs/DroneState";
  }

  static const char* value(const ::prometheus_msgs::DroneState_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::prometheus_msgs::DroneState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "std_msgs/Header header\n"
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
"MSG: geometry_msgs/Quaternion\n"
"# This represents an orientation in free space in quaternion form.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"float64 w\n"
;
  }

  static const char* value(const ::prometheus_msgs::DroneState_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::prometheus_msgs::DroneState_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.connected);
      stream.next(m.armed);
      stream.next(m.landed);
      stream.next(m.mode);
      stream.next(m.odom_valid);
      stream.next(m.time_from_start);
      stream.next(m.position);
      stream.next(m.rel_alt);
      stream.next(m.velocity);
      stream.next(m.attitude);
      stream.next(m.attitude_q);
      stream.next(m.attitude_rate);
      stream.next(m.battery_state);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct DroneState_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::prometheus_msgs::DroneState_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::prometheus_msgs::DroneState_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "connected: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.connected);
    s << indent << "armed: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.armed);
    s << indent << "landed: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.landed);
    s << indent << "mode: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.mode);
    s << indent << "odom_valid: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.odom_valid);
    s << indent << "time_from_start: ";
    Printer<float>::stream(s, indent + "  ", v.time_from_start);
    s << indent << "position[]" << std::endl;
    for (size_t i = 0; i < v.position.size(); ++i)
    {
      s << indent << "  position[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.position[i]);
    }
    s << indent << "rel_alt: ";
    Printer<float>::stream(s, indent + "  ", v.rel_alt);
    s << indent << "velocity[]" << std::endl;
    for (size_t i = 0; i < v.velocity.size(); ++i)
    {
      s << indent << "  velocity[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.velocity[i]);
    }
    s << indent << "attitude[]" << std::endl;
    for (size_t i = 0; i < v.attitude.size(); ++i)
    {
      s << indent << "  attitude[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.attitude[i]);
    }
    s << indent << "attitude_q: ";
    s << std::endl;
    Printer< ::geometry_msgs::Quaternion_<ContainerAllocator> >::stream(s, indent + "  ", v.attitude_q);
    s << indent << "attitude_rate[]" << std::endl;
    for (size_t i = 0; i < v.attitude_rate.size(); ++i)
    {
      s << indent << "  attitude_rate[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.attitude_rate[i]);
    }
    s << indent << "battery_state: ";
    Printer<float>::stream(s, indent + "  ", v.battery_state);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PROMETHEUS_MSGS_MESSAGE_DRONESTATE_H
