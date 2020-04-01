; Auto-generated. Do not edit!


(cl:in-package iiwa_msgs-msg)


;//! \htmlinclude Spline.msg.html

(cl:defclass <Spline> (roslisp-msg-protocol:ros-message)
  ((segments
    :reader segments
    :initarg :segments
    :type (cl:vector iiwa_msgs-msg:SplineSegment)
   :initform (cl:make-array 0 :element-type 'iiwa_msgs-msg:SplineSegment :initial-element (cl:make-instance 'iiwa_msgs-msg:SplineSegment))))
)

(cl:defclass Spline (<Spline>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Spline>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Spline)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-msg:<Spline> is deprecated: use iiwa_msgs-msg:Spline instead.")))

(cl:ensure-generic-function 'segments-val :lambda-list '(m))
(cl:defmethod segments-val ((m <Spline>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:segments-val is deprecated.  Use iiwa_msgs-msg:segments instead.")
  (segments m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Spline>) ostream)
  "Serializes a message object of type '<Spline>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'segments))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'segments))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Spline>) istream)
  "Deserializes a message object of type '<Spline>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'segments) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'segments)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'iiwa_msgs-msg:SplineSegment))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Spline>)))
  "Returns string type for a message object of type '<Spline>"
  "iiwa_msgs/Spline")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Spline)))
  "Returns string type for a message object of type 'Spline"
  "iiwa_msgs/Spline")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Spline>)))
  "Returns md5sum for a message object of type '<Spline>"
  "153600aaca0e725c65b5a93c215f43c9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Spline)))
  "Returns md5sum for a message object of type 'Spline"
  "153600aaca0e725c65b5a93c215f43c9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Spline>)))
  "Returns full string definition for message of type '<Spline>"
  (cl:format cl:nil "# The describes a motion along a spline~%~%SplineSegment[] segments~%================================================================================~%MSG: iiwa_msgs/SplineSegment~%# This message describes a segment of a spline path~%~%int32 SPL = 0~%int32 LIN =  1~%int32 CIRC = 2~%~%# The type of the spline segment~%int32 type~%~%# The endpoint of the current segment~%CartesianPose point~%~%# Auxiliary point. Only used for circular segments~%CartesianPose point_aux~%================================================================================~%MSG: iiwa_msgs/CartesianPose~%# Target Pose including redundancy information.~%geometry_msgs/PoseStamped poseStamped~%~%# If you have issues with the robot not executing the motion copy this value from the Cartesian Position Tab of the~%# robot SmartPad. Set both parameters to -1 to disable them.~%RedundancyInformation redundancy~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: iiwa_msgs/RedundancyInformation~%# E1 parameter~%# Specifies Angle of the elbow joint.~%float64 e1~%~%# Status parameter~%#   Bit 0: 1 - The robot is working above its head~%#          0 - The robot is working in the ground area~%#   Bit 1: 1 - Angle A4 < 0°~%#          0 - Angle A4 >= 0°~%#   Bit 2: 1 - Angle A6 <= 0~%#          0 - Angle A6 > 0~%int32 status~%~%# Turn parameter~%# According to Sunrise handbook this is not used for the iiwa.~%int32 turn~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Spline)))
  "Returns full string definition for message of type 'Spline"
  (cl:format cl:nil "# The describes a motion along a spline~%~%SplineSegment[] segments~%================================================================================~%MSG: iiwa_msgs/SplineSegment~%# This message describes a segment of a spline path~%~%int32 SPL = 0~%int32 LIN =  1~%int32 CIRC = 2~%~%# The type of the spline segment~%int32 type~%~%# The endpoint of the current segment~%CartesianPose point~%~%# Auxiliary point. Only used for circular segments~%CartesianPose point_aux~%================================================================================~%MSG: iiwa_msgs/CartesianPose~%# Target Pose including redundancy information.~%geometry_msgs/PoseStamped poseStamped~%~%# If you have issues with the robot not executing the motion copy this value from the Cartesian Position Tab of the~%# robot SmartPad. Set both parameters to -1 to disable them.~%RedundancyInformation redundancy~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: iiwa_msgs/RedundancyInformation~%# E1 parameter~%# Specifies Angle of the elbow joint.~%float64 e1~%~%# Status parameter~%#   Bit 0: 1 - The robot is working above its head~%#          0 - The robot is working in the ground area~%#   Bit 1: 1 - Angle A4 < 0°~%#          0 - Angle A4 >= 0°~%#   Bit 2: 1 - Angle A6 <= 0~%#          0 - Angle A6 > 0~%int32 status~%~%# Turn parameter~%# According to Sunrise handbook this is not used for the iiwa.~%int32 turn~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Spline>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'segments) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Spline>))
  "Converts a ROS message object to a list"
  (cl:list 'Spline
    (cl:cons ':segments (segments msg))
))
