;; Auto-generated. Do not edit!


(when (boundp 'prometheus_msgs::Case2Result)
  (if (not (find-package "PROMETHEUS_MSGS"))
    (make-package "PROMETHEUS_MSGS"))
  (shadow 'Case2Result (find-package "PROMETHEUS_MSGS")))
(unless (find-package "PROMETHEUS_MSGS::CASE2RESULT")
  (make-package "PROMETHEUS_MSGS::CASE2RESULT"))

(in-package "ROS")
;;//! \htmlinclude Case2Result.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass prometheus_msgs::Case2Result
  :super ros::object
  :slots (_header _detected _moving_target _enu_position ))

(defmethod prometheus_msgs::Case2Result
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:detected __detected) nil)
    ((:moving_target __moving_target) nil)
    ((:enu_position __enu_position) (make-array 3 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _detected __detected)
   (setq _moving_target __moving_target)
   (setq _enu_position __enu_position)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:detected
   (&optional __detected)
   (if __detected (setq _detected __detected)) _detected)
  (:moving_target
   (&optional __moving_target)
   (if __moving_target (setq _moving_target __moving_target)) _moving_target)
  (:enu_position
   (&optional __enu_position)
   (if __enu_position (setq _enu_position __enu_position)) _enu_position)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _detected
    1
    ;; bool _moving_target
    1
    ;; float32[3] _enu_position
    (* 4    3)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _detected
       (if _detected (write-byte -1 s) (write-byte 0 s))
     ;; bool _moving_target
       (if _moving_target (write-byte -1 s) (write-byte 0 s))
     ;; float32[3] _enu_position
     (dotimes (i 3)
       (sys::poke (elt _enu_position i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _detected
     (setq _detected (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _moving_target
     (setq _moving_target (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32[3] _enu_position
   (dotimes (i (length _enu_position))
     (setf (elt _enu_position i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;;
   self)
  )

(setf (get prometheus_msgs::Case2Result :md5sum-) "83bfbb05bea136ea934d7ed5f7e4bc96")
(setf (get prometheus_msgs::Case2Result :datatype-) "prometheus_msgs/Case2Result")
(setf (get prometheus_msgs::Case2Result :definition-)
      "std_msgs/Header header

## 是否检测到标志位 
bool detected

bool moving_target

## 目标位置-全局坐标系-(x,y,z)
float32[3] enu_position



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



(provide :prometheus_msgs/Case2Result "83bfbb05bea136ea934d7ed5f7e4bc96")


