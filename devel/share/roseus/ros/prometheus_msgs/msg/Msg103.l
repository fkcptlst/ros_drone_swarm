;; Auto-generated. Do not edit!


(when (boundp 'prometheus_msgs::Msg103)
  (if (not (find-package "PROMETHEUS_MSGS"))
    (make-package "PROMETHEUS_MSGS"))
  (shadow 'Msg103 (find-package "PROMETHEUS_MSGS")))
(unless (find-package "PROMETHEUS_MSGS::MSG103")
  (make-package "PROMETHEUS_MSGS::MSG103"))

(in-package "ROS")
;;//! \htmlinclude Msg103.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass prometheus_msgs::Msg103
  :super ros::object
  :slots (_header _command _enu_position ))

(defmethod prometheus_msgs::Msg103
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:command __command) 0)
    ((:enu_position __enu_position) (make-array 3 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _command (round __command))
   (setq _enu_position __enu_position)
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
  (:enu_position
   (&optional __enu_position)
   (if __enu_position (setq _enu_position __enu_position)) _enu_position)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _command
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
     ;; uint8 _command
       (write-byte _command s)
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
   ;; uint8 _command
     (setq _command (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32[3] _enu_position
   (dotimes (i (length _enu_position))
     (setf (elt _enu_position i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;;
   self)
  )

(setf (get prometheus_msgs::Msg103 :md5sum-) "dafd73a42d9705a33fe60bf09ed5ce07")
(setf (get prometheus_msgs::Msg103 :datatype-) "prometheus_msgs/Msg103")
(setf (get prometheus_msgs::Msg103 :definition-)
      "std_msgs/Header header

uint8 command

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



(provide :prometheus_msgs/Msg103 "dafd73a42d9705a33fe60bf09ed5ce07")


