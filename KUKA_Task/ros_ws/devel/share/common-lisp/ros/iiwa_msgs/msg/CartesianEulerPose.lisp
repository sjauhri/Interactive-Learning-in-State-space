; Auto-generated. Do not edit!


(cl:in-package iiwa_msgs-msg)


;//! \htmlinclude CartesianEulerPose.msg.html

(cl:defclass <CartesianEulerPose> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (pose
    :reader pose
    :initarg :pose
    :type iiwa_msgs-msg:CartesianQuantity
    :initform (cl:make-instance 'iiwa_msgs-msg:CartesianQuantity)))
)

(cl:defclass CartesianEulerPose (<CartesianEulerPose>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CartesianEulerPose>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CartesianEulerPose)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-msg:<CartesianEulerPose> is deprecated: use iiwa_msgs-msg:CartesianEulerPose instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <CartesianEulerPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:header-val is deprecated.  Use iiwa_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <CartesianEulerPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:pose-val is deprecated.  Use iiwa_msgs-msg:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CartesianEulerPose>) ostream)
  "Serializes a message object of type '<CartesianEulerPose>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CartesianEulerPose>) istream)
  "Deserializes a message object of type '<CartesianEulerPose>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CartesianEulerPose>)))
  "Returns string type for a message object of type '<CartesianEulerPose>"
  "iiwa_msgs/CartesianEulerPose")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CartesianEulerPose)))
  "Returns string type for a message object of type 'CartesianEulerPose"
  "iiwa_msgs/CartesianEulerPose")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CartesianEulerPose>)))
  "Returns md5sum for a message object of type '<CartesianEulerPose>"
  "007ae8f5dcbe93f7ab42a1d24885796d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CartesianEulerPose)))
  "Returns md5sum for a message object of type 'CartesianEulerPose"
  "007ae8f5dcbe93f7ab42a1d24885796d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CartesianEulerPose>)))
  "Returns full string definition for message of type '<CartesianEulerPose>"
  (cl:format cl:nil "Header header~%CartesianQuantity pose~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: iiwa_msgs/CartesianQuantity~%float32 x~%float32 y~%float32 z~%float32 a~%float32 b~%float32 c~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CartesianEulerPose)))
  "Returns full string definition for message of type 'CartesianEulerPose"
  (cl:format cl:nil "Header header~%CartesianQuantity pose~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: iiwa_msgs/CartesianQuantity~%float32 x~%float32 y~%float32 z~%float32 a~%float32 b~%float32 c~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CartesianEulerPose>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CartesianEulerPose>))
  "Converts a ROS message object to a list"
  (cl:list 'CartesianEulerPose
    (cl:cons ':header (header msg))
    (cl:cons ':pose (pose msg))
))
