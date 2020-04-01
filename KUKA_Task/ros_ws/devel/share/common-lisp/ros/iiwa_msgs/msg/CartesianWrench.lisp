; Auto-generated. Do not edit!


(cl:in-package iiwa_msgs-msg)


;//! \htmlinclude CartesianWrench.msg.html

(cl:defclass <CartesianWrench> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (wrench
    :reader wrench
    :initarg :wrench
    :type geometry_msgs-msg:Wrench
    :initform (cl:make-instance 'geometry_msgs-msg:Wrench))
   (inaccuracy
    :reader inaccuracy
    :initarg :inaccuracy
    :type geometry_msgs-msg:Wrench
    :initform (cl:make-instance 'geometry_msgs-msg:Wrench)))
)

(cl:defclass CartesianWrench (<CartesianWrench>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CartesianWrench>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CartesianWrench)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-msg:<CartesianWrench> is deprecated: use iiwa_msgs-msg:CartesianWrench instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <CartesianWrench>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:header-val is deprecated.  Use iiwa_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'wrench-val :lambda-list '(m))
(cl:defmethod wrench-val ((m <CartesianWrench>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:wrench-val is deprecated.  Use iiwa_msgs-msg:wrench instead.")
  (wrench m))

(cl:ensure-generic-function 'inaccuracy-val :lambda-list '(m))
(cl:defmethod inaccuracy-val ((m <CartesianWrench>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:inaccuracy-val is deprecated.  Use iiwa_msgs-msg:inaccuracy instead.")
  (inaccuracy m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CartesianWrench>) ostream)
  "Serializes a message object of type '<CartesianWrench>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'wrench) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'inaccuracy) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CartesianWrench>) istream)
  "Deserializes a message object of type '<CartesianWrench>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'wrench) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'inaccuracy) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CartesianWrench>)))
  "Returns string type for a message object of type '<CartesianWrench>"
  "iiwa_msgs/CartesianWrench")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CartesianWrench)))
  "Returns string type for a message object of type 'CartesianWrench"
  "iiwa_msgs/CartesianWrench")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CartesianWrench>)))
  "Returns md5sum for a message object of type '<CartesianWrench>"
  "b710d3269f35c0e4079ef3ef88f25c6c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CartesianWrench)))
  "Returns md5sum for a message object of type 'CartesianWrench"
  "b710d3269f35c0e4079ef3ef88f25c6c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CartesianWrench>)))
  "Returns full string definition for message of type '<CartesianWrench>"
  (cl:format cl:nil "# Cartesian Wrench~%Header header~%geometry_msgs/Wrench wrench~%geometry_msgs/Wrench inaccuracy~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Wrench~%# This represents force in free space, separated into~%# its linear and angular parts.~%Vector3  force~%Vector3  torque~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CartesianWrench)))
  "Returns full string definition for message of type 'CartesianWrench"
  (cl:format cl:nil "# Cartesian Wrench~%Header header~%geometry_msgs/Wrench wrench~%geometry_msgs/Wrench inaccuracy~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Wrench~%# This represents force in free space, separated into~%# its linear and angular parts.~%Vector3  force~%Vector3  torque~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CartesianWrench>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'wrench))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'inaccuracy))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CartesianWrench>))
  "Converts a ROS message object to a list"
  (cl:list 'CartesianWrench
    (cl:cons ':header (header msg))
    (cl:cons ':wrench (wrench msg))
    (cl:cons ':inaccuracy (inaccuracy msg))
))
