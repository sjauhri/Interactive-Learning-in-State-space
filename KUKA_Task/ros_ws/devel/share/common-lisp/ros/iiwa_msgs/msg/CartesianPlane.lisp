; Auto-generated. Do not edit!


(cl:in-package iiwa_msgs-msg)


;//! \htmlinclude CartesianPlane.msg.html

(cl:defclass <CartesianPlane> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass CartesianPlane (<CartesianPlane>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CartesianPlane>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CartesianPlane)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-msg:<CartesianPlane> is deprecated: use iiwa_msgs-msg:CartesianPlane instead.")))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<CartesianPlane>)))
    "Constants for message type '<CartesianPlane>"
  '((:XY . 1)
    (:XZ . 2)
    (:YZ . 3))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'CartesianPlane)))
    "Constants for message type 'CartesianPlane"
  '((:XY . 1)
    (:XZ . 2)
    (:YZ . 3))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CartesianPlane>) ostream)
  "Serializes a message object of type '<CartesianPlane>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CartesianPlane>) istream)
  "Deserializes a message object of type '<CartesianPlane>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CartesianPlane>)))
  "Returns string type for a message object of type '<CartesianPlane>"
  "iiwa_msgs/CartesianPlane")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CartesianPlane)))
  "Returns string type for a message object of type 'CartesianPlane"
  "iiwa_msgs/CartesianPlane")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CartesianPlane>)))
  "Returns md5sum for a message object of type '<CartesianPlane>"
  "15617e8d13d4abd04145334685da37ba")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CartesianPlane)))
  "Returns md5sum for a message object of type 'CartesianPlane"
  "15617e8d13d4abd04145334685da37ba")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CartesianPlane>)))
  "Returns full string definition for message of type '<CartesianPlane>"
  (cl:format cl:nil "int32 XY = 1~%int32 XZ = 2~%int32 YZ = 3~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CartesianPlane)))
  "Returns full string definition for message of type 'CartesianPlane"
  (cl:format cl:nil "int32 XY = 1~%int32 XZ = 2~%int32 YZ = 3~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CartesianPlane>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CartesianPlane>))
  "Converts a ROS message object to a list"
  (cl:list 'CartesianPlane
))
