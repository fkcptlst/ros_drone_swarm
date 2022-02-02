;; Auto-generated. Do not edit!


(when (boundp 'prometheus_msgs::SwarmCommandGround)
  (if (not (find-package "PROMETHEUS_MSGS"))
    (make-package "PROMETHEUS_MSGS"))
  (shadow 'SwarmCommandGround (find-package "PROMETHEUS_MSGS")))
(unless (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND")
  (make-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))

(in-package "ROS")
;;//! \htmlinclude SwarmCommandGround.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*IDLE*" (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(shadow '*IDLE* (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(defconstant prometheus_msgs::SwarmCommandGround::*IDLE* 0)
(intern "*TAKEOFF*" (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(shadow '*TAKEOFF* (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(defconstant prometheus_msgs::SwarmCommandGround::*TAKEOFF* 1)
(intern "*HOLD*" (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(shadow '*HOLD* (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(defconstant prometheus_msgs::SwarmCommandGround::*HOLD* 2)
(intern "*LAND*" (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(shadow '*LAND* (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(defconstant prometheus_msgs::SwarmCommandGround::*LAND* 3)
(intern "*DISARM*" (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(shadow '*DISARM* (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(defconstant prometheus_msgs::SwarmCommandGround::*DISARM* 4)
(intern "*POSITION_CONTROL*" (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(shadow '*POSITION_CONTROL* (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(defconstant prometheus_msgs::SwarmCommandGround::*POSITION_CONTROL* 5)
(intern "*VELOCITY_CONTROL*" (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(shadow '*VELOCITY_CONTROL* (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(defconstant prometheus_msgs::SwarmCommandGround::*VELOCITY_CONTROL* 6)
(intern "*ACCEL_CONTROL*" (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(shadow '*ACCEL_CONTROL* (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(defconstant prometheus_msgs::SwarmCommandGround::*ACCEL_CONTROL* 7)
(intern "*MOVE*" (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(shadow '*MOVE* (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(defconstant prometheus_msgs::SwarmCommandGround::*MOVE* 8)
(intern "*USER_MODE1*" (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(shadow '*USER_MODE1* (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(defconstant prometheus_msgs::SwarmCommandGround::*USER_MODE1* 9)
(intern "*ONE_COLUMN*" (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(shadow '*ONE_COLUMN* (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(defconstant prometheus_msgs::SwarmCommandGround::*ONE_COLUMN* 0)
(intern "*TRIANGLE*" (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(shadow '*TRIANGLE* (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(defconstant prometheus_msgs::SwarmCommandGround::*TRIANGLE* 1)
(intern "*SQUARE*" (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(shadow '*SQUARE* (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(defconstant prometheus_msgs::SwarmCommandGround::*SQUARE* 2)
(intern "*CIRCULAR*" (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(shadow '*CIRCULAR* (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(defconstant prometheus_msgs::SwarmCommandGround::*CIRCULAR* 3)
(intern "*XYZ_POS*" (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(shadow '*XYZ_POS* (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(defconstant prometheus_msgs::SwarmCommandGround::*XYZ_POS* 0)
(intern "*XY_POS_Z_VEL*" (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(shadow '*XY_POS_Z_VEL* (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(defconstant prometheus_msgs::SwarmCommandGround::*XY_POS_Z_VEL* 1)
(intern "*XY_VEL_Z_POS*" (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(shadow '*XY_VEL_Z_POS* (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(defconstant prometheus_msgs::SwarmCommandGround::*XY_VEL_Z_POS* 2)
(intern "*XYZ_VEL*" (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(shadow '*XYZ_VEL* (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(defconstant prometheus_msgs::SwarmCommandGround::*XYZ_VEL* 3)
(intern "*XYZ_ACC*" (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(shadow '*XYZ_ACC* (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(defconstant prometheus_msgs::SwarmCommandGround::*XYZ_ACC* 4)
(intern "*TRAJECTORY*" (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(shadow '*TRAJECTORY* (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(defconstant prometheus_msgs::SwarmCommandGround::*TRAJECTORY* 5)
(intern "*XYZ_POS_BODY*" (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(shadow '*XYZ_POS_BODY* (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(defconstant prometheus_msgs::SwarmCommandGround::*XYZ_POS_BODY* 6)
(intern "*XYZ_VEL_BODY*" (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(shadow '*XYZ_VEL_BODY* (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(defconstant prometheus_msgs::SwarmCommandGround::*XYZ_VEL_BODY* 7)
(intern "*XY_VEL_Z_POS_BODY*" (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(shadow '*XY_VEL_Z_POS_BODY* (find-package "PROMETHEUS_MSGS::SWARMCOMMANDGROUND"))
(defconstant prometheus_msgs::SwarmCommandGround::*XY_VEL_Z_POS_BODY* 8)
(defclass prometheus_msgs::SwarmCommandGround
  :super ros::object
  :slots (_header _Command_ID _source _All_Offboard_Control_Flg _Mode _swarm_shape _Move_mode _swarm_size _position_ref _velocity_ref _acceleration_ref _yaw_ref _yaw_rate_ref ))

(defmethod prometheus_msgs::SwarmCommandGround
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:Command_ID __Command_ID) 0)
    ((:source __source) "")
    ((:All_Offboard_Control_Flg __All_Offboard_Control_Flg) nil)
    ((:Mode __Mode) 0)
    ((:swarm_shape __swarm_shape) 0)
    ((:Move_mode __Move_mode) 0)
    ((:swarm_size __swarm_size) 0.0)
    ((:position_ref __position_ref) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:velocity_ref __velocity_ref) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:acceleration_ref __acceleration_ref) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:yaw_ref __yaw_ref) 0.0)
    ((:yaw_rate_ref __yaw_rate_ref) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _Command_ID (round __Command_ID))
   (setq _source (string __source))
   (setq _All_Offboard_Control_Flg __All_Offboard_Control_Flg)
   (setq _Mode (round __Mode))
   (setq _swarm_shape (round __swarm_shape))
   (setq _Move_mode (round __Move_mode))
   (setq _swarm_size (float __swarm_size))
   (setq _position_ref __position_ref)
   (setq _velocity_ref __velocity_ref)
   (setq _acceleration_ref __acceleration_ref)
   (setq _yaw_ref (float __yaw_ref))
   (setq _yaw_rate_ref (float __yaw_rate_ref))
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
  (:source
   (&optional __source)
   (if __source (setq _source __source)) _source)
  (:All_Offboard_Control_Flg
   (&optional __All_Offboard_Control_Flg)
   (if __All_Offboard_Control_Flg (setq _All_Offboard_Control_Flg __All_Offboard_Control_Flg)) _All_Offboard_Control_Flg)
  (:Mode
   (&optional __Mode)
   (if __Mode (setq _Mode __Mode)) _Mode)
  (:swarm_shape
   (&optional __swarm_shape)
   (if __swarm_shape (setq _swarm_shape __swarm_shape)) _swarm_shape)
  (:Move_mode
   (&optional __Move_mode)
   (if __Move_mode (setq _Move_mode __Move_mode)) _Move_mode)
  (:swarm_size
   (&optional __swarm_size)
   (if __swarm_size (setq _swarm_size __swarm_size)) _swarm_size)
  (:position_ref
   (&optional __position_ref)
   (if __position_ref (setq _position_ref __position_ref)) _position_ref)
  (:velocity_ref
   (&optional __velocity_ref)
   (if __velocity_ref (setq _velocity_ref __velocity_ref)) _velocity_ref)
  (:acceleration_ref
   (&optional __acceleration_ref)
   (if __acceleration_ref (setq _acceleration_ref __acceleration_ref)) _acceleration_ref)
  (:yaw_ref
   (&optional __yaw_ref)
   (if __yaw_ref (setq _yaw_ref __yaw_ref)) _yaw_ref)
  (:yaw_rate_ref
   (&optional __yaw_rate_ref)
   (if __yaw_rate_ref (setq _yaw_rate_ref __yaw_rate_ref)) _yaw_rate_ref)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint32 _Command_ID
    4
    ;; string _source
    4 (length _source)
    ;; bool _All_Offboard_Control_Flg
    1
    ;; uint8 _Mode
    1
    ;; uint8 _swarm_shape
    1
    ;; uint8 _Move_mode
    1
    ;; float32 _swarm_size
    4
    ;; float32[3] _position_ref
    (* 4    3)
    ;; float32[3] _velocity_ref
    (* 4    3)
    ;; float32[3] _acceleration_ref
    (* 4    3)
    ;; float32 _yaw_ref
    4
    ;; float32 _yaw_rate_ref
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
     ;; string _source
       (write-long (length _source) s) (princ _source s)
     ;; bool _All_Offboard_Control_Flg
       (if _All_Offboard_Control_Flg (write-byte -1 s) (write-byte 0 s))
     ;; uint8 _Mode
       (write-byte _Mode s)
     ;; uint8 _swarm_shape
       (write-byte _swarm_shape s)
     ;; uint8 _Move_mode
       (write-byte _Move_mode s)
     ;; float32 _swarm_size
       (sys::poke _swarm_size (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32[3] _position_ref
     (dotimes (i 3)
       (sys::poke (elt _position_ref i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[3] _velocity_ref
     (dotimes (i 3)
       (sys::poke (elt _velocity_ref i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[3] _acceleration_ref
     (dotimes (i 3)
       (sys::poke (elt _acceleration_ref i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32 _yaw_ref
       (sys::poke _yaw_ref (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw_rate_ref
       (sys::poke _yaw_rate_ref (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint32 _Command_ID
     (setq _Command_ID (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _source
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _source (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _All_Offboard_Control_Flg
     (setq _All_Offboard_Control_Flg (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint8 _Mode
     (setq _Mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _swarm_shape
     (setq _swarm_shape (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Move_mode
     (setq _Move_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _swarm_size
     (setq _swarm_size (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32[3] _position_ref
   (dotimes (i (length _position_ref))
     (setf (elt _position_ref i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[3] _velocity_ref
   (dotimes (i (length _velocity_ref))
     (setf (elt _velocity_ref i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[3] _acceleration_ref
   (dotimes (i (length _acceleration_ref))
     (setf (elt _acceleration_ref i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32 _yaw_ref
     (setq _yaw_ref (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw_rate_ref
     (setq _yaw_rate_ref (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get prometheus_msgs::SwarmCommandGround :md5sum-) "bcde920b51ed64de69265b8e65e78836")
(setf (get prometheus_msgs::SwarmCommandGround :datatype-) "prometheus_msgs/SwarmCommandGround")
(setf (get prometheus_msgs::SwarmCommandGround :definition-)
      "std_msgs/Header header

## 控制命令的编号 防止接收到错误命令， 编号应该逐次递加
uint32 Command_ID

## 消息来源
string source

##控制所有活动切换为offboard的flg
bool All_Offboard_Control_Flg

## 控制命令的模式 
uint8 Mode
# enum Mode 控制模式枚举
uint8 Idle=0
uint8 Takeoff=1
uint8 Hold=2
uint8 Land=3
uint8 Disarm=4
uint8 Position_Control=5
uint8 Velocity_Control=6
uint8 Accel_Control=7
uint8 Move=8
uint8 User_Mode1=9

## 控制参考量 
uint8 swarm_shape

uint8 One_column=0
uint8 Triangle=1
uint8 Square=2
uint8 Circular=3

## 默认为 XYZ位置追踪模式 （sub_mode = 0）； 速度追踪启用时，控制器不考虑位置参考量及位置状态反馈
uint8 Move_mode

uint8 XYZ_POS      = 0  ##0b00
uint8 XY_POS_Z_VEL = 1  ##0b01
uint8 XY_VEL_Z_POS = 2  ##0b10
uint8 XYZ_VEL = 3       ##0b11
uint8 XYZ_ACC = 4
uint8 TRAJECTORY   = 5 
uint8 XYZ_POS_BODY = 6  
uint8 XYZ_VEL_BODY = 7
uint8 XY_VEL_Z_POS_BODY = 8

float32 swarm_size

float32[3] position_ref          ## [m]
float32[3] velocity_ref          ## [m]
float32[3] acceleration_ref
float32 yaw_ref                  ## [rad]
float32 yaw_rate_ref
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



(provide :prometheus_msgs/SwarmCommandGround "bcde920b51ed64de69265b8e65e78836")

