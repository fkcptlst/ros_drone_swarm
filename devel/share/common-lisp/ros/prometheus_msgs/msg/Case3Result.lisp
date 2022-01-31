; Auto-generated. Do not edit!


(cl:in-package prometheus_msgs-msg)


;//! \htmlinclude Case3Result.msg.html

(cl:defclass <Case3Result> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (object_name
    :reader object_name
    :initarg :object_name
    :type cl:integer
    :initform 0)
   (score
    :reader score
    :initarg :score
    :type cl:integer
    :initform 0))
)

(cl:defclass Case3Result (<Case3Result>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Case3Result>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Case3Result)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prometheus_msgs-msg:<Case3Result> is deprecated: use prometheus_msgs-msg:Case3Result instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Case3Result>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:header-val is deprecated.  Use prometheus_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'object_name-val :lambda-list '(m))
(cl:defmethod object_name-val ((m <Case3Result>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:object_name-val is deprecated.  Use prometheus_msgs-msg:object_name instead.")
  (object_name m))

(cl:ensure-generic-function 'score-val :lambda-list '(m))
(cl:defmethod score-val ((m <Case3Result>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:score-val is deprecated.  Use prometheus_msgs-msg:score instead.")
  (score m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Case3Result>) ostream)
  "Serializes a message object of type '<Case3Result>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'object_name)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'score)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Case3Result>) istream)
  "Deserializes a message object of type '<Case3Result>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'object_name) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'score) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Case3Result>)))
  "Returns string type for a message object of type '<Case3Result>"
  "prometheus_msgs/Case3Result")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Case3Result)))
  "Returns string type for a message object of type 'Case3Result"
  "prometheus_msgs/Case3Result")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Case3Result>)))
  "Returns md5sum for a message object of type '<Case3Result>"
  "92c5956f696ff8774f2e8961a1fc1b49")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Case3Result)))
  "Returns md5sum for a message object of type 'Case3Result"
  "92c5956f696ff8774f2e8961a1fc1b49")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Case3Result>)))
  "Returns full string definition for message of type '<Case3Result>"
  (cl:format cl:nil "std_msgs/Header header~%~%## ~%int32 object_name~%~%## ~%int32 score~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Case3Result)))
  "Returns full string definition for message of type 'Case3Result"
  (cl:format cl:nil "std_msgs/Header header~%~%## ~%int32 object_name~%~%## ~%int32 score~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Case3Result>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Case3Result>))
  "Converts a ROS message object to a list"
  (cl:list 'Case3Result
    (cl:cons ':header (header msg))
    (cl:cons ':object_name (object_name msg))
    (cl:cons ':score (score msg))
))
