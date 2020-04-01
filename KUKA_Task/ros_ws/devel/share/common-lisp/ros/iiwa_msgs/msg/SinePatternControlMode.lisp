; Auto-generated. Do not edit!


(cl:in-package iiwa_msgs-msg)


;//! \htmlinclude SinePatternControlMode.msg.html

(cl:defclass <SinePatternControlMode> (roslisp-msg-protocol:ros-message)
  ((cartesian_dof
    :reader cartesian_dof
    :initarg :cartesian_dof
    :type cl:integer
    :initform 0)
   (frequency
    :reader frequency
    :initarg :frequency
    :type cl:float
    :initform 0.0)
   (amplitude
    :reader amplitude
    :initarg :amplitude
    :type cl:float
    :initform 0.0)
   (stiffness
    :reader stiffness
    :initarg :stiffness
    :type cl:float
    :initform 0.0))
)

(cl:defclass SinePatternControlMode (<SinePatternControlMode>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SinePatternControlMode>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SinePatternControlMode)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-msg:<SinePatternControlMode> is deprecated: use iiwa_msgs-msg:SinePatternControlMode instead.")))

(cl:ensure-generic-function 'cartesian_dof-val :lambda-list '(m))
(cl:defmethod cartesian_dof-val ((m <SinePatternControlMode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:cartesian_dof-val is deprecated.  Use iiwa_msgs-msg:cartesian_dof instead.")
  (cartesian_dof m))

(cl:ensure-generic-function 'frequency-val :lambda-list '(m))
(cl:defmethod frequency-val ((m <SinePatternControlMode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:frequency-val is deprecated.  Use iiwa_msgs-msg:frequency instead.")
  (frequency m))

(cl:ensure-generic-function 'amplitude-val :lambda-list '(m))
(cl:defmethod amplitude-val ((m <SinePatternControlMode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:amplitude-val is deprecated.  Use iiwa_msgs-msg:amplitude instead.")
  (amplitude m))

(cl:ensure-generic-function 'stiffness-val :lambda-list '(m))
(cl:defmethod stiffness-val ((m <SinePatternControlMode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:stiffness-val is deprecated.  Use iiwa_msgs-msg:stiffness instead.")
  (stiffness m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SinePatternControlMode>) ostream)
  "Serializes a message object of type '<SinePatternControlMode>"
  (cl:let* ((signed (cl:slot-value msg 'cartesian_dof)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'frequency))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'amplitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'stiffness))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SinePatternControlMode>) istream)
  "Deserializes a message object of type '<SinePatternControlMode>"
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
    (cl:setf (cl:slot-value msg 'frequency) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'amplitude) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'stiffness) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SinePatternControlMode>)))
  "Returns string type for a message object of type '<SinePatternControlMode>"
  "iiwa_msgs/SinePatternControlMode")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SinePatternControlMode)))
  "Returns string type for a message object of type 'SinePatternControlMode"
  "iiwa_msgs/SinePatternControlMode")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SinePatternControlMode>)))
  "Returns md5sum for a message object of type '<SinePatternControlMode>"
  "e72785e47bec423cb99a63dd32ae2a54")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SinePatternControlMode)))
  "Returns md5sum for a message object of type 'SinePatternControlMode"
  "e72785e47bec423cb99a63dd32ae2a54")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SinePatternControlMode>)))
  "Returns full string definition for message of type '<SinePatternControlMode>"
  (cl:format cl:nil "# The degree of freedom for performing the sine oscillation.~%int32 cartesian_dof~%~%# The value of the frequency for the sine oscillation [Hz].~%float64 frequency~%~%# The value of the amplitude. In [N].~%float64 amplitude~%~%# The value of the stiffness. In [N/m].~%float64 stiffness~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SinePatternControlMode)))
  "Returns full string definition for message of type 'SinePatternControlMode"
  (cl:format cl:nil "# The degree of freedom for performing the sine oscillation.~%int32 cartesian_dof~%~%# The value of the frequency for the sine oscillation [Hz].~%float64 frequency~%~%# The value of the amplitude. In [N].~%float64 amplitude~%~%# The value of the stiffness. In [N/m].~%float64 stiffness~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SinePatternControlMode>))
  (cl:+ 0
     4
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SinePatternControlMode>))
  "Converts a ROS message object to a list"
  (cl:list 'SinePatternControlMode
    (cl:cons ':cartesian_dof (cartesian_dof msg))
    (cl:cons ':frequency (frequency msg))
    (cl:cons ':amplitude (amplitude msg))
    (cl:cons ':stiffness (stiffness msg))
))
