; Auto-generated. Do not edit!


(cl:in-package iiwa_msgs-msg)


;//! \htmlinclude CartesianPose.msg.html

(cl:defclass <CartesianPose> (roslisp-msg-protocol:ros-message)
  ((poseStamped
    :reader poseStamped
    :initarg :poseStamped
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped))
   (redundancy
    :reader redundancy
    :initarg :redundancy
    :type iiwa_msgs-msg:RedundancyInformation
    :initform (cl:make-instance 'iiwa_msgs-msg:RedundancyInformation)))
)

(cl:defclass CartesianPose (<CartesianPose>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CartesianPose>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CartesianPose)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-msg:<CartesianPose> is deprecated: use iiwa_msgs-msg:CartesianPose instead.")))

(cl:ensure-generic-function 'poseStamped-val :lambda-list '(m))
(cl:defmethod poseStamped-val ((m <CartesianPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:poseStamped-val is deprecated.  Use iiwa_msgs-msg:poseStamped instead.")
  (poseStamped m))

(cl:ensure-generic-function 'redundancy-val :lambda-list '(m))
(cl:defmethod redundancy-val ((m <CartesianPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:redundancy-val is deprecated.  Use iiwa_msgs-msg:redundancy instead.")
  (redundancy m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CartesianPose>) ostream)
  "Serializes a message object of type '<CartesianPose>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'poseStamped) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'redundancy) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CartesianPose>) istream)
  "Deserializes a message object of type '<CartesianPose>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'poseStamped) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'redundancy) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CartesianPose>)))
  "Returns string type for a message object of type '<CartesianPose>"
  "iiwa_msgs/CartesianPose")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CartesianPose)))
  "Returns string type for a message object of type 'CartesianPose"
  "iiwa_msgs/CartesianPose")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CartesianPose>)))
  "Returns md5sum for a message object of type '<CartesianPose>"
  "92a9835b358c99d9efbecb11c25db23d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CartesianPose)))
  "Returns md5sum for a message object of type 'CartesianPose"
  "92a9835b358c99d9efbecb11c25db23d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CartesianPose>)))
  "Returns full string definition for message of type '<CartesianPose>"
  (cl:format cl:nil "# Target Pose including redundancy information.~%geometry_msgs/PoseStamped poseStamped~%~%# If you have issues with the robot not executing the motion copy this value from the Cartesian Position Tab of the~%# robot SmartPad. Set both parameters to -1 to disable them.~%RedundancyInformation redundancy~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: iiwa_msgs/RedundancyInformation~%# E1 parameter~%# Specifies Angle of the elbow joint.~%float64 e1~%~%# Status parameter~%#   Bit 0: 1 - The robot is working above its head~%#          0 - The robot is working in the ground area~%#   Bit 1: 1 - Angle A4 < 0°~%#          0 - Angle A4 >= 0°~%#   Bit 2: 1 - Angle A6 <= 0~%#          0 - Angle A6 > 0~%int32 status~%~%# Turn parameter~%# According to Sunrise handbook this is not used for the iiwa.~%int32 turn~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CartesianPose)))
  "Returns full string definition for message of type 'CartesianPose"
  (cl:format cl:nil "# Target Pose including redundancy information.~%geometry_msgs/PoseStamped poseStamped~%~%# If you have issues with the robot not executing the motion copy this value from the Cartesian Position Tab of the~%# robot SmartPad. Set both parameters to -1 to disable them.~%RedundancyInformation redundancy~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: iiwa_msgs/RedundancyInformation~%# E1 parameter~%# Specifies Angle of the elbow joint.~%float64 e1~%~%# Status parameter~%#   Bit 0: 1 - The robot is working above its head~%#          0 - The robot is working in the ground area~%#   Bit 1: 1 - Angle A4 < 0°~%#          0 - Angle A4 >= 0°~%#   Bit 2: 1 - Angle A6 <= 0~%#          0 - Angle A6 > 0~%int32 status~%~%# Turn parameter~%# According to Sunrise handbook this is not used for the iiwa.~%int32 turn~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CartesianPose>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'poseStamped))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'redundancy))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CartesianPose>))
  "Converts a ROS message object to a list"
  (cl:list 'CartesianPose
    (cl:cons ':poseStamped (poseStamped msg))
    (cl:cons ':redundancy (redundancy msg))
))
