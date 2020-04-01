; Auto-generated. Do not edit!


(cl:in-package iiwa_msgs-msg)


;//! \htmlinclude JointPositionVelocity.msg.html

(cl:defclass <JointPositionVelocity> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (position
    :reader position
    :initarg :position
    :type iiwa_msgs-msg:JointQuantity
    :initform (cl:make-instance 'iiwa_msgs-msg:JointQuantity))
   (velocity
    :reader velocity
    :initarg :velocity
    :type iiwa_msgs-msg:JointQuantity
    :initform (cl:make-instance 'iiwa_msgs-msg:JointQuantity)))
)

(cl:defclass JointPositionVelocity (<JointPositionVelocity>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <JointPositionVelocity>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'JointPositionVelocity)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-msg:<JointPositionVelocity> is deprecated: use iiwa_msgs-msg:JointPositionVelocity instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <JointPositionVelocity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:header-val is deprecated.  Use iiwa_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <JointPositionVelocity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:position-val is deprecated.  Use iiwa_msgs-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <JointPositionVelocity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:velocity-val is deprecated.  Use iiwa_msgs-msg:velocity instead.")
  (velocity m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <JointPositionVelocity>) ostream)
  "Serializes a message object of type '<JointPositionVelocity>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'velocity) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <JointPositionVelocity>) istream)
  "Deserializes a message object of type '<JointPositionVelocity>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'velocity) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<JointPositionVelocity>)))
  "Returns string type for a message object of type '<JointPositionVelocity>"
  "iiwa_msgs/JointPositionVelocity")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'JointPositionVelocity)))
  "Returns string type for a message object of type 'JointPositionVelocity"
  "iiwa_msgs/JointPositionVelocity")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<JointPositionVelocity>)))
  "Returns md5sum for a message object of type '<JointPositionVelocity>"
  "08519eea0692f4458e7be483616eb8cd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'JointPositionVelocity)))
  "Returns md5sum for a message object of type 'JointPositionVelocity"
  "08519eea0692f4458e7be483616eb8cd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<JointPositionVelocity>)))
  "Returns full string definition for message of type '<JointPositionVelocity>"
  (cl:format cl:nil "Header header~%JointQuantity position~%JointQuantity velocity~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: iiwa_msgs/JointQuantity~%float32 a1~%float32 a2~%float32 a3~%float32 a4~%float32 a5~%float32 a6~%float32 a7~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'JointPositionVelocity)))
  "Returns full string definition for message of type 'JointPositionVelocity"
  (cl:format cl:nil "Header header~%JointQuantity position~%JointQuantity velocity~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: iiwa_msgs/JointQuantity~%float32 a1~%float32 a2~%float32 a3~%float32 a4~%float32 a5~%float32 a6~%float32 a7~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <JointPositionVelocity>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'velocity))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <JointPositionVelocity>))
  "Converts a ROS message object to a list"
  (cl:list 'JointPositionVelocity
    (cl:cons ':header (header msg))
    (cl:cons ':position (position msg))
    (cl:cons ':velocity (velocity msg))
))
