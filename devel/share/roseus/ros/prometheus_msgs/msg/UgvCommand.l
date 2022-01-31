;; Auto-generated. Do not edit!


(when (boundp 'prometheus_msgs::UgvCommand)
  (if (not (find-package "PROMETHEUS_MSGS"))
    (make-package "PROMETHEUS_MSGS"))
  (shadow 'UgvCommand (find-package "PROMETHEUS_MSGS")))
(unless (find-package "PROMETHEUS_MSGS::UGVCOMMAND")
  (make-package "PROMETHEUS_MSGS::UGVCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude UgvCommand.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*START*" (find-package "PROMETHEUS_MSGS::UGVCOMMAND"))
(shadow '*START* (find-package "PROMETHEUS_MSGS::UGVCOMMAND"))
(defconstant prometheus_msgs::UgvCommand::*START* 0)
(intern "*HOLD*" (find-package "PROMETHEUS_MSGS::UGVCOMMAND"))
(shadow '*HOLD* (find-package "PROMETHEUS_MSGS::UGVCOMMAND"))
(defconstant prometheus_msgs::UgvCommand::*HOLD* 1)
(intern "*DISARM*" (find-package "PROMETHEUS_MSGS::UGVCOMMAND"))
(shadow '*DISARM* (find-package "PROMETHEUS_MSGS::UGVCOMMAND"))
(defconstant prometheus_msgs::UgvCommand::*DISARM* 2)
(intern "*POINT_CONTROL*" (find-package "PROMETHEUS_MSGS::UGVCOMMAND"))
(shadow '*POINT_CONTROL* (find-package "PROMETHEUS_MSGS::UGVCOMMAND"))
(defconstant prometheus_msgs::UgvCommand::*POINT_CONTROL* 3)
(intern "*DIRECT_CONTROL*" (find-package "PROMETHEUS_MSGS::UGVCOMMAND"))
(shadow '*DIRECT_CONTROL* (find-package "PROMETHEUS_MSGS::UGVCOMMAND"))
(defconstant prometheus_msgs::UgvCommand::*DIRECT_CONTROL* 4)
(intern "*ENU_VEL_CONTROL*" (find-package "PROMETHEUS_MSGS::UGVCOMMAND"))
(shadow '*ENU_VEL_CONTROL* (find-package "PROMETHEUS_MSGS::UGVCOMMAND"))
(defconstant prometheus_msgs::UgvCommand::*ENU_VEL_CONTROL* 5)
(intern "*ENU_POS_CONTROL*" (find-package "PROMETHEUS_MSGS::UGVCOMMAND"))
(shadow '*ENU_POS_CONTROL* (find-package "PROMETHEUS_MSGS::UGVCOMMAND"))
(defconstant prometheus_msgs::UgvCommand::*ENU_POS_CONTROL* 6)
(intern "*PATH_CONTROL*" (find-package "PROMETHEUS_MSGS::UGVCOMMAND"))
(shadow '*PATH_CONTROL* (find-package "PROMETHEUS_MSGS::UGVCOMMAND"))
(defconstant prometheus_msgs::UgvCommand::*PATH_CONTROL* 7)
(intern "*DIRECT_CONTROL_BODY*" (find-package "PROMETHEUS_MSGS::UGVCOMMAND"))
(shadow '*DIRECT_CONTROL_BODY* (find-package "PROMETHEUS_MSGS::UGVCOMMAND"))
(defconstant prometheus_msgs::UgvCommand::*DIRECT_CONTROL_BODY* 11)
(intern "*DIRECT_CONTROL_ENU*" (find-package "PROMETHEUS_MSGS::UGVCOMMAND"))
(shadow '*DIRECT_CONTROL_ENU* (find-package "PROMETHEUS_MSGS::UGVCOMMAND"))
(defconstant prometheus_msgs::UgvCommand::*DIRECT_CONTROL_ENU* 12)
(intern "*TEST*" (find-package "PROMETHEUS_MSGS::UGVCOMMAND"))
(shadow '*TEST* (find-package "PROMETHEUS_MSGS::UGVCOMMAND"))
(defconstant prometheus_msgs::UgvCommand::*TEST* 15)
(defclass prometheus_msgs::UgvCommand
  :super ros::object
  :slots (_header _Command_ID _Mode _position_ref _yaw_ref _linear_vel _angular_vel ))

(defmethod prometheus_msgs::UgvCommand
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:Command_ID __Command_ID) 0)
    ((:Mode __Mode) 0)
    ((:position_ref __position_ref) (make-array 2 :initial-element 0.0 :element-type :float))
    ((:yaw_ref __yaw_ref) 0.0)
    ((:linear_vel __linear_vel) (make-array 2 :initial-element 0.0 :element-type :float))
    ((:angular_vel __angular_vel) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _Command_ID (round __Command_ID))
   (setq _Mode (round __Mode))
   (setq _position_ref __position_ref)
   (setq _yaw_ref (float __yaw_ref))
   (setq _linear_vel __linear_vel)
   (setq _angular_vel (float __angular_vel))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:Command_ID
   (&optional __Command_ID)
   (if __Command_ID (setq _Command_ID __Command_ID)) _Command_ID)
  (:Mode
   (&optional __Mode)
   (if __Mode (setq _Mode __Mode)) _Mode)
  (:position_ref
   (&optional __position_ref)
   (if __position_ref (setq _position_ref __position_ref)) _position_ref)
  (:yaw_ref
   (&optional __yaw_ref)
   (if __yaw_ref (setq _yaw_ref __yaw_ref)) _yaw_ref)
  (:linear_vel
   (&optional __linear_vel)
   (if __linear_vel (setq _linear_vel __linear_vel)) _linear_vel)
  (:angular_vel
   (&optional __angular_vel)
   (if __angular_vel (setq _angular_vel __angular_vel)) _angular_vel)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint32 _Command_ID
    4
    ;; uint8 _Mode
    1
    ;; float32[2] _position_ref
    (* 4    2)
    ;; float32 _yaw_ref
    4
    ;; float32[2] _linear_vel
    (* 4    2)
    ;; float32 _angular_vel
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint32 _Command_ID
       (write-long _Command_ID s)
     ;; uint8 _Mode
       (write-byte _Mode s)
     ;; float32[2] _position_ref
     (dotimes (i 2)
       (sys::poke (elt _position_ref i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32 _yaw_ref
       (sys::poke _yaw_ref (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32[2] _linear_vel
     (dotimes (i 2)
       (sys::poke (elt _linear_vel i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32 _angular_vel
       (sys::poke _angular_vel (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint32 _Command_ID
     (setq _Command_ID (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8 _Mode
     (setq _Mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32[2] _position_ref
   (dotimes (i (length _position_ref))
     (setf (elt _position_ref i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32 _yaw_ref
     (setq _yaw_ref (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32[2] _linear_vel
   (dotimes (i (length _linear_vel))
     (setf (elt _linear_vel i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32 _angular_vel
     (setq _angular_vel (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get prometheus_msgs::UgvCommand :md5sum-) "a89489a1124566a2b42f1b3cd6e62061")
(setf (get prometheus_msgs::UgvCommand :datatype-) "prometheus_msgs/UgvCommand")
(setf (get prometheus_msgs::UgvCommand :definition-)
      "std_msgs/Header header

## 控制命令的编号 防止接收到错误命令， 编号应该逐次递加
uint32 Command_ID

## 控制命令的模式 
uint8 Mode
# enum Mode 控制模式枚举
uint8 Start=0
uint8 Hold=1
uint8 Disarm=2
uint8 Point_Control=3
uint8 Direct_Control=4
uint8 ENU_Vel_Control=5
uint8 ENU_Pos_Control=6
uint8 Path_Control=7

uint8 Direct_Control_BODY=11
uint8 Direct_Control_ENU=12
uint8 Test=15

float32[2] position_ref     ## [m]
float32 yaw_ref             ## [rad]

float32[2] linear_vel       ## [m/s]
float32 angular_vel         ## [rad/s]



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

")



(provide :prometheus_msgs/UgvCommand "a89489a1124566a2b42f1b3cd6e62061")


