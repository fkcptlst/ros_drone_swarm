;; Auto-generated. Do not edit!


(when (boundp 'prometheus_msgs::Msg104)
  (if (not (find-package "PROMETHEUS_MSGS"))
    (make-package "PROMETHEUS_MSGS"))
  (shadow 'Msg104 (find-package "PROMETHEUS_MSGS")))
(unless (find-package "PROMETHEUS_MSGS::MSG104")
  (make-package "PROMETHEUS_MSGS::MSG104"))

(in-package "ROS")
;;//! \htmlinclude Msg104.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass prometheus_msgs::Msg104
  :super ros::object
  :slots (_header _command ))

(defmethod prometheus_msgs::Msg104
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:command __command) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _command (round __command))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:command
   (&optional __command)
   (if __command (setq _command __command)) _command)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _command
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _command
       (write-byte _command s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _command
     (setq _command (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get prometheus_msgs::Msg104 :md5sum-) "ed09803ffb3a5f32a556defaac4cdf06")
(setf (get prometheus_msgs::Msg104 :datatype-) "prometheus_msgs/Msg104")
(setf (get prometheus_msgs::Msg104 :definition-)
      "std_msgs/Header header

uint8 command




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



(provide :prometheus_msgs/Msg104 "ed09803ffb3a5f32a556defaac4cdf06")


