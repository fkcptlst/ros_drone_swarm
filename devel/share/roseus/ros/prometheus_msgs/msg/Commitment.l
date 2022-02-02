;; Auto-generated. Do not edit!


(when (boundp 'prometheus_msgs::Commitment)
  (if (not (find-package "PROMETHEUS_MSGS"))
    (make-package "PROMETHEUS_MSGS"))
  (shadow 'Commitment (find-package "PROMETHEUS_MSGS")))
(unless (find-package "PROMETHEUS_MSGS::COMMITMENT")
  (make-package "PROMETHEUS_MSGS::COMMITMENT"))

(in-package "ROS")
;;//! \htmlinclude Commitment.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass prometheus_msgs::Commitment
  :super ros::object
  :slots (_header _uav_id _commitmentState _sitePos _quality ))

(defmethod prometheus_msgs::Commitment
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:uav_id __uav_id) 0)
    ((:commitmentState __commitmentState) 0)
    ((:sitePos __sitePos) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:quality __quality) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _uav_id (round __uav_id))
   (setq _commitmentState (round __commitmentState))
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
  (:uav_id
   (&optional __uav_id)
   (if __uav_id (setq _uav_id __uav_id)) _uav_id)
  (:commitmentState
   (&optional __commitmentState)
   (if __commitmentState (setq _commitmentState __commitmentState)) _commitmentState)
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
    ;; int32 _uav_id
    4
    ;; int32 _commitmentState
    4
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
     ;; int32 _uav_id
       (write-long _uav_id s)
     ;; int32 _commitmentState
       (write-long _commitmentState s)
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
   ;; int32 _uav_id
     (setq _uav_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _commitmentState
     (setq _commitmentState (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32[3] _sitePos
   (dotimes (i (length _sitePos))
     (setf (elt _sitePos i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32 _quality
     (setq _quality (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get prometheus_msgs::Commitment :md5sum-) "29a5733d98998434ae7ab271018dc948")
(setf (get prometheus_msgs::Commitment :datatype-) "prometheus_msgs/Commitment")
(setf (get prometheus_msgs::Commitment :definition-)
      "std_msgs/Header header

## XXX implemented
int32 uav_id ## 无人机id

int32 commitmentState ## 无人机commitment_state
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



(provide :prometheus_msgs/Commitment "29a5733d98998434ae7ab271018dc948")


