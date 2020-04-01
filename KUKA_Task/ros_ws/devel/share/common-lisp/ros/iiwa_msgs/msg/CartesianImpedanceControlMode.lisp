; Auto-generated. Do not edit!


(cl:in-package iiwa_msgs-msg)


;//! \htmlinclude CartesianImpedanceControlMode.msg.html

(cl:defclass <CartesianImpedanceControlMode> (roslisp-msg-protocol:ros-message)
  ((cartesian_stiffness
    :reader cartesian_stiffness
    :initarg :cartesian_stiffness
    :type iiwa_msgs-msg:CartesianQuantity
    :initform (cl:make-instance 'iiwa_msgs-msg:CartesianQuantity))
   (cartesian_damping
    :reader cartesian_damping
    :initarg :cartesian_damping
    :type iiwa_msgs-msg:CartesianQuantity
    :initform (cl:make-instance 'iiwa_msgs-msg:CartesianQuantity))
   (nullspace_stiffness
    :reader nullspace_stiffness
    :initarg :nullspace_stiffness
    :type cl:float
    :initform 0.0)
   (nullspace_damping
    :reader nullspace_damping
    :initarg :nullspace_damping
    :type cl:float
    :initform 0.0))
)

(cl:defclass CartesianImpedanceControlMode (<CartesianImpedanceControlMode>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CartesianImpedanceControlMode>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CartesianImpedanceControlMode)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-msg:<CartesianImpedanceControlMode> is deprecated: use iiwa_msgs-msg:CartesianImpedanceControlMode instead.")))

(cl:ensure-generic-function 'cartesian_stiffness-val :lambda-list '(m))
(cl:defmethod cartesian_stiffness-val ((m <CartesianImpedanceControlMode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:cartesian_stiffness-val is deprecated.  Use iiwa_msgs-msg:cartesian_stiffness instead.")
  (cartesian_stiffness m))

(cl:ensure-generic-function 'cartesian_damping-val :lambda-list '(m))
(cl:defmethod cartesian_damping-val ((m <CartesianImpedanceControlMode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:cartesian_damping-val is deprecated.  Use iiwa_msgs-msg:cartesian_damping instead.")
  (cartesian_damping m))

(cl:ensure-generic-function 'nullspace_stiffness-val :lambda-list '(m))
(cl:defmethod nullspace_stiffness-val ((m <CartesianImpedanceControlMode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:nullspace_stiffness-val is deprecated.  Use iiwa_msgs-msg:nullspace_stiffness instead.")
  (nullspace_stiffness m))

(cl:ensure-generic-function 'nullspace_damping-val :lambda-list '(m))
(cl:defmethod nullspace_damping-val ((m <CartesianImpedanceControlMode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:nullspace_damping-val is deprecated.  Use iiwa_msgs-msg:nullspace_damping instead.")
  (nullspace_damping m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CartesianImpedanceControlMode>) ostream)
  "Serializes a message object of type '<CartesianImpedanceControlMode>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'cartesian_stiffness) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'cartesian_damping) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'nullspace_stiffness))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'nullspace_damping))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CartesianImpedanceControlMode>) istream)
  "Deserializes a message object of type '<CartesianImpedanceControlMode>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'cartesian_stiffness) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'cartesian_damping) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'nullspace_stiffness) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'nullspace_damping) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CartesianImpedanceControlMode>)))
  "Returns string type for a message object of type '<CartesianImpedanceControlMode>"
  "iiwa_msgs/CartesianImpedanceControlMode")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CartesianImpedanceControlMode)))
  "Returns string type for a message object of type 'CartesianImpedanceControlMode"
  "iiwa_msgs/CartesianImpedanceControlMode")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CartesianImpedanceControlMode>)))
  "Returns md5sum for a message object of type '<CartesianImpedanceControlMode>"
  "7c03442e16efac806b59fb2795f102eb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CartesianImpedanceControlMode)))
  "Returns md5sum for a message object of type 'CartesianImpedanceControlMode"
  "7c03442e16efac806b59fb2795f102eb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CartesianImpedanceControlMode>)))
  "Returns full string definition for message of type '<CartesianImpedanceControlMode>"
  (cl:format cl:nil "~%# Stiffness values [x, y, z, a, b, c] for the cartesian impedance, x, y, z in [N/m], a, b, c in [Nm/rad]. ~%# Precondition: 0.0 <= x, y, z <= 5000.0 and 0.0 <= a, b, c <= 300.0. ~%CartesianQuantity cartesian_stiffness~%~%# Dimensionless damping values for the cartesian impedance control, for all degrees of freedom : [x, y, z, a, b, c].~%# Precondition: 0.1 <= x, y, z, a, b, c <= 1.0. ~%CartesianQuantity cartesian_damping~%~%# The stiffness value for null space [Nm/rad]. ~%# Precondition: 0.0 <= value. ~%float64 nullspace_stiffness~%~%# The damping parameter for null space [Nm*s/rad]. ~%# Precondition: value >= 0.3 and value <= 1.0. - A good damping value is 0.7. ~%float64 nullspace_damping~%================================================================================~%MSG: iiwa_msgs/CartesianQuantity~%float32 x~%float32 y~%float32 z~%float32 a~%float32 b~%float32 c~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CartesianImpedanceControlMode)))
  "Returns full string definition for message of type 'CartesianImpedanceControlMode"
  (cl:format cl:nil "~%# Stiffness values [x, y, z, a, b, c] for the cartesian impedance, x, y, z in [N/m], a, b, c in [Nm/rad]. ~%# Precondition: 0.0 <= x, y, z <= 5000.0 and 0.0 <= a, b, c <= 300.0. ~%CartesianQuantity cartesian_stiffness~%~%# Dimensionless damping values for the cartesian impedance control, for all degrees of freedom : [x, y, z, a, b, c].~%# Precondition: 0.1 <= x, y, z, a, b, c <= 1.0. ~%CartesianQuantity cartesian_damping~%~%# The stiffness value for null space [Nm/rad]. ~%# Precondition: 0.0 <= value. ~%float64 nullspace_stiffness~%~%# The damping parameter for null space [Nm*s/rad]. ~%# Precondition: value >= 0.3 and value <= 1.0. - A good damping value is 0.7. ~%float64 nullspace_damping~%================================================================================~%MSG: iiwa_msgs/CartesianQuantity~%float32 x~%float32 y~%float32 z~%float32 a~%float32 b~%float32 c~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CartesianImpedanceControlMode>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'cartesian_stiffness))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'cartesian_damping))
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CartesianImpedanceControlMode>))
  "Converts a ROS message object to a list"
  (cl:list 'CartesianImpedanceControlMode
    (cl:cons ':cartesian_stiffness (cartesian_stiffness msg))
    (cl:cons ':cartesian_damping (cartesian_damping msg))
    (cl:cons ':nullspace_stiffness (nullspace_stiffness msg))
    (cl:cons ':nullspace_damping (nullspace_damping msg))
))
