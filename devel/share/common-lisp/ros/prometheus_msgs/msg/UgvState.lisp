; Auto-generated. Do not edit!


(cl:in-package prometheus_msgs-msg)


;//! \htmlinclude UgvState.msg.html

(cl:defclass <UgvState> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (connected
    :reader connected
    :initarg :connected
    :type cl:boolean
    :initform cl:nil)
   (armed
    :reader armed
    :initarg :armed
    :type cl:boolean
    :initform cl:nil)
   (guided
    :reader guided
    :initarg :guided
    :type cl:boolean
    :initform cl:nil)
   (mode
    :reader mode
    :initarg :mode
    :type cl:string
    :initform "")
   (position
    :reader position
    :initarg :position
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (velocity
    :reader velocity
    :initarg :velocity
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (attitude
    :reader attitude
    :initarg :attitude
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (attitude_q
    :reader attitude_q
    :initarg :attitude_q
    :type geometry_msgs-msg:Quaternion
    :initform (cl:make-instance 'geometry_msgs-msg:Quaternion))
   (battery
    :reader battery
    :initarg :battery
    :type cl:float
    :initform 0.0))
)

(cl:defclass UgvState (<UgvState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <UgvState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'UgvState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prometheus_msgs-msg:<UgvState> is deprecated: use prometheus_msgs-msg:UgvState instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <UgvState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:header-val is deprecated.  Use prometheus_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'connected-val :lambda-list '(m))
(cl:defmethod connected-val ((m <UgvState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:connected-val is deprecated.  Use prometheus_msgs-msg:connected instead.")
  (connected m))

(cl:ensure-generic-function 'armed-val :lambda-list '(m))
(cl:defmethod armed-val ((m <UgvState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:armed-val is deprecated.  Use prometheus_msgs-msg:armed instead.")
  (armed m))

(cl:ensure-generic-function 'guided-val :lambda-list '(m))
(cl:defmethod guided-val ((m <UgvState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:guided-val is deprecated.  Use prometheus_msgs-msg:guided instead.")
  (guided m))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <UgvState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:mode-val is deprecated.  Use prometheus_msgs-msg:mode instead.")
  (mode m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <UgvState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:position-val is deprecated.  Use prometheus_msgs-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <UgvState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:velocity-val is deprecated.  Use prometheus_msgs-msg:velocity instead.")
  (velocity m))

(cl:ensure-generic-function 'attitude-val :lambda-list '(m))
(cl:defmethod attitude-val ((m <UgvState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:attitude-val is deprecated.  Use prometheus_msgs-msg:attitude instead.")
  (attitude m))

(cl:ensure-generic-function 'attitude_q-val :lambda-list '(m))
(cl:defmethod attitude_q-val ((m <UgvState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:attitude_q-val is deprecated.  Use prometheus_msgs-msg:attitude_q instead.")
  (attitude_q m))

(cl:ensure-generic-function 'battery-val :lambda-list '(m))
(cl:defmethod battery-val ((m <UgvState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:battery-val is deprecated.  Use prometheus_msgs-msg:battery instead.")
  (battery m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <UgvState>) ostream)
  "Serializes a message object of type '<UgvState>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'connected) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'armed) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'guided) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'mode))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'mode))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'position))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'velocity))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'attitude))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'attitude_q) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'battery))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <UgvState>) istream)
  "Deserializes a message object of type '<UgvState>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'connected) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'armed) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'guided) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mode) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'mode) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:setf (cl:slot-value msg 'position) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'position)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'velocity) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'velocity)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'attitude) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'attitude)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'attitude_q) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'battery) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<UgvState>)))
  "Returns string type for a message object of type '<UgvState>"
  "prometheus_msgs/UgvState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'UgvState)))
  "Returns string type for a message object of type 'UgvState"
  "prometheus_msgs/UgvState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<UgvState>)))
  "Returns md5sum for a message object of type '<UgvState>"
  "6e1039506e3e03cde90e1715508b0ced")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'UgvState)))
  "Returns md5sum for a message object of type 'UgvState"
  "6e1039506e3e03cde90e1715508b0ced")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<UgvState>)))
  "Returns full string definition for message of type '<UgvState>"
  (cl:format cl:nil "std_msgs/Header header~%~%## 机载电脑是否连接上飞控，true已连接，false则不是~%bool connected~%## 是否解锁，true为已解锁，false则不是~%bool armed~%bool guided~%## PX4飞控当前飞行模式~%string mode~%~%## 无人机状态量：位置、速度、姿态~%float32[3] position                 ## [m]~%float32[3] velocity                 ## [m/s]~%float32[3] attitude                 ## [rad]~%geometry_msgs/Quaternion attitude_q ## 四元数~%float32 battery                 ## ~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'UgvState)))
  "Returns full string definition for message of type 'UgvState"
  (cl:format cl:nil "std_msgs/Header header~%~%## 机载电脑是否连接上飞控，true已连接，false则不是~%bool connected~%## 是否解锁，true为已解锁，false则不是~%bool armed~%bool guided~%## PX4飞控当前飞行模式~%string mode~%~%## 无人机状态量：位置、速度、姿态~%float32[3] position                 ## [m]~%float32[3] velocity                 ## [m/s]~%float32[3] attitude                 ## [rad]~%geometry_msgs/Quaternion attitude_q ## 四元数~%float32 battery                 ## ~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <UgvState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     1
     4 (cl:length (cl:slot-value msg 'mode))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'position) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'velocity) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'attitude) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'attitude_q))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <UgvState>))
  "Converts a ROS message object to a list"
  (cl:list 'UgvState
    (cl:cons ':header (header msg))
    (cl:cons ':connected (connected msg))
    (cl:cons ':armed (armed msg))
    (cl:cons ':guided (guided msg))
    (cl:cons ':mode (mode msg))
    (cl:cons ':position (position msg))
    (cl:cons ':velocity (velocity msg))
    (cl:cons ':attitude (attitude msg))
    (cl:cons ':attitude_q (attitude_q msg))
    (cl:cons ':battery (battery msg))
))
