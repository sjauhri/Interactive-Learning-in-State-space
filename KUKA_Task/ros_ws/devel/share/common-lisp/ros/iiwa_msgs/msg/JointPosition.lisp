; Auto-generated. Do not edit!


(cl:in-package iiwa_msgs-msg)


;//! \htmlinclude JointPosition.msg.html

(cl:defclass <JointPosition> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (position
    :reader position
    :initarg :position
    :type iiwa_msgs-msg:JointQuantity
    :initform (cl:make-instance 'iiwa_msgs-msg:JointQuantity)))
)

(cl:defclass JointPosition (<JointPosition>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <JointPosition>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'JointPosition)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-msg:<JointPosition> is deprecated: use iiwa_msgs-msg:JointPosition instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <JointPosition>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:header-val is deprecated.  Use iiwa_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <JointPosition>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:position-val is deprecated.  Use iiwa_msgs-msg:position instead.")
  (position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <JointPosition>) ostream)
  "Serializes a message object of type '<JointPosition>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <JointPosition>) istream)
  "Deserializes a message object of type '<JointPosition>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<JointPosition>)))
  "Returns string type for a message object of type '<JointPosition>"
  "iiwa_msgs/JointPosition")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'JointPosition)))
  "Returns string type for a message object of type 'JointPosition"
  "iiwa_msgs/JointPosition")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<JointPosition>)))
  "Returns md5sum for a message object of type '<JointPosition>"
  "658fb21894857f175855c02859cc4745")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'JointPosition)))
  "Returns md5sum for a message object of type 'JointPosition"
  "658fb21894857f175855c02859cc4745")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<JointPosition>)))
  "Returns full string definition for message of type '<JointPosition>"
  (cl:format cl:nil "Header header~%JointQuantity position~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: iiwa_msgs/JointQuantity~%float32 a1~%float32 a2~%float32 a3~%float32 a4~%float32 a5~%float32 a6~%float32 a7~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'JointPosition)))
  "Returns full string definition for message of type 'JointPosition"
  (cl:format cl:nil "Header header~%JointQuantity position~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: iiwa_msgs/JointQuantity~%float32 a1~%float32 a2~%float32 a3~%float32 a4~%float32 a5~%float32 a6~%float32 a7~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <JointPosition>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <JointPosition>))
  "Converts a ROS message object to a list"
  (cl:list 'JointPosition
    (cl:cons ':header (header msg))
    (cl:cons ':position (position msg))
))
