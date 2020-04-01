; Auto-generated. Do not edit!


(cl:in-package iiwa_msgs-msg)


;//! \htmlinclude ControlMode.msg.html

(cl:defclass <ControlMode> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ControlMode (<ControlMode>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ControlMode>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ControlMode)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-msg:<ControlMode> is deprecated: use iiwa_msgs-msg:ControlMode instead.")))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<ControlMode>)))
    "Constants for message type '<ControlMode>"
  '((:POSITION_CONTROL . 0)
    (:JOINT_IMPEDANCE . 1)
    (:CARTESIAN_IMPEDANCE . 2)
    (:DESIRED_FORCE . 3)
    (:SINE_PATTERN . 4))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'ControlMode)))
    "Constants for message type 'ControlMode"
  '((:POSITION_CONTROL . 0)
    (:JOINT_IMPEDANCE . 1)
    (:CARTESIAN_IMPEDANCE . 2)
    (:DESIRED_FORCE . 3)
    (:SINE_PATTERN . 4))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ControlMode>) ostream)
  "Serializes a message object of type '<ControlMode>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ControlMode>) istream)
  "Deserializes a message object of type '<ControlMode>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ControlMode>)))
  "Returns string type for a message object of type '<ControlMode>"
  "iiwa_msgs/ControlMode")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ControlMode)))
  "Returns string type for a message object of type 'ControlMode"
  "iiwa_msgs/ControlMode")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ControlMode>)))
  "Returns md5sum for a message object of type '<ControlMode>"
  "fbf6f4c74f01882c27df4152be6af2d9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ControlMode)))
  "Returns md5sum for a message object of type 'ControlMode"
  "fbf6f4c74f01882c27df4152be6af2d9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ControlMode>)))
  "Returns full string definition for message of type '<ControlMode>"
  (cl:format cl:nil "int32 POSITION_CONTROL = 0~%int32 JOINT_IMPEDANCE =  1~%int32 CARTESIAN_IMPEDANCE = 2~%int32 DESIRED_FORCE = 3~%int32 SINE_PATTERN = 4~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ControlMode)))
  "Returns full string definition for message of type 'ControlMode"
  (cl:format cl:nil "int32 POSITION_CONTROL = 0~%int32 JOINT_IMPEDANCE =  1~%int32 CARTESIAN_IMPEDANCE = 2~%int32 DESIRED_FORCE = 3~%int32 SINE_PATTERN = 4~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ControlMode>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ControlMode>))
  "Converts a ROS message object to a list"
  (cl:list 'ControlMode
))
