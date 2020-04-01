; Auto-generated. Do not edit!


(cl:in-package iiwa_msgs-msg)


;//! \htmlinclude DOF.msg.html

(cl:defclass <DOF> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass DOF (<DOF>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DOF>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DOF)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-msg:<DOF> is deprecated: use iiwa_msgs-msg:DOF instead.")))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<DOF>)))
    "Constants for message type '<DOF>"
  '((:X . 1)
    (:Y . 2)
    (:Z . 3)
    (:A . 4)
    (:B . 5)
    (:C . 6)
    (:ROT . 7)
    (:TRANSL . 8)
    (:ALL . 9))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'DOF)))
    "Constants for message type 'DOF"
  '((:X . 1)
    (:Y . 2)
    (:Z . 3)
    (:A . 4)
    (:B . 5)
    (:C . 6)
    (:ROT . 7)
    (:TRANSL . 8)
    (:ALL . 9))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DOF>) ostream)
  "Serializes a message object of type '<DOF>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DOF>) istream)
  "Deserializes a message object of type '<DOF>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DOF>)))
  "Returns string type for a message object of type '<DOF>"
  "iiwa_msgs/DOF")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DOF)))
  "Returns string type for a message object of type 'DOF"
  "iiwa_msgs/DOF")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DOF>)))
  "Returns md5sum for a message object of type '<DOF>"
  "c1a133d87080cb4a84e23090e4a06363")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DOF)))
  "Returns md5sum for a message object of type 'DOF"
  "c1a133d87080cb4a84e23090e4a06363")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DOF>)))
  "Returns full string definition for message of type '<DOF>"
  (cl:format cl:nil "int32 X = 1~%int32 Y = 2~%int32 Z = 3~%int32 A = 4~%int32 B = 5~%int32 C = 6~%int32 ROT = 7~%int32 TRANSL = 8~%int32 ALL = 9~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DOF)))
  "Returns full string definition for message of type 'DOF"
  (cl:format cl:nil "int32 X = 1~%int32 Y = 2~%int32 Z = 3~%int32 A = 4~%int32 B = 5~%int32 C = 6~%int32 ROT = 7~%int32 TRANSL = 8~%int32 ALL = 9~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DOF>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DOF>))
  "Converts a ROS message object to a list"
  (cl:list 'DOF
))
