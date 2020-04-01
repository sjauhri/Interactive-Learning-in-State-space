; Auto-generated. Do not edit!


(cl:in-package iiwa_msgs-msg)


;//! \htmlinclude CartesianVelocity.msg.html

(cl:defclass <CartesianVelocity> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (velocity
    :reader velocity
    :initarg :velocity
    :type iiwa_msgs-msg:CartesianQuantity
    :initform (cl:make-instance 'iiwa_msgs-msg:CartesianQuantity)))
)

(cl:defclass CartesianVelocity (<CartesianVelocity>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CartesianVelocity>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CartesianVelocity)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-msg:<CartesianVelocity> is deprecated: use iiwa_msgs-msg:CartesianVelocity instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <CartesianVelocity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:header-val is deprecated.  Use iiwa_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <CartesianVelocity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:velocity-val is deprecated.  Use iiwa_msgs-msg:velocity instead.")
  (velocity m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CartesianVelocity>) ostream)
  "Serializes a message object of type '<CartesianVelocity>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'velocity) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CartesianVelocity>) istream)
  "Deserializes a message object of type '<CartesianVelocity>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'velocity) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CartesianVelocity>)))
  "Returns string type for a message object of type '<CartesianVelocity>"
  "iiwa_msgs/CartesianVelocity")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CartesianVelocity)))
  "Returns string type for a message object of type 'CartesianVelocity"
  "iiwa_msgs/CartesianVelocity")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CartesianVelocity>)))
  "Returns md5sum for a message object of type '<CartesianVelocity>"
  "e7362f328353be8a6cf8b8ff5cd15e56")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CartesianVelocity)))
  "Returns md5sum for a message object of type 'CartesianVelocity"
  "e7362f328353be8a6cf8b8ff5cd15e56")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CartesianVelocity>)))
  "Returns full string definition for message of type '<CartesianVelocity>"
  (cl:format cl:nil "Header header~%CartesianQuantity velocity~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: iiwa_msgs/CartesianQuantity~%float32 x~%float32 y~%float32 z~%float32 a~%float32 b~%float32 c~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CartesianVelocity)))
  "Returns full string definition for message of type 'CartesianVelocity"
  (cl:format cl:nil "Header header~%CartesianQuantity velocity~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: iiwa_msgs/CartesianQuantity~%float32 x~%float32 y~%float32 z~%float32 a~%float32 b~%float32 c~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CartesianVelocity>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'velocity))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CartesianVelocity>))
  "Converts a ROS message object to a list"
  (cl:list 'CartesianVelocity
    (cl:cons ':header (header msg))
    (cl:cons ':velocity (velocity msg))
))
