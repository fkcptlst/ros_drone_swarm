; Auto-generated. Do not edit!


(cl:in-package prometheus_msgs-msg)


;//! \htmlinclude StatisticiansParchment.msg.html

(cl:defclass <StatisticiansParchment> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (total_functional_uav
    :reader total_functional_uav
    :initarg :total_functional_uav
    :type cl:integer
    :initform 0)
   (Sx
    :reader Sx
    :initarg :Sx
    :type cl:integer
    :initform 0)
   (Sy
    :reader Sy
    :initarg :Sy
    :type cl:integer
    :initform 0)
   (Sz
    :reader Sz
    :initarg :Sz
    :type cl:integer
    :initform 0)
   (Sw
    :reader Sw
    :initarg :Sw
    :type cl:integer
    :initform 0)
   (S_site
    :reader S_site
    :initarg :S_site
    :type (cl:vector cl:integer)
   :initform (cl:make-array 20 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass StatisticiansParchment (<StatisticiansParchment>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StatisticiansParchment>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StatisticiansParchment)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prometheus_msgs-msg:<StatisticiansParchment> is deprecated: use prometheus_msgs-msg:StatisticiansParchment instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <StatisticiansParchment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:header-val is deprecated.  Use prometheus_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'total_functional_uav-val :lambda-list '(m))
(cl:defmethod total_functional_uav-val ((m <StatisticiansParchment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:total_functional_uav-val is deprecated.  Use prometheus_msgs-msg:total_functional_uav instead.")
  (total_functional_uav m))

(cl:ensure-generic-function 'Sx-val :lambda-list '(m))
(cl:defmethod Sx-val ((m <StatisticiansParchment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:Sx-val is deprecated.  Use prometheus_msgs-msg:Sx instead.")
  (Sx m))

(cl:ensure-generic-function 'Sy-val :lambda-list '(m))
(cl:defmethod Sy-val ((m <StatisticiansParchment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:Sy-val is deprecated.  Use prometheus_msgs-msg:Sy instead.")
  (Sy m))

(cl:ensure-generic-function 'Sz-val :lambda-list '(m))
(cl:defmethod Sz-val ((m <StatisticiansParchment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:Sz-val is deprecated.  Use prometheus_msgs-msg:Sz instead.")
  (Sz m))

(cl:ensure-generic-function 'Sw-val :lambda-list '(m))
(cl:defmethod Sw-val ((m <StatisticiansParchment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:Sw-val is deprecated.  Use prometheus_msgs-msg:Sw instead.")
  (Sw m))

(cl:ensure-generic-function 'S_site-val :lambda-list '(m))
(cl:defmethod S_site-val ((m <StatisticiansParchment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prometheus_msgs-msg:S_site-val is deprecated.  Use prometheus_msgs-msg:S_site instead.")
  (S_site m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StatisticiansParchment>) ostream)
  "Serializes a message object of type '<StatisticiansParchment>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'total_functional_uav)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'Sx)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'Sy)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'Sz)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'Sw)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'S_site))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StatisticiansParchment>) istream)
  "Deserializes a message object of type '<StatisticiansParchment>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'total_functional_uav) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Sx) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Sy) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Sz) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Sw) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:setf (cl:slot-value msg 'S_site) (cl:make-array 20))
  (cl:let ((vals (cl:slot-value msg 'S_site)))
    (cl:dotimes (i 20)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StatisticiansParchment>)))
  "Returns string type for a message object of type '<StatisticiansParchment>"
  "prometheus_msgs/StatisticiansParchment")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StatisticiansParchment)))
  "Returns string type for a message object of type 'StatisticiansParchment"
  "prometheus_msgs/StatisticiansParchment")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StatisticiansParchment>)))
  "Returns md5sum for a message object of type '<StatisticiansParchment>"
  "a15783e2b76cfab9bf92de135ddea185")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StatisticiansParchment)))
  "Returns md5sum for a message object of type 'StatisticiansParchment"
  "a15783e2b76cfab9bf92de135ddea185")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StatisticiansParchment>)))
  "Returns full string definition for message of type '<StatisticiansParchment>"
  (cl:format cl:nil "#this message is for the statistician node to transmit processed data to the statisticians_scribble node~%std_msgs/Header header~%~%int32 total_functional_uav~%int32 Sx #num of committed to current best~%int32 Sy #committed to prev best~%int32 Sz #polling~%int32 Sw #others~%~%int32[20] S_site #record number of uavs committed to each site,max num = 20~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StatisticiansParchment)))
  "Returns full string definition for message of type 'StatisticiansParchment"
  (cl:format cl:nil "#this message is for the statistician node to transmit processed data to the statisticians_scribble node~%std_msgs/Header header~%~%int32 total_functional_uav~%int32 Sx #num of committed to current best~%int32 Sy #committed to prev best~%int32 Sz #polling~%int32 Sw #others~%~%int32[20] S_site #record number of uavs committed to each site,max num = 20~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StatisticiansParchment>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     4
     4
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'S_site) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StatisticiansParchment>))
  "Converts a ROS message object to a list"
  (cl:list 'StatisticiansParchment
    (cl:cons ':header (header msg))
    (cl:cons ':total_functional_uav (total_functional_uav msg))
    (cl:cons ':Sx (Sx msg))
    (cl:cons ':Sy (Sy msg))
    (cl:cons ':Sz (Sz msg))
    (cl:cons ':Sw (Sw msg))
    (cl:cons ':S_site (S_site msg))
))
