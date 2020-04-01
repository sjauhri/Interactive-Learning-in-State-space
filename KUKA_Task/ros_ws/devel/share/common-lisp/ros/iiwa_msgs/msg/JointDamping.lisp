; Auto-generated. Do not edit!


(cl:in-package iiwa_msgs-msg)


;//! \htmlinclude JointDamping.msg.html

(cl:defclass <JointDamping> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (damping
    :reader damping
    :initarg :damping
    :type iiwa_msgs-msg:JointQuantity
    :initform (cl:make-instance 'iiwa_msgs-msg:JointQuantity)))
)

(cl:defclass JointDamping (<JointDamping>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <JointDamping>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'JointDamping)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-msg:<JointDamping> is deprecated: use iiwa_msgs-msg:JointDamping instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <JointDamping>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:header-val is deprecated.  Use iiwa_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'damping-val :lambda-list '(m))
(cl:defmethod damping-val ((m <JointDamping>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:damping-val is deprecated.  Use iiwa_msgs-msg:damping instead.")
  (damping m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <JointDamping>) ostream)
  "Serializes a message object of type '<JointDamping>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'damping) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <JointDamping>) istream)
  "Deserializes a message object of type '<JointDamping>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'damping) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<JointDamping>)))
  "Returns string type for a message object of type '<JointDamping>"
  "iiwa_msgs/JointDamping")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'JointDamping)))
  "Returns string type for a message object of type 'JointDamping"
  "iiwa_msgs/JointDamping")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<JointDamping>)))
  "Returns md5sum for a message object of type '<JointDamping>"
  "92566eca940b47ec439bd2e3591ff78a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'JointDamping)))
  "Returns md5sum for a message object of type 'JointDamping"
  "92566eca940b47ec439bd2e3591ff78a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<JointDamping>)))
  "Returns full string definition for message of type '<JointDamping>"
  (cl:format cl:nil "Header header~%JointQuantity damping~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: iiwa_msgs/JointQuantity~%float32 a1~%float32 a2~%float32 a3~%float32 a4~%float32 a5~%float32 a6~%float32 a7~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'JointDamping)))
  "Returns full string definition for message of type 'JointDamping"
  (cl:format cl:nil "Header header~%JointQuantity damping~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: iiwa_msgs/JointQuantity~%float32 a1~%float32 a2~%float32 a3~%float32 a4~%float32 a5~%float32 a6~%float32 a7~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <JointDamping>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'damping))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <JointDamping>))
  "Converts a ROS message object to a list"
  (cl:list 'JointDamping
    (cl:cons ':header (header msg))
    (cl:cons ':damping (damping msg))
))
