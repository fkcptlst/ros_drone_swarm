; Auto-generated. Do not edit!


(cl:in-package prometheus_msgs-msg)


;//! \htmlinclude Case2Result.msg.html

(cl:defclass <Case2Result> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (detected
    :reader detected
    :initarg :detected
    :type cl:boolean
    :initform cl:nil)
   (moving_target
    :reader moving_target
    :initarg :moving_target
    :type cl:boolean
    :initform cl:nil)
   (enu_position
    :reader enu_position
    :initarg :enu_position
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass Case2Result (<Case2Result>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Case2Result>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Case2Result)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prometheus_msgs-msg:<Case2Result> is deprecated: use prometheus_msgs-msg:Case2Result instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Case2Result>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:header-val is deprecated.  Use prometheus_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'detected-val :lambda-list '(m))
(cl:defmethod detected-val ((m <Case2Result>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:detected-val is deprecated.  Use prometheus_msgs-msg:detected instead.")
  (detected m))

(cl:ensure-generic-function 'moving_target-val :lambda-list '(m))
(cl:defmethod moving_target-val ((m <Case2Result>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:moving_target-val is deprecated.  Use prometheus_msgs-msg:moving_target instead.")
  (moving_target m))

(cl:ensure-generic-function 'enu_position-val :lambda-list '(m))
(cl:defmethod enu_position-val ((m <Case2Result>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:enu_position-val is deprecated.  Use prometheus_msgs-msg:enu_position instead.")
  (enu_position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Case2Result>) ostream)
  "Serializes a message object of type '<Case2Result>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'detected) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'moving_target) 1 0)) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'enu_position))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Case2Result>) istream)
  "Deserializes a message object of type '<Case2Result>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'detected) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'moving_target) (cl:not (cl:zerop (cl:read-byte istream))))
  (cl:setf (cl:slot-value msg 'enu_position) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'enu_position)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Case2Result>)))
  "Returns string type for a message object of type '<Case2Result>"
  "prometheus_msgs/Case2Result")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Case2Result)))
  "Returns string type for a message object of type 'Case2Result"
  "prometheus_msgs/Case2Result")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Case2Result>)))
  "Returns md5sum for a message object of type '<Case2Result>"
  "83bfbb05bea136ea934d7ed5f7e4bc96")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Case2Result)))
  "Returns md5sum for a message object of type 'Case2Result"
  "83bfbb05bea136ea934d7ed5f7e4bc96")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Case2Result>)))
  "Returns full string definition for message of type '<Case2Result>"
  (cl:format cl:nil "std_msgs/Header header~%~%## 是否检测到标志位 ~%bool detected~%~%bool moving_target~%~%## 目标位置-全局坐标系-(x,y,z)~%float32[3] enu_position~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Case2Result)))
  "Returns full string definition for message of type 'Case2Result"
  (cl:format cl:nil "std_msgs/Header header~%~%## 是否检测到标志位 ~%bool detected~%~%bool moving_target~%~%## 目标位置-全局坐标系-(x,y,z)~%float32[3] enu_position~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Case2Result>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'enu_position) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Case2Result>))
  "Converts a ROS message object to a list"
  (cl:list 'Case2Result
    (cl:cons ':header (header msg))
    (cl:cons ':detected (detected msg))
    (cl:cons ':moving_target (moving_target msg))
    (cl:cons ':enu_position (enu_position msg))
))
