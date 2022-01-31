// Generated by gencpp from file prometheus_msgs/CheckForObjectsFeedback.msg
// DO NOT EDIT!


#ifndef PROMETHEUS_MSGS_MESSAGE_CHECKFOROBJECTSFEEDBACK_H
#define PROMETHEUS_MSGS_MESSAGE_CHECKFOROBJECTSFEEDBACK_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace prometheus_msgs
{
template <class ContainerAllocator>
struct CheckForObjectsFeedback_
{
  typedef CheckForObjectsFeedback_<ContainerAllocator> Type;

  CheckForObjectsFeedback_()
    {
    }
  CheckForObjectsFeedback_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }







  typedef boost::shared_ptr< ::prometheus_msgs::CheckForObjectsFeedback_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::prometheus_msgs::CheckForObjectsFeedback_<ContainerAllocator> const> ConstPtr;

}; // struct CheckForObjectsFeedback_

typedef ::prometheus_msgs::CheckForObjectsFeedback_<std::allocator<void> > CheckForObjectsFeedback;

typedef boost::shared_ptr< ::prometheus_msgs::CheckForObjectsFeedback > CheckForObjectsFeedbackPtr;
typedef boost::shared_ptr< ::prometheus_msgs::CheckForObjectsFeedback const> CheckForObjectsFeedbackConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::prometheus_msgs::CheckForObjectsFeedback_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::prometheus_msgs::CheckForObjectsFeedback_<ContainerAllocator> >::stream(s, "", v);
return s;
}


} // namespace prometheus_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::prometheus_msgs::CheckForObjectsFeedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::prometheus_msgs::CheckForObjectsFeedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::prometheus_msgs::CheckForObjectsFeedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::prometheus_msgs::CheckForObjectsFeedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::prometheus_msgs::CheckForObjectsFeedback_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::prometheus_msgs::CheckForObjectsFeedback_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::prometheus_msgs::CheckForObjectsFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::prometheus_msgs::CheckForObjectsFeedback_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::prometheus_msgs::CheckForObjectsFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "prometheus_msgs/CheckForObjectsFeedback";
  }

  static const char* value(const ::prometheus_msgs::CheckForObjectsFeedback_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::prometheus_msgs::CheckForObjectsFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"# Feedback definition\n"
"\n"
;
  }

  static const char* value(const ::prometheus_msgs::CheckForObjectsFeedback_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::prometheus_msgs::CheckForObjectsFeedback_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct CheckForObjectsFeedback_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::prometheus_msgs::CheckForObjectsFeedback_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::prometheus_msgs::CheckForObjectsFeedback_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // PROMETHEUS_MSGS_MESSAGE_CHECKFOROBJECTSFEEDBACK_H
