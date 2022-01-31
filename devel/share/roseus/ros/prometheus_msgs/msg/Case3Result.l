;; Auto-generated. Do not edit!


(when (boundp 'prometheus_msgs::Case3Result)
  (if (not (find-package "PROMETHEUS_MSGS"))
    (make-package "PROMETHEUS_MSGS"))
  (shadow 'Case3Result (find-package "PROMETHEUS_MSGS")))
(unless (find-package "PROMETHEUS_MSGS::CASE3RESULT")
  (make-package "PROMETHEUS_MSGS::CASE3RESULT"))

(in-package "ROS")
;;//! \htmlinclude Case3Result.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass prometheus_msgs::Case3Result
  :super ros::object
  :slots (_header _object_name _score ))

(defmethod prometheus_msgs::Case3Result
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:object_name __object_name) 0)
    ((:score __score) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _object_name (round __object_name))
   (setq _score (round __score))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:object_name
   (&optional __object_name)
   (if __object_name (setq _object_name __object_name)) _object_name)
  (:score
   (&optional __score)
   (if __score (setq _score __score)) _score)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32 _object_name
    4
    ;; int32 _score
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32 _object_name
       (write-long _object_name s)
     ;; int32 _score
       (write-long _score s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32 _object_name
     (setq _object_name (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _score
     (setq _score (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get prometheus_msgs::Case3Result :md5sum-) "92c5956f696ff8774f2e8961a1fc1b49")
(setf (get prometheus_msgs::Case3Result :datatype-) "prometheus_msgs/Case3Result")
(setf (get prometheus_msgs::Case3Result :definition-)
      "std_msgs/Header header

## 
int32 object_name

## 
int32 score



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



(provide :prometheus_msgs/Case3Result "92c5956f696ff8774f2e8961a1fc1b49")


