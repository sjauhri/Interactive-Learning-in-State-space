;; Auto-generated. Do not edit!


(when (boundp 'iiwa_msgs::Spline)
  (if (not (find-package "IIWA_MSGS"))
    (make-package "IIWA_MSGS"))
  (shadow 'Spline (find-package "IIWA_MSGS")))
(unless (find-package "IIWA_MSGS::SPLINE")
  (make-package "IIWA_MSGS::SPLINE"))

(in-package "ROS")
;;//! \htmlinclude Spline.msg.html


(defclass iiwa_msgs::Spline
  :super ros::object
  :slots (_segments ))

(defmethod iiwa_msgs::Spline
  (:init
   (&key
    ((:segments __segments) (let (r) (dotimes (i 0) (push (instance iiwa_msgs::SplineSegment :init) r)) r))
    )
   (send-super :init)
   (setq _segments __segments)
   self)
  (:segments
   (&rest __segments)
   (if (keywordp (car __segments))
       (send* _segments __segments)
     (progn
       (if __segments (setq _segments (car __segments)))
       _segments)))
  (:serialization-length
   ()
   (+
    ;; iiwa_msgs/SplineSegment[] _segments
    (apply #'+ (send-all _segments :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; iiwa_msgs/SplineSegment[] _segments
     (write-long (length _segments) s)
     (dolist (elem _segments)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; iiwa_msgs/SplineSegment[] _segments
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _segments (let (r) (dotimes (i n) (push (instance iiwa_msgs::SplineSegment :init) r)) r))
     (dolist (elem- _segments)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get iiwa_msgs::Spline :md5sum-) "153600aaca0e725c65b5a93c215f43c9")
(setf (get iiwa_msgs::Spline :datatype-) "iiwa_msgs/Spline")
(setf (get iiwa_msgs::Spline :definition-)
      "# The describes a motion along a spline

SplineSegment[] segments
================================================================================
MSG: iiwa_msgs/SplineSegment
# This message describes a segment of a spline path

int32 SPL = 0
int32 LIN =  1
int32 CIRC = 2

# The type of the spline segment
int32 type

# The endpoint of the current segment
CartesianPose point

# Auxiliary point. Only used for circular segments
CartesianPose point_aux
================================================================================
MSG: iiwa_msgs/CartesianPose
# Target Pose including redundancy information.
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



(provide :iiwa_msgs/Spline "153600aaca0e725c65b5a93c215f43c9")


