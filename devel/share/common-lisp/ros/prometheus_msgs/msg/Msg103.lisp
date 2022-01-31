; Auto-generated. Do not edit!


(cl:in-package prometheus_msgs-msg)


;//! \htmlinclude Msg103.msg.html

(cl:defclass <Msg103> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (command
    :reader command
    :initarg :command
    :type cl:fixnum
    :initform 0)
   (enu_position
    :reader enu_position
    :initarg :enu_position
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass Msg103 (<Msg103>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Msg103>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Msg103)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prometheus_msgs-msg:<Msg103> is deprecated: use prometheus_msgs-msg:Msg103 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Msg103>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:header-val is deprecated.  Use prometheus_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <Msg103>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:command-val is deprecated.  Use prometheus_msgs-msg:command instead.")
  (command m))

(cl:ensure-generic-function 'enu_position-val :lambda-list '(m))
(cl:defmethod enu_position-val ((m <Msg103>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:enu_position-val is deprecated.  Use prometheus_msgs-msg:enu_position instead.")
  (enu_position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Msg103>) ostream)
  "Serializes a message object of type '<Msg103>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'command)) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'enu_position))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Msg103>) istream)
  "Deserializes a message object of type '<Msg103>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'command)) (cl:read-byte istream))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Msg103>)))
  "Returns string type for a message object of type '<Msg103>"
  "prometheus_msgs/Msg103")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Msg103)))
  "Returns string type for a message object of type 'Msg103"
  "prometheus_msgs/Msg103")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Msg103>)))
  "Returns md5sum for a message object of type '<Msg103>"
  "dafd73a42d9705a33fe60bf09ed5ce07")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Msg103)))
  "Returns md5sum for a message object of type 'Msg103"
  "dafd73a42d9705a33fe60bf09ed5ce07")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Msg103>)))
  "Returns full string definition for message of type '<Msg103>"
  (cl:format cl:nil "std_msgs/Header header~%~%uint8 command~%~%## 目标位置-全局坐标系-(x,y,z)~%float32[3] enu_position~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Msg103)))
  "Returns full string definition for message of type 'Msg103"
  (cl:format cl:nil "std_msgs/Header header~%~%uint8 command~%~%## 目标位置-全局坐标系-(x,y,z)~%float32[3] enu_position~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Msg103>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'enu_position) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Msg103>))
  "Converts a ROS message object to a list"
  (cl:list 'Msg103
    (cl:cons ':header (header msg))
    (cl:cons ':command (command msg))
    (cl:cons ':enu_position (enu_position msg))
))
