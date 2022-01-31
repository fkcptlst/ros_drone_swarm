; Auto-generated. Do not edit!


(cl:in-package prometheus_msgs-msg)


;//! \htmlinclude Msg104.msg.html

(cl:defclass <Msg104> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (command
    :reader command
    :initarg :command
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Msg104 (<Msg104>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Msg104>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Msg104)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prometheus_msgs-msg:<Msg104> is deprecated: use prometheus_msgs-msg:Msg104 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Msg104>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:header-val is deprecated.  Use prometheus_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <Msg104>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:command-val is deprecated.  Use prometheus_msgs-msg:command instead.")
  (command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Msg104>) ostream)
  "Serializes a message object of type '<Msg104>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'command)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Msg104>) istream)
  "Deserializes a message object of type '<Msg104>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'command)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Msg104>)))
  "Returns string type for a message object of type '<Msg104>"
  "prometheus_msgs/Msg104")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Msg104)))
  "Returns string type for a message object of type 'Msg104"
  "prometheus_msgs/Msg104")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Msg104>)))
  "Returns md5sum for a message object of type '<Msg104>"
  "ed09803ffb3a5f32a556defaac4cdf06")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Msg104)))
  "Returns md5sum for a message object of type 'Msg104"
  "ed09803ffb3a5f32a556defaac4cdf06")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Msg104>)))
  "Returns full string definition for message of type '<Msg104>"
  (cl:format cl:nil "std_msgs/Header header~%~%uint8 command~%~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Msg104)))
  "Returns full string definition for message of type 'Msg104"
  (cl:format cl:nil "std_msgs/Header header~%~%uint8 command~%~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Msg104>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Msg104>))
  "Converts a ROS message object to a list"
  (cl:list 'Msg104
    (cl:cons ':header (header msg))
    (cl:cons ':command (command msg))
))
