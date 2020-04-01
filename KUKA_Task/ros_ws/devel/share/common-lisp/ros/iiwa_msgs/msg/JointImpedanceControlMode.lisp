; Auto-generated. Do not edit!


(cl:in-package iiwa_msgs-msg)


;//! \htmlinclude JointImpedanceControlMode.msg.html

(cl:defclass <JointImpedanceControlMode> (roslisp-msg-protocol:ros-message)
  ((joint_stiffness
    :reader joint_stiffness
    :initarg :joint_stiffness
    :type iiwa_msgs-msg:JointQuantity
    :initform (cl:make-instance 'iiwa_msgs-msg:JointQuantity))
   (joint_damping
    :reader joint_damping
    :initarg :joint_damping
    :type iiwa_msgs-msg:JointQuantity
    :initform (cl:make-instance 'iiwa_msgs-msg:JointQuantity)))
)

(cl:defclass JointImpedanceControlMode (<JointImpedanceControlMode>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <JointImpedanceControlMode>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'JointImpedanceControlMode)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-msg:<JointImpedanceControlMode> is deprecated: use iiwa_msgs-msg:JointImpedanceControlMode instead.")))

(cl:ensure-generic-function 'joint_stiffness-val :lambda-list '(m))
(cl:defmethod joint_stiffness-val ((m <JointImpedanceControlMode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:joint_stiffness-val is deprecated.  Use iiwa_msgs-msg:joint_stiffness instead.")
  (joint_stiffness m))

(cl:ensure-generic-function 'joint_damping-val :lambda-list '(m))
(cl:defmethod joint_damping-val ((m <JointImpedanceControlMode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:joint_damping-val is deprecated.  Use iiwa_msgs-msg:joint_damping instead.")
  (joint_damping m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <JointImpedanceControlMode>) ostream)
  "Serializes a message object of type '<JointImpedanceControlMode>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'joint_stiffness) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'joint_damping) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <JointImpedanceControlMode>) istream)
  "Deserializes a message object of type '<JointImpedanceControlMode>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'joint_stiffness) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'joint_damping) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<JointImpedanceControlMode>)))
  "Returns string type for a message object of type '<JointImpedanceControlMode>"
  "iiwa_msgs/JointImpedanceControlMode")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'JointImpedanceControlMode)))
  "Returns string type for a message object of type 'JointImpedanceControlMode"
  "iiwa_msgs/JointImpedanceControlMode")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<JointImpedanceControlMode>)))
  "Returns md5sum for a message object of type '<JointImpedanceControlMode>"
  "c2267019473eba8c0a4619b649192c0d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'JointImpedanceControlMode)))
  "Returns md5sum for a message object of type 'JointImpedanceControlMode"
  "c2267019473eba8c0a4619b649192c0d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<JointImpedanceControlMode>)))
  "Returns full string definition for message of type '<JointImpedanceControlMode>"
  (cl:format cl:nil "# Stiffness values in [Nm/rad]. Stiffness values must be >= 0. ~%JointQuantity joint_stiffness~%~%# Damping values. Damping values must be between 0 and 1. ~%JointQuantity joint_damping~%~%================================================================================~%MSG: iiwa_msgs/JointQuantity~%float32 a1~%float32 a2~%float32 a3~%float32 a4~%float32 a5~%float32 a6~%float32 a7~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'JointImpedanceControlMode)))
  "Returns full string definition for message of type 'JointImpedanceControlMode"
  (cl:format cl:nil "# Stiffness values in [Nm/rad]. Stiffness values must be >= 0. ~%JointQuantity joint_stiffness~%~%# Damping values. Damping values must be between 0 and 1. ~%JointQuantity joint_damping~%~%================================================================================~%MSG: iiwa_msgs/JointQuantity~%float32 a1~%float32 a2~%float32 a3~%float32 a4~%float32 a5~%float32 a6~%float32 a7~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <JointImpedanceControlMode>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'joint_stiffness))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'joint_damping))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <JointImpedanceControlMode>))
  "Converts a ROS message object to a list"
  (cl:list 'JointImpedanceControlMode
    (cl:cons ':joint_stiffness (joint_stiffness msg))
    (cl:cons ':joint_damping (joint_damping msg))
))
