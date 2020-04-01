; Auto-generated. Do not edit!


(cl:in-package iiwa_msgs-msg)


;//! \htmlinclude JointTorque.msg.html

(cl:defclass <JointTorque> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (torque
    :reader torque
    :initarg :torque
    :type iiwa_msgs-msg:JointQuantity
    :initform (cl:make-instance 'iiwa_msgs-msg:JointQuantity)))
)

(cl:defclass JointTorque (<JointTorque>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <JointTorque>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'JointTorque)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-msg:<JointTorque> is deprecated: use iiwa_msgs-msg:JointTorque instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <JointTorque>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:header-val is deprecated.  Use iiwa_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'torque-val :lambda-list '(m))
(cl:defmethod torque-val ((m <JointTorque>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:torque-val is deprecated.  Use iiwa_msgs-msg:torque instead.")
  (torque m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <JointTorque>) ostream)
  "Serializes a message object of type '<JointTorque>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'torque) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <JointTorque>) istream)
  "Deserializes a message object of type '<JointTorque>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'torque) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<JointTorque>)))
  "Returns string type for a message object of type '<JointTorque>"
  "iiwa_msgs/JointTorque")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'JointTorque)))
  "Returns string type for a message object of type 'JointTorque"
  "iiwa_msgs/JointTorque")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<JointTorque>)))
  "Returns md5sum for a message object of type '<JointTorque>"
  "8a43c6408fbfc30d42559acdf6c2c73c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'JointTorque)))
  "Returns md5sum for a message object of type 'JointTorque"
  "8a43c6408fbfc30d42559acdf6c2c73c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<JointTorque>)))
  "Returns full string definition for message of type '<JointTorque>"
  (cl:format cl:nil "Header header~%JointQuantity torque~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: iiwa_msgs/JointQuantity~%float32 a1~%float32 a2~%float32 a3~%float32 a4~%float32 a5~%float32 a6~%float32 a7~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'JointTorque)))
  "Returns full string definition for message of type 'JointTorque"
  (cl:format cl:nil "Header header~%JointQuantity torque~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: iiwa_msgs/JointQuantity~%float32 a1~%float32 a2~%float32 a3~%float32 a4~%float32 a5~%float32 a6~%float32 a7~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <JointTorque>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'torque))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <JointTorque>))
  "Converts a ROS message object to a list"
  (cl:list 'JointTorque
    (cl:cons ':header (header msg))
    (cl:cons ':torque (torque msg))
))
