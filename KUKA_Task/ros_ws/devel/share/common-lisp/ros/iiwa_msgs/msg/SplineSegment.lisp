; Auto-generated. Do not edit!


(cl:in-package iiwa_msgs-msg)


;//! \htmlinclude SplineSegment.msg.html

(cl:defclass <SplineSegment> (roslisp-msg-protocol:ros-message)
  ((type
    :reader type
    :initarg :type
    :type cl:integer
    :initform 0)
   (point
    :reader point
    :initarg :point
    :type iiwa_msgs-msg:CartesianPose
    :initform (cl:make-instance 'iiwa_msgs-msg:CartesianPose))
   (point_aux
    :reader point_aux
    :initarg :point_aux
    :type iiwa_msgs-msg:CartesianPose
    :initform (cl:make-instance 'iiwa_msgs-msg:CartesianPose)))
)

(cl:defclass SplineSegment (<SplineSegment>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SplineSegment>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SplineSegment)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-msg:<SplineSegment> is deprecated: use iiwa_msgs-msg:SplineSegment instead.")))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <SplineSegment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:type-val is deprecated.  Use iiwa_msgs-msg:type instead.")
  (type m))

(cl:ensure-generic-function 'point-val :lambda-list '(m))
(cl:defmethod point-val ((m <SplineSegment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:point-val is deprecated.  Use iiwa_msgs-msg:point instead.")
  (point m))

(cl:ensure-generic-function 'point_aux-val :lambda-list '(m))
(cl:defmethod point_aux-val ((m <SplineSegment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:point_aux-val is deprecated.  Use iiwa_msgs-msg:point_aux instead.")
  (point_aux m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<SplineSegment>)))
    "Constants for message type '<SplineSegment>"
  '((:SPL . 0)
    (:LIN . 1)
    (:CIRC . 2))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'SplineSegment)))
    "Constants for message type 'SplineSegment"
  '((:SPL . 0)
    (:LIN . 1)
    (:CIRC . 2))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SplineSegment>) ostream)
  "Serializes a message object of type '<SplineSegment>"
  (cl:let* ((signed (cl:slot-value msg 'type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'point) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'point_aux) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SplineSegment>) istream)
  "Deserializes a message object of type '<SplineSegment>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'point) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'point_aux) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SplineSegment>)))
  "Returns string type for a message object of type '<SplineSegment>"
  "iiwa_msgs/SplineSegment")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SplineSegment)))
  "Returns string type for a message object of type 'SplineSegment"
  "iiwa_msgs/SplineSegment")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SplineSegment>)))
  "Returns md5sum for a message object of type '<SplineSegment>"
  "ac36e232cb478b25636a98607933811b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SplineSegment)))
  "Returns md5sum for a message object of type 'SplineSegment"
  "ac36e232cb478b25636a98607933811b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SplineSegment>)))
  "Returns full string definition for message of type '<SplineSegment>"
  (cl:format cl:nil "# This message describes a segment of a spline path~%~%int32 SPL = 0~%int32 LIN =  1~%int32 CIRC = 2~%~%# The type of the spline segment~%int32 type~%~%# The endpoint of the current segment~%CartesianPose point~%~%# Auxiliary point. Only used for circular segments~%CartesianPose point_aux~%================================================================================~%MSG: iiwa_msgs/CartesianPose~%# Target Pose including redundancy information.~%geometry_msgs/PoseStamped poseStamped~%~%# If you have issues with the robot not executing the motion copy this value from the Cartesian Position Tab of the~%# robot SmartPad. Set both parameters to -1 to disable them.~%RedundancyInformation redundancy~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: iiwa_msgs/RedundancyInformation~%# E1 parameter~%# Specifies Angle of the elbow joint.~%float64 e1~%~%# Status parameter~%#   Bit 0: 1 - The robot is working above its head~%#          0 - The robot is working in the ground area~%#   Bit 1: 1 - Angle A4 < 0°~%#          0 - Angle A4 >= 0°~%#   Bit 2: 1 - Angle A6 <= 0~%#          0 - Angle A6 > 0~%int32 status~%~%# Turn parameter~%# According to Sunrise handbook this is not used for the iiwa.~%int32 turn~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SplineSegment)))
  "Returns full string definition for message of type 'SplineSegment"
  (cl:format cl:nil "# This message describes a segment of a spline path~%~%int32 SPL = 0~%int32 LIN =  1~%int32 CIRC = 2~%~%# The type of the spline segment~%int32 type~%~%# The endpoint of the current segment~%CartesianPose point~%~%# Auxiliary point. Only used for circular segments~%CartesianPose point_aux~%================================================================================~%MSG: iiwa_msgs/CartesianPose~%# Target Pose including redundancy information.~%geometry_msgs/PoseStamped poseStamped~%~%# If you have issues with the robot not executing the motion copy this value from the Cartesian Position Tab of the~%# robot SmartPad. Set both parameters to -1 to disable them.~%RedundancyInformation redundancy~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: iiwa_msgs/RedundancyInformation~%# E1 parameter~%# Specifies Angle of the elbow joint.~%float64 e1~%~%# Status parameter~%#   Bit 0: 1 - The robot is working above its head~%#          0 - The robot is working in the ground area~%#   Bit 1: 1 - Angle A4 < 0°~%#          0 - Angle A4 >= 0°~%#   Bit 2: 1 - Angle A6 <= 0~%#          0 - Angle A6 > 0~%int32 status~%~%# Turn parameter~%# According to Sunrise handbook this is not used for the iiwa.~%int32 turn~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SplineSegment>))
  (cl:+ 0
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'point))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'point_aux))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SplineSegment>))
  "Converts a ROS message object to a list"
  (cl:list 'SplineSegment
    (cl:cons ':type (type msg))
    (cl:cons ':point (point msg))
    (cl:cons ':point_aux (point_aux msg))
))
