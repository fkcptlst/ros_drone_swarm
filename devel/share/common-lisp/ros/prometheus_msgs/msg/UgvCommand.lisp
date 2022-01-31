; Auto-generated. Do not edit!


(cl:in-package prometheus_msgs-msg)


;//! \htmlinclude UgvCommand.msg.html

(cl:defclass <UgvCommand> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (Command_ID
    :reader Command_ID
    :initarg :Command_ID
    :type cl:integer
    :initform 0)
   (Mode
    :reader Mode
    :initarg :Mode
    :type cl:fixnum
    :initform 0)
   (position_ref
    :reader position_ref
    :initarg :position_ref
    :type (cl:vector cl:float)
   :initform (cl:make-array 2 :element-type 'cl:float :initial-element 0.0))
   (yaw_ref
    :reader yaw_ref
    :initarg :yaw_ref
    :type cl:float
    :initform 0.0)
   (linear_vel
    :reader linear_vel
    :initarg :linear_vel
    :type (cl:vector cl:float)
   :initform (cl:make-array 2 :element-type 'cl:float :initial-element 0.0))
   (angular_vel
    :reader angular_vel
    :initarg :angular_vel
    :type cl:float
    :initform 0.0))
)

(cl:defclass UgvCommand (<UgvCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <UgvCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'UgvCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prometheus_msgs-msg:<UgvCommand> is deprecated: use prometheus_msgs-msg:UgvCommand instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <UgvCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:header-val is deprecated.  Use prometheus_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'Command_ID-val :lambda-list '(m))
(cl:defmethod Command_ID-val ((m <UgvCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:Command_ID-val is deprecated.  Use prometheus_msgs-msg:Command_ID instead.")
  (Command_ID m))

(cl:ensure-generic-function 'Mode-val :lambda-list '(m))
(cl:defmethod Mode-val ((m <UgvCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:Mode-val is deprecated.  Use prometheus_msgs-msg:Mode instead.")
  (Mode m))

(cl:ensure-generic-function 'position_ref-val :lambda-list '(m))
(cl:defmethod position_ref-val ((m <UgvCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:position_ref-val is deprecated.  Use prometheus_msgs-msg:position_ref instead.")
  (position_ref m))

(cl:ensure-generic-function 'yaw_ref-val :lambda-list '(m))
(cl:defmethod yaw_ref-val ((m <UgvCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:yaw_ref-val is deprecated.  Use prometheus_msgs-msg:yaw_ref instead.")
  (yaw_ref m))

(cl:ensure-generic-function 'linear_vel-val :lambda-list '(m))
(cl:defmethod linear_vel-val ((m <UgvCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:linear_vel-val is deprecated.  Use prometheus_msgs-msg:linear_vel instead.")
  (linear_vel m))

(cl:ensure-generic-function 'angular_vel-val :lambda-list '(m))
(cl:defmethod angular_vel-val ((m <UgvCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:angular_vel-val is deprecated.  Use prometheus_msgs-msg:angular_vel instead.")
  (angular_vel m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<UgvCommand>)))
    "Constants for message type '<UgvCommand>"
  '((:START . 0)
    (:HOLD . 1)
    (:DISARM . 2)
    (:POINT_CONTROL . 3)
    (:DIRECT_CONTROL . 4)
    (:ENU_VEL_CONTROL . 5)
    (:ENU_POS_CONTROL . 6)
    (:PATH_CONTROL . 7)
    (:DIRECT_CONTROL_BODY . 11)
    (:DIRECT_CONTROL_ENU . 12)
    (:TEST . 15))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'UgvCommand)))
    "Constants for message type 'UgvCommand"
  '((:START . 0)
    (:HOLD . 1)
    (:DISARM . 2)
    (:POINT_CONTROL . 3)
    (:DIRECT_CONTROL . 4)
    (:ENU_VEL_CONTROL . 5)
    (:ENU_POS_CONTROL . 6)
    (:PATH_CONTROL . 7)
    (:DIRECT_CONTROL_BODY . 11)
    (:DIRECT_CONTROL_ENU . 12)
    (:TEST . 15))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <UgvCommand>) ostream)
  "Serializes a message object of type '<UgvCommand>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Command_ID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Command_ID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Command_ID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Command_ID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Mode)) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'position_ref))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw_ref))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'linear_vel))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angular_vel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <UgvCommand>) istream)
  "Deserializes a message object of type '<UgvCommand>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Command_ID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Command_ID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Command_ID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Command_ID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Mode)) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'position_ref) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'position_ref)))
    (cl:dotimes (i 2)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw_ref) (roslisp-utils:decode-single-float-bits bits)))
  (cl:setf (cl:slot-value msg 'linear_vel) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'linear_vel)))
    (cl:dotimes (i 2)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angular_vel) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<UgvCommand>)))
  "Returns string type for a message object of type '<UgvCommand>"
  "prometheus_msgs/UgvCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'UgvCommand)))
  "Returns string type for a message object of type 'UgvCommand"
  "prometheus_msgs/UgvCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<UgvCommand>)))
  "Returns md5sum for a message object of type '<UgvCommand>"
  "a89489a1124566a2b42f1b3cd6e62061")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'UgvCommand)))
  "Returns md5sum for a message object of type 'UgvCommand"
  "a89489a1124566a2b42f1b3cd6e62061")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<UgvCommand>)))
  "Returns full string definition for message of type '<UgvCommand>"
  (cl:format cl:nil "std_msgs/Header header~%~%## 控制命令的编号 防止接收到错误命令， 编号应该逐次递加~%uint32 Command_ID~%~%## 控制命令的模式 ~%uint8 Mode~%# enum Mode 控制模式枚举~%uint8 Start=0~%uint8 Hold=1~%uint8 Disarm=2~%uint8 Point_Control=3~%uint8 Direct_Control=4~%uint8 ENU_Vel_Control=5~%uint8 ENU_Pos_Control=6~%uint8 Path_Control=7~%~%uint8 Direct_Control_BODY=11~%uint8 Direct_Control_ENU=12~%uint8 Test=15~%~%float32[2] position_ref     ## [m]~%float32 yaw_ref             ## [rad]~%~%float32[2] linear_vel       ## [m/s]~%float32 angular_vel         ## [rad/s]~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'UgvCommand)))
  "Returns full string definition for message of type 'UgvCommand"
  (cl:format cl:nil "std_msgs/Header header~%~%## 控制命令的编号 防止接收到错误命令， 编号应该逐次递加~%uint32 Command_ID~%~%## 控制命令的模式 ~%uint8 Mode~%# enum Mode 控制模式枚举~%uint8 Start=0~%uint8 Hold=1~%uint8 Disarm=2~%uint8 Point_Control=3~%uint8 Direct_Control=4~%uint8 ENU_Vel_Control=5~%uint8 ENU_Pos_Control=6~%uint8 Path_Control=7~%~%uint8 Direct_Control_BODY=11~%uint8 Direct_Control_ENU=12~%uint8 Test=15~%~%float32[2] position_ref     ## [m]~%float32 yaw_ref             ## [rad]~%~%float32[2] linear_vel       ## [m/s]~%float32 angular_vel         ## [rad/s]~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <UgvCommand>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     1
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'position_ref) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'linear_vel) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <UgvCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'UgvCommand
    (cl:cons ':header (header msg))
    (cl:cons ':Command_ID (Command_ID msg))
    (cl:cons ':Mode (Mode msg))
    (cl:cons ':position_ref (position_ref msg))
    (cl:cons ':yaw_ref (yaw_ref msg))
    (cl:cons ':linear_vel (linear_vel msg))
    (cl:cons ':angular_vel (angular_vel msg))
))
