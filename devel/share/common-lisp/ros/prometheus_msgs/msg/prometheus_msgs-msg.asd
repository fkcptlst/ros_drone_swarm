
(cl:in-package :asdf)

(defsystem "prometheus_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :geometry_msgs-msg
               :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "ArucoInfo" :depends-on ("_package_ArucoInfo"))
    (:file "_package_ArucoInfo" :depends-on ("_package"))
    (:file "AttitudeReference" :depends-on ("_package_AttitudeReference"))
    (:file "_package_AttitudeReference" :depends-on ("_package"))
    (:file "BoundingBox" :depends-on ("_package_BoundingBox"))
    (:file "_package_BoundingBox" :depends-on ("_package"))
    (:file "BoundingBoxes" :depends-on ("_package_BoundingBoxes"))
    (:file "_package_BoundingBoxes" :depends-on ("_package"))
    (:file "Case2Result" :depends-on ("_package_Case2Result"))
    (:file "_package_Case2Result" :depends-on ("_package"))
    (:file "Case3Result" :depends-on ("_package_Case3Result"))
    (:file "_package_Case3Result" :depends-on ("_package"))
    (:file "CheckForObjectsAction" :depends-on ("_package_CheckForObjectsAction"))
    (:file "_package_CheckForObjectsAction" :depends-on ("_package"))
    (:file "CheckForObjectsActionFeedback" :depends-on ("_package_CheckForObjectsActionFeedback"))
    (:file "_package_CheckForObjectsActionFeedback" :depends-on ("_package"))
    (:file "CheckForObjectsActionGoal" :depends-on ("_package_CheckForObjectsActionGoal"))
    (:file "_package_CheckForObjectsActionGoal" :depends-on ("_package"))
    (:file "CheckForObjectsActionResult" :depends-on ("_package_CheckForObjectsActionResult"))
    (:file "_package_CheckForObjectsActionResult" :depends-on ("_package"))
    (:file "CheckForObjectsFeedback" :depends-on ("_package_CheckForObjectsFeedback"))
    (:file "_package_CheckForObjectsFeedback" :depends-on ("_package"))
    (:file "CheckForObjectsGoal" :depends-on ("_package_CheckForObjectsGoal"))
    (:file "_package_CheckForObjectsGoal" :depends-on ("_package"))
    (:file "CheckForObjectsResult" :depends-on ("_package_CheckForObjectsResult"))
    (:file "_package_CheckForObjectsResult" :depends-on ("_package"))
    (:file "Commitment" :depends-on ("_package_Commitment"))
    (:file "_package_Commitment" :depends-on ("_package"))
    (:file "ControlCommand" :depends-on ("_package_ControlCommand"))
    (:file "_package_ControlCommand" :depends-on ("_package"))
    (:file "ControlOutput" :depends-on ("_package_ControlOutput"))
    (:file "_package_ControlOutput" :depends-on ("_package"))
    (:file "DetectionInfo" :depends-on ("_package_DetectionInfo"))
    (:file "_package_DetectionInfo" :depends-on ("_package"))
    (:file "DroneState" :depends-on ("_package_DroneState"))
    (:file "_package_DroneState" :depends-on ("_package"))
    (:file "Formation" :depends-on ("_package_Formation"))
    (:file "_package_Formation" :depends-on ("_package"))
    (:file "IndoorSearch" :depends-on ("_package_IndoorSearch"))
    (:file "_package_IndoorSearch" :depends-on ("_package"))
    (:file "LogMessage" :depends-on ("_package_LogMessage"))
    (:file "_package_LogMessage" :depends-on ("_package"))
    (:file "LogMessageControl" :depends-on ("_package_LogMessageControl"))
    (:file "_package_LogMessageControl" :depends-on ("_package"))
    (:file "LogMessageDetection" :depends-on ("_package_LogMessageDetection"))
    (:file "_package_LogMessageDetection" :depends-on ("_package"))
    (:file "LogMessagePlanning" :depends-on ("_package_LogMessagePlanning"))
    (:file "_package_LogMessagePlanning" :depends-on ("_package"))
    (:file "Message" :depends-on ("_package_Message"))
    (:file "_package_Message" :depends-on ("_package"))
    (:file "Msg103" :depends-on ("_package_Msg103"))
    (:file "_package_Msg103" :depends-on ("_package"))
    (:file "Msg104" :depends-on ("_package_Msg104"))
    (:file "_package_Msg104" :depends-on ("_package"))
    (:file "MultiArucoInfo" :depends-on ("_package_MultiArucoInfo"))
    (:file "_package_MultiArucoInfo" :depends-on ("_package"))
    (:file "MultiDetectionInfo" :depends-on ("_package_MultiDetectionInfo"))
    (:file "_package_MultiDetectionInfo" :depends-on ("_package"))
    (:file "PositionReference" :depends-on ("_package_PositionReference"))
    (:file "_package_PositionReference" :depends-on ("_package"))
    (:file "SensorMsg" :depends-on ("_package_SensorMsg"))
    (:file "_package_SensorMsg" :depends-on ("_package"))
    (:file "StationCommand" :depends-on ("_package_StationCommand"))
    (:file "_package_StationCommand" :depends-on ("_package"))
    (:file "SwarmCommand" :depends-on ("_package_SwarmCommand"))
    (:file "_package_SwarmCommand" :depends-on ("_package"))
    (:file "UgvCommand" :depends-on ("_package_UgvCommand"))
    (:file "_package_UgvCommand" :depends-on ("_package"))
    (:file "UgvState" :depends-on ("_package_UgvState"))
    (:file "_package_UgvState" :depends-on ("_package"))
  ))