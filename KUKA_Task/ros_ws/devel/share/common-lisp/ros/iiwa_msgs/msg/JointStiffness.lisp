; Auto-generated. Do not edit!


(cl:in-package iiwa_msgs-msg)


;//! \htmlinclude JointStiffness.msg.html

(cl:defclass <JointStiffness> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (stiffness
    :reader stiffness
    :initarg :stiffness
    :type iiwa_msgs-msg:JointQuantity
    :initform (cl:make-instance 'iiwa_msgs-msg:JointQuantity)))
)

(cl:defclass JointStiffness (<JointStiffness>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <JointStiffness>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'JointStiffness)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-msg:<JointStiffness> is deprecated: use iiwa_msgs-msg:JointStiffness instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <JointStiffness>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:header-val is deprecated.  Use iiwa_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'stiffness-val :lambda-list '(m))
(cl:defmethod stiffness-val ((m <JointStiffness>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:stiffness-val is deprecated.  Use iiwa_msgs-msg:stiffness instead.")
  (stiffness m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <JointStiffness>) ostream)
  "Serializes a message object of type '<JointStiffness>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'stiffness) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <JointStiffness>) istream)
  "Deserializes a message object of type '<JointStiffness>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'stiffness) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<JointStiffness>)))
  "Returns string type for a message object of type '<JointStiffness>"
  "iiwa_msgs/JointStiffness")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'JointStiffness)))
  "Returns string type for a message object of type 'JointStiffness"
  "iiwa_msgs/JointStiffness")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<JointStiffness>)))
  "Returns md5sum for a message object of type '<JointStiffness>"
  "36eb539f80d8414d77a80b821ac39758")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'JointStiffness)))
  "Returns md5sum for a message object of type 'JointStiffness"
  "36eb539f80d8414d77a80b821ac39758")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<JointStiffness>)))
  "Returns full string definition for message of type '<JointStiffness>"
  (cl:format cl:nil "Header header~%JointQuantity stiffness~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: iiwa_msgs/JointQuantity~%float32 a1~%float32 a2~%float32 a3~%float32 a4~%float32 a5~%float32 a6~%float32 a7~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'JointStiffness)))
  "Returns full string definition for message of type 'JointStiffness"
  (cl:format cl:nil "Header header~%JointQuantity stiffness~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: iiwa_msgs/JointQuantity~%float32 a1~%float32 a2~%float32 a3~%float32 a4~%float32 a5~%float32 a6~%float32 a7~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <JointStiffness>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'stiffness))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <JointStiffness>))
  "Converts a ROS message object to a list"
  (cl:list 'JointStiffness
    (cl:cons ':header (header msg))
    (cl:cons ':stiffness (stiffness msg))
))
