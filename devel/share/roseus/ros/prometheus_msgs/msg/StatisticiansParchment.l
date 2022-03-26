;; Auto-generated. Do not edit!


(when (boundp 'prometheus_msgs::StatisticiansParchment)
  (if (not (find-package "PROMETHEUS_MSGS"))
    (make-package "PROMETHEUS_MSGS"))
  (shadow 'StatisticiansParchment (find-package "PROMETHEUS_MSGS")))
(unless (find-package "PROMETHEUS_MSGS::STATISTICIANSPARCHMENT")
  (make-package "PROMETHEUS_MSGS::STATISTICIANSPARCHMENT"))

(in-package "ROS")
;;//! \htmlinclude StatisticiansParchment.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass prometheus_msgs::StatisticiansParchment
  :super ros::object
  :slots (_header _total_functional_uav _Sx _Sy _Sz _Sw ))

(defmethod prometheus_msgs::StatisticiansParchment
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:total_functional_uav __total_functional_uav) 0)
    ((:Sx __Sx) 0)
    ((:Sy __Sy) 0)
    ((:Sz __Sz) 0)
    ((:Sw __Sw) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _total_functional_uav (round __total_functional_uav))
   (setq _Sx (round __Sx))
   (setq _Sy (round __Sy))
   (setq _Sz (round __Sz))
   (setq _Sw (round __Sw))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:total_functional_uav
   (&optional __total_functional_uav)
   (if __total_functional_uav (setq _total_functional_uav __total_functional_uav)) _total_functional_uav)
  (:Sx
   (&optional __Sx)
   (if __Sx (setq _Sx __Sx)) _Sx)
  (:Sy
   (&optional __Sy)
   (if __Sy (setq _Sy __Sy)) _Sy)
  (:Sz
   (&optional __Sz)
   (if __Sz (setq _Sz __Sz)) _Sz)
  (:Sw
   (&optional __Sw)
   (if __Sw (setq _Sw __Sw)) _Sw)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32 _total_functional_uav
    4
    ;; int32 _Sx
    4
    ;; int32 _Sy
    4
    ;; int32 _Sz
    4
    ;; int32 _Sw
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32 _total_functional_uav
       (write-long _total_functional_uav s)
     ;; int32 _Sx
       (write-long _Sx s)
     ;; int32 _Sy
       (write-long _Sy s)
     ;; int32 _Sz
       (write-long _Sz s)
     ;; int32 _Sw
       (write-long _Sw s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32 _total_functional_uav
     (setq _total_functional_uav (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _Sx
     (setq _Sx (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _Sy
     (setq _Sy (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _Sz
     (setq _Sz (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _Sw
     (setq _Sw (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get prometheus_msgs::StatisticiansParchment :md5sum-) "50df0b7bd2a7cbd006c92bd5f716afd5")
(setf (get prometheus_msgs::StatisticiansParchment :datatype-) "prometheus_msgs/StatisticiansParchment")
(setf (get prometheus_msgs::StatisticiansParchment :definition-)
      "#this message is for the statistician node to transmit processed data to the statisticians_scribble node
std_msgs/Header header

int32 total_functional_uav
int32 Sx #num of committed to current best
int32 Sy #committed to prev best
int32 Sz #polling
int32 Sw #others
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



(provide :prometheus_msgs/StatisticiansParchment "50df0b7bd2a7cbd006c92bd5f716afd5")


