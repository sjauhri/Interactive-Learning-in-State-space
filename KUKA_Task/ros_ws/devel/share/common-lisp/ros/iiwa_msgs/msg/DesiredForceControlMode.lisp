; Auto-generated. Do not edit!


(cl:in-package iiwa_msgs-msg)


;//! \htmlinclude DesiredForceControlMode.msg.html

(cl:defclass <DesiredForceControlMode> (roslisp-msg-protocol:ros-message)
  ((cartesian_dof
    :reader cartesian_dof
    :initarg :cartesian_dof
    :type cl:integer
    :initform 0)
   (desired_force
    :reader desired_force
    :initarg :desired_force
    :type cl:float
    :initform 0.0)
   (desired_stiffness
    :reader desired_stiffness
    :initarg :desired_stiffness
    :type cl:float
    :initform 0.0))
)

(cl:defclass DesiredForceControlMode (<DesiredForceControlMode>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DesiredForceControlMode>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DesiredForceControlMode)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-msg:<DesiredForceControlMode> is deprecated: use iiwa_msgs-msg:DesiredForceControlMode instead.")))

(cl:ensure-generic-function 'cartesian_dof-val :lambda-list '(m))
(cl:defmethod cartesian_dof-val ((m <DesiredForceControlMode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:cartesian_dof-val is deprecated.  Use iiwa_msgs-msg:cartesian_dof instead.")
  (cartesian_dof m))

(cl:ensure-generic-function 'desired_force-val :lambda-list '(m))
(cl:defmethod desired_force-val ((m <DesiredForceControlMode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:desired_force-val is deprecated.  Use iiwa_msgs-msg:desired_force instead.")
  (desired_force m))

(cl:ensure-generic-function 'desired_stiffness-val :lambda-list '(m))
(cl:defmethod desired_stiffness-val ((m <DesiredForceControlMode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:desired_stiffness-val is deprecated.  Use iiwa_msgs-msg:desired_stiffness instead.")
  (desired_stiffness m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DesiredForceControlMode>) ostream)
  "Serializes a message object of type '<DesiredForceControlMode>"
  (cl:let* ((signed (cl:slot-value msg 'cartesian_dof)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'desired_force))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'desired_stiffness))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DesiredForceControlMode>) istream)
  "Deserializes a message object of type '<DesiredForceControlMode>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'cartesian_dof) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'desired_force) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'desired_stiffness) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DesiredForceControlMode>)))
  "Returns string type for a message object of type '<DesiredForceControlMode>"
  "iiwa_msgs/DesiredForceControlMode")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DesiredForceControlMode)))
  "Returns string type for a message object of type 'DesiredForceControlMode"
  "iiwa_msgs/DesiredForceControlMode")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DesiredForceControlMode>)))
  "Returns md5sum for a message object of type '<DesiredForceControlMode>"
  "da11717a4c7e94e66d2e956ead0bf6f3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DesiredForceControlMode)))
  "Returns md5sum for a message object of type 'DesiredForceControlMode"
  "da11717a4c7e94e66d2e956ead0bf6f3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DesiredForceControlMode>)))
  "Returns full string definition for message of type '<DesiredForceControlMode>"
  (cl:format cl:nil "# The degree of freedom on which the desired force~%int32 cartesian_dof~%~%# The value of the desired force. In [N].~%float64 desired_force~%~%# The value of the stiffness. In [N/m].~%float64 desired_stiffness~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DesiredForceControlMode)))
  "Returns full string definition for message of type 'DesiredForceControlMode"
  (cl:format cl:nil "# The degree of freedom on which the desired force~%int32 cartesian_dof~%~%# The value of the desired force. In [N].~%float64 desired_force~%~%# The value of the stiffness. In [N/m].~%float64 desired_stiffness~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DesiredForceControlMode>))
  (cl:+ 0
     4
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DesiredForceControlMode>))
  "Converts a ROS message object to a list"
  (cl:list 'DesiredForceControlMode
    (cl:cons ':cartesian_dof (cartesian_dof msg))
    (cl:cons ':desired_force (desired_force msg))
    (cl:cons ':desired_stiffness (desired_stiffness msg))
))
