// Generated by gencpp from file prometheus_msgs/SensorMsg.msg
// DO NOT EDIT!


#ifndef PROMETHEUS_MSGS_MESSAGE_SENSORMSG_H
#define PROMETHEUS_MSGS_MESSAGE_SENSORMSG_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace prometheus_msgs
{
template <class ContainerAllocator>
struct SensorMsg_
{
  typedef SensorMsg_<ContainerAllocator> Type;

  SensorMsg_()
    : header()
    , sitePos()
    , quality(0.0)  {
      sitePos.assign(0.0);
  }
  SensorMsg_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , sitePos()
    , quality(0.0)  {
  (void)_alloc;
      sitePos.assign(0.0);
  }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef boost::array<float, 3>  _sitePos_type;
  _sitePos_type sitePos;

   typedef float _quality_type;
  _quality_type quality;





  typedef boost::shared_ptr< ::prometheus_msgs::SensorMsg_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::prometheus_msgs::SensorMsg_<ContainerAllocator> const> ConstPtr;

}; // struct SensorMsg_

typedef ::prometheus_msgs::SensorMsg_<std::allocator<void> > SensorMsg;

typedef boost::shared_ptr< ::prometheus_msgs::SensorMsg > SensorMsgPtr;
typedef boost::shared_ptr< ::prometheus_msgs::SensorMsg const> SensorMsgConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::prometheus_msgs::SensorMsg_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::prometheus_msgs::SensorMsg_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::prometheus_msgs::SensorMsg_<ContainerAllocator1> & lhs, const ::prometheus_msgs::SensorMsg_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.sitePos == rhs.sitePos &&
    lhs.quality == rhs.quality;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::prometheus_msgs::SensorMsg_<ContainerAllocator1> & lhs, const ::prometheus_msgs::SensorMsg_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace prometheus_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::prometheus_msgs::SensorMsg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::prometheus_msgs::SensorMsg_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::prometheus_msgs::SensorMsg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::prometheus_msgs::SensorMsg_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::prometheus_msgs::SensorMsg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::prometheus_msgs::SensorMsg_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::prometheus_msgs::SensorMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "b1eb9f770154f179ae8b8277cc10e3d2";
  }

  static const char* value(const ::prometheus_msgs::SensorMsg_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xb1eb9f770154f179ULL;
  static const uint64_t static_value2 = 0xae8b8277cc10e3d2ULL;
};

template<class ContainerAllocator>
struct DataType< ::prometheus_msgs::SensorMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "prometheus_msgs/SensorMsg";
  }

  static const char* value(const ::prometheus_msgs::SensorMsg_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::prometheus_msgs::SensorMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "std_msgs/Header header\n"
"\n"
"## XXX implemented\n"
"\n"
"float32[3] sitePos ## L_m\n"
"float32 quality ## q_m\n"
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
;
  }

  static const char* value(const ::prometheus_msgs::SensorMsg_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::prometheus_msgs::SensorMsg_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.sitePos);
      stream.next(m.quality);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SensorMsg_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::prometheus_msgs::SensorMsg_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::prometheus_msgs::SensorMsg_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "sitePos[]" << std::endl;
    for (size_t i = 0; i < v.sitePos.size(); ++i)
    {
      s << indent << "  sitePos[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.sitePos[i]);
    }
    s << indent << "quality: ";
    Printer<float>::stream(s, indent + "  ", v.quality);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PROMETHEUS_MSGS_MESSAGE_SENSORMSG_H
