;; Auto-generated. Do not edit!


(when (boundp 'prometheus_msgs::SensorMsg)
  (if (not (find-package "PROMETHEUS_MSGS"))
    (make-package "PROMETHEUS_MSGS"))
  (shadow 'SensorMsg (find-package "PROMETHEUS_MSGS")))
(unless (find-package "PROMETHEUS_MSGS::SENSORMSG")
  (make-package "PROMETHEUS_MSGS::SENSORMSG"))

(in-package "ROS")
;;//! \htmlinclude SensorMsg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass prometheus_msgs::SensorMsg
  :super ros::object
  :slots (_header _sitePos _quality ))

(defmethod prometheus_msgs::SensorMsg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:sitePos __sitePos) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:quality __quality) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _sitePos __sitePos)
   (setq _quality (float __quality))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:sitePos
   (&optional __sitePos)
   (if __sitePos (setq _sitePos __sitePos)) _sitePos)
  (:quality
   (&optional __quality)
   (if __quality (setq _quality __quality)) _quality)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32[3] _sitePos
    (* 4    3)
    ;; float32 _quality
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32[3] _sitePos
     (dotimes (i 3)
       (sys::poke (elt _sitePos i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32 _quality
       (sys::poke _quality (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32[3] _sitePos
   (dotimes (i (length _sitePos))
     (setf (elt _sitePos i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32 _quality
     (setq _quality (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get prometheus_msgs::SensorMsg :md5sum-) "b1eb9f770154f179ae8b8277cc10e3d2")
(setf (get prometheus_msgs::SensorMsg :datatype-) "prometheus_msgs/SensorMsg")
(setf (get prometheus_msgs::SensorMsg :definition-)
      "std_msgs/Header header

## XXX implemented

float32[3] sitePos ## L_m
float32 quality ## q_m
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



(provide :prometheus_msgs/SensorMsg "b1eb9f770154f179ae8b8277cc10e3d2")


