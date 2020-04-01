;; Auto-generated. Do not edit!


(when (boundp 'iiwa_msgs::SplineSegment)
  (if (not (find-package "IIWA_MSGS"))
    (make-package "IIWA_MSGS"))
  (shadow 'SplineSegment (find-package "IIWA_MSGS")))
(unless (find-package "IIWA_MSGS::SPLINESEGMENT")
  (make-package "IIWA_MSGS::SPLINESEGMENT"))

(in-package "ROS")
;;//! \htmlinclude SplineSegment.msg.html


(intern "*SPL*" (find-package "IIWA_MSGS::SPLINESEGMENT"))
(shadow '*SPL* (find-package "IIWA_MSGS::SPLINESEGMENT"))
(defconstant iiwa_msgs::SplineSegment::*SPL* 0)
(intern "*LIN*" (find-package "IIWA_MSGS::SPLINESEGMENT"))
(shadow '*LIN* (find-package "IIWA_MSGS::SPLINESEGMENT"))
(defconstant iiwa_msgs::SplineSegment::*LIN* 1)
(intern "*CIRC*" (find-package "IIWA_MSGS::SPLINESEGMENT"))
(shadow '*CIRC* (find-package "IIWA_MSGS::SPLINESEGMENT"))
(defconstant iiwa_msgs::SplineSegment::*CIRC* 2)
(defclass iiwa_msgs::SplineSegment
  :super ros::object
  :slots (_type _point _point_aux ))

(defmethod iiwa_msgs::SplineSegment
  (:init
   (&key
    ((:type __type) 0)
    ((:point __point) (instance iiwa_msgs::CartesianPose :init))
    ((:point_aux __point_aux) (instance iiwa_msgs::CartesianPose :init))
    )
   (send-super :init)
   (setq _type (round __type))
   (setq _point __point)
   (setq _point_aux __point_aux)
   self)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:point
   (&rest __point)
   (if (keywordp (car __point))
       (send* _point __point)
     (progn
       (if __point (setq _point (car __point)))
       _point)))
  (:point_aux
   (&rest __point_aux)
   (if (keywordp (car __point_aux))
       (send* _point_aux __point_aux)
     (progn
       (if __point_aux (setq _point_aux (car __point_aux)))
       _point_aux)))
  (:serialization-length
   ()
   (+
    ;; int32 _type
    4
    ;; iiwa_msgs/CartesianPose _point
    (send _point :serialization-length)
    ;; iiwa_msgs/CartesianPose _point_aux
    (send _point_aux :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _type
       (write-long _type s)
     ;; iiwa_msgs/CartesianPose _point
       (send _point :serialize s)
     ;; iiwa_msgs/CartesianPose _point_aux
       (send _point_aux :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _type
     (setq _type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; iiwa_msgs/CartesianPose _point
     (send _point :deserialize buf ptr-) (incf ptr- (send _point :serialization-length))
   ;; iiwa_msgs/CartesianPose _point_aux
     (send _point_aux :deserialize buf ptr-) (incf ptr- (send _point_aux :serialization-length))
   ;;
   self)
  )

(setf (get iiwa_msgs::SplineSegment :md5sum-) "ac36e232cb478b25636a98607933811b")
(setf (get iiwa_msgs::SplineSegment :datatype-) "iiwa_msgs/SplineSegment")
(setf (get iiwa_msgs::SplineSegment :definition-)
      "# This message describes a segment of a spline path

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



(provide :iiwa_msgs/SplineSegment "ac36e232cb478b25636a98607933811b")


