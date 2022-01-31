;; Auto-generated. Do not edit!


(when (boundp 'prometheus_msgs::StationCommand)
  (if (not (find-package "PROMETHEUS_MSGS"))
    (make-package "PROMETHEUS_MSGS"))
  (shadow 'StationCommand (find-package "PROMETHEUS_MSGS")))
(unless (find-package "PROMETHEUS_MSGS::STATIONCOMMAND")
  (make-package "PROMETHEUS_MSGS::STATIONCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude StationCommand.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*START*" (find-package "PROMETHEUS_MSGS::STATIONCOMMAND"))
(shadow '*START* (find-package "PROMETHEUS_MSGS::STATIONCOMMAND"))
(defconstant prometheus_msgs::StationCommand::*START* 0)
(intern "*RETURN*" (find-package "PROMETHEUS_MSGS::STATIONCOMMAND"))
(shadow '*RETURN* (find-package "PROMETHEUS_MSGS::STATIONCOMMAND"))
(defconstant prometheus_msgs::StationCommand::*RETURN* 1)
(intern "*STOP*" (find-package "PROMETHEUS_MSGS::STATIONCOMMAND"))
(shadow '*STOP* (find-package "PROMETHEUS_MSGS::STATIONCOMMAND"))
(defconstant prometheus_msgs::StationCommand::*STOP* 2)
(defclass prometheus_msgs::StationCommand
  :super ros::object
  :slots (_header _flag _first_goal _goal _Command ))

(defmethod prometheus_msgs::StationCommand
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:flag __flag) 0)
    ((:first_goal __first_goal) (instance geometry_msgs::PoseStamped :init))
    ((:goal __goal) (instance geometry_msgs::PoseStamped :init))
    ((:Command __Command) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _flag (round __flag))
   (setq _first_goal __first_goal)
   (setq _goal __goal)
   (setq _Command (round __Command))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:flag
   (&optional __flag)
   (if __flag (setq _flag __flag)) _flag)
  (:first_goal
   (&rest __first_goal)
   (if (keywordp (car __first_goal))
       (send* _first_goal __first_goal)
     (progn
       (if __first_goal (setq _first_goal (car __first_goal)))
       _first_goal)))
  (:goal
   (&rest __goal)
   (if (keywordp (car __goal))
       (send* _goal __goal)
     (progn
       (if __goal (setq _goal (car __goal)))
       _goal)))
  (:Command
   (&optional __Command)
   (if __Command (setq _Command __Command)) _Command)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _flag
    1
    ;; geometry_msgs/PoseStamped _first_goal
    (send _first_goal :serialization-length)
    ;; geometry_msgs/PoseStamped _goal
    (send _goal :serialization-length)
    ;; uint8 _Command
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _flag
       (write-byte _flag s)
     ;; geometry_msgs/PoseStamped _first_goal
       (send _first_goal :serialize s)
     ;; geometry_msgs/PoseStamped _goal
       (send _goal :serialize s)
     ;; uint8 _Command
       (write-byte _Command s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _flag
     (setq _flag (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; geometry_msgs/PoseStamped _first_goal
     (send _first_goal :deserialize buf ptr-) (incf ptr- (send _first_goal :serialization-length))
   ;; geometry_msgs/PoseStamped _goal
     (send _goal :deserialize buf ptr-) (incf ptr- (send _goal :serialization-length))
   ;; uint8 _Command
     (setq _Command (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get prometheus_msgs::StationCommand :md5sum-) "a7052f956545dadb066c7cb9787c4c08")
(setf (get prometheus_msgs::StationCommand :datatype-) "prometheus_msgs/StationCommand")
(setf (get prometheus_msgs::StationCommand :definition-)
      "std_msgs/Header header

## 启动标志位
uint8 flag

## 中途点
geometry_msgs/PoseStamped first_goal

## 目标点
geometry_msgs/PoseStamped goal

## 控制命令的模式 
uint8 Command
# enum Command 控制模式枚举
uint8 Start=0
uint8 Return=1
uint8 Stop=2




================================================================================
MSG: std_msgs/Header
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

================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :prometheus_msgs/StationCommand "a7052f956545dadb066c7cb9787c4c08")


