;; Auto-generated. Do not edit!


(when (boundp 'iiwa_msgs::CartesianPose)
  (if (not (find-package "IIWA_MSGS"))
    (make-package "IIWA_MSGS"))
  (shadow 'CartesianPose (find-package "IIWA_MSGS")))
(unless (find-package "IIWA_MSGS::CARTESIANPOSE")
  (make-package "IIWA_MSGS::CARTESIANPOSE"))

(in-package "ROS")
;;//! \htmlinclude CartesianPose.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass iiwa_msgs::CartesianPose
  :super ros::object
  :slots (_poseStamped _redundancy ))

(defmethod iiwa_msgs::CartesianPose
  (:init
   (&key
    ((:poseStamped __poseStamped) (instance geometry_msgs::PoseStamped :init))
    ((:redundancy __redundancy) (instance iiwa_msgs::RedundancyInformation :init))
    )
   (send-super :init)
   (setq _poseStamped __poseStamped)
   (setq _redundancy __redundancy)
   self)
  (:poseStamped
   (&rest __poseStamped)
   (if (keywordp (car __poseStamped))
       (send* _poseStamped __poseStamped)
     (progn
       (if __poseStamped (setq _poseStamped (car __poseStamped)))
       _poseStamped)))
  (:redundancy
   (&rest __redundancy)
   (if (keywordp (car __redundancy))
       (send* _redundancy __redundancy)
     (progn
       (if __redundancy (setq _redundancy (car __redundancy)))
       _redundancy)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/PoseStamped _poseStamped
    (send _poseStamped :serialization-length)
    ;; iiwa_msgs/RedundancyInformation _redundancy
    (send _redundancy :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/PoseStamped _poseStamped
       (send _poseStamped :serialize s)
     ;; iiwa_msgs/RedundancyInformation _redundancy
       (send _redundancy :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/PoseStamped _poseStamped
     (send _poseStamped :deserialize buf ptr-) (incf ptr- (send _poseStamped :serialization-length))
   ;; iiwa_msgs/RedundancyInformation _redundancy
     (send _redundancy :deserialize buf ptr-) (incf ptr- (send _redundancy :serialization-length))
   ;;
   self)
  )

(setf (get iiwa_msgs::CartesianPose :md5sum-) "92a9835b358c99d9efbecb11c25db23d")
(setf (get iiwa_msgs::CartesianPose :datatype-) "iiwa_msgs/CartesianPose")
(setf (get iiwa_msgs::CartesianPose :definition-)
      "# Target Pose including redundancy information.
geometry_msgs/PoseStamped poseStamped

# If you have issues with the robot not executing the motion copy this value from the Cartesian Position Tab of the
# robot SmartPad. Set both parameters to -1 to disable them.
RedundancyInformation redundancy

================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

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

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: iiwa_msgs/RedundancyInformation
# E1 parameter
# Specifies Angle of the elbow joint.
float64 e1

# Status parameter
#   Bit 0: 1 - The robot is working above its head
#          0 - The robot is working in the ground area
#   Bit 1: 1 - Angle A4 < 0°
#          0 - Angle A4 >= 0°
#   Bit 2: 1 - Angle A6 <= 0
#          0 - Angle A6 > 0
int32 status

# Turn parameter
# According to Sunrise handbook this is not used for the iiwa.
int32 turn

")



(provide :iiwa_msgs/CartesianPose "92a9835b358c99d9efbecb11c25db23d")


