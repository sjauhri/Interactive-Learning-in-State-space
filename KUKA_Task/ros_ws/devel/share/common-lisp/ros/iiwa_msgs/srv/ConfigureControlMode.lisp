; Auto-generated. Do not edit!


(cl:in-package iiwa_msgs-srv)


;//! \htmlinclude ConfigureControlMode-request.msg.html

(cl:defclass <ConfigureControlMode-request> (roslisp-msg-protocol:ros-message)
  ((control_mode
    :reader control_mode
    :initarg :control_mode
    :type cl:integer
    :initform 0)
   (joint_impedance
    :reader joint_impedance
    :initarg :joint_impedance
    :type iiwa_msgs-msg:JointImpedanceControlMode
    :initform (cl:make-instance 'iiwa_msgs-msg:JointImpedanceControlMode))
   (cartesian_impedance
    :reader cartesian_impedance
    :initarg :cartesian_impedance
    :type iiwa_msgs-msg:CartesianImpedanceControlMode
    :initform (cl:make-instance 'iiwa_msgs-msg:CartesianImpedanceControlMode))
   (desired_force
    :reader desired_force
    :initarg :desired_force
    :type iiwa_msgs-msg:DesiredForceControlMode
    :initform (cl:make-instance 'iiwa_msgs-msg:DesiredForceControlMode))
   (sine_pattern
    :reader sine_pattern
    :initarg :sine_pattern
    :type iiwa_msgs-msg:SinePatternControlMode
    :initform (cl:make-instance 'iiwa_msgs-msg:SinePatternControlMode))
   (limits
    :reader limits
    :initarg :limits
    :type iiwa_msgs-msg:CartesianControlModeLimits
    :initform (cl:make-instance 'iiwa_msgs-msg:CartesianControlModeLimits)))
)

(cl:defclass ConfigureControlMode-request (<ConfigureControlMode-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ConfigureControlMode-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ConfigureControlMode-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-srv:<ConfigureControlMode-request> is deprecated: use iiwa_msgs-srv:ConfigureControlMode-request instead.")))

(cl:ensure-generic-function 'control_mode-val :lambda-list '(m))
(cl:defmethod control_mode-val ((m <ConfigureControlMode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:control_mode-val is deprecated.  Use iiwa_msgs-srv:control_mode instead.")
  (control_mode m))

(cl:ensure-generic-function 'joint_impedance-val :lambda-list '(m))
(cl:defmethod joint_impedance-val ((m <ConfigureControlMode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:joint_impedance-val is deprecated.  Use iiwa_msgs-srv:joint_impedance instead.")
  (joint_impedance m))

(cl:ensure-generic-function 'cartesian_impedance-val :lambda-list '(m))
(cl:defmethod cartesian_impedance-val ((m <ConfigureControlMode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:cartesian_impedance-val is deprecated.  Use iiwa_msgs-srv:cartesian_impedance instead.")
  (cartesian_impedance m))

(cl:ensure-generic-function 'desired_force-val :lambda-list '(m))
(cl:defmethod desired_force-val ((m <ConfigureControlMode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:desired_force-val is deprecated.  Use iiwa_msgs-srv:desired_force instead.")
  (desired_force m))

(cl:ensure-generic-function 'sine_pattern-val :lambda-list '(m))
(cl:defmethod sine_pattern-val ((m <ConfigureControlMode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:sine_pattern-val is deprecated.  Use iiwa_msgs-srv:sine_pattern instead.")
  (sine_pattern m))

(cl:ensure-generic-function 'limits-val :lambda-list '(m))
(cl:defmethod limits-val ((m <ConfigureControlMode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:limits-val is deprecated.  Use iiwa_msgs-srv:limits instead.")
  (limits m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ConfigureControlMode-request>) ostream)
  "Serializes a message object of type '<ConfigureControlMode-request>"
  (cl:let* ((signed (cl:slot-value msg 'control_mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'joint_impedance) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'cartesian_impedance) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'desired_force) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'sine_pattern) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'limits) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ConfigureControlMode-request>) istream)
  "Deserializes a message object of type '<ConfigureControlMode-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'control_mode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'joint_impedance) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'cartesian_impedance) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'desired_force) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'sine_pattern) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'limits) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ConfigureControlMode-request>)))
  "Returns string type for a service object of type '<ConfigureControlMode-request>"
  "iiwa_msgs/ConfigureControlModeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ConfigureControlMode-request)))
  "Returns string type for a service object of type 'ConfigureControlMode-request"
  "iiwa_msgs/ConfigureControlModeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ConfigureControlMode-request>)))
  "Returns md5sum for a message object of type '<ConfigureControlMode-request>"
  "680a54772ae74cfe325dd171700c3d78")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ConfigureControlMode-request)))
  "Returns md5sum for a message object of type 'ConfigureControlMode-request"
  "680a54772ae74cfe325dd171700c3d78")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ConfigureControlMode-request>)))
  "Returns full string definition for message of type '<ConfigureControlMode-request>"
  (cl:format cl:nil "~%~%~%int32 control_mode~%iiwa_msgs/JointImpedanceControlMode joint_impedance~%iiwa_msgs/CartesianImpedanceControlMode cartesian_impedance~%iiwa_msgs/DesiredForceControlMode desired_force~%iiwa_msgs/SinePatternControlMode sine_pattern~%iiwa_msgs/CartesianControlModeLimits limits~%~%================================================================================~%MSG: iiwa_msgs/JointImpedanceControlMode~%# Stiffness values in [Nm/rad]. Stiffness values must be >= 0. ~%JointQuantity joint_stiffness~%~%# Damping values. Damping values must be between 0 and 1. ~%JointQuantity joint_damping~%~%================================================================================~%MSG: iiwa_msgs/JointQuantity~%float32 a1~%float32 a2~%float32 a3~%float32 a4~%float32 a5~%float32 a6~%float32 a7~%================================================================================~%MSG: iiwa_msgs/CartesianImpedanceControlMode~%~%# Stiffness values [x, y, z, a, b, c] for the cartesian impedance, x, y, z in [N/m], a, b, c in [Nm/rad]. ~%# Precondition: 0.0 <= x, y, z <= 5000.0 and 0.0 <= a, b, c <= 300.0. ~%CartesianQuantity cartesian_stiffness~%~%# Dimensionless damping values for the cartesian impedance control, for all degrees of freedom : [x, y, z, a, b, c].~%# Precondition: 0.1 <= x, y, z, a, b, c <= 1.0. ~%CartesianQuantity cartesian_damping~%~%# The stiffness value for null space [Nm/rad]. ~%# Precondition: 0.0 <= value. ~%float64 nullspace_stiffness~%~%# The damping parameter for null space [Nm*s/rad]. ~%# Precondition: value >= 0.3 and value <= 1.0. - A good damping value is 0.7. ~%float64 nullspace_damping~%================================================================================~%MSG: iiwa_msgs/CartesianQuantity~%float32 x~%float32 y~%float32 z~%float32 a~%float32 b~%float32 c~%================================================================================~%MSG: iiwa_msgs/DesiredForceControlMode~%# The degree of freedom on which the desired force~%int32 cartesian_dof~%~%# The value of the desired force. In [N].~%float64 desired_force~%~%# The value of the stiffness. In [N/m].~%float64 desired_stiffness~%================================================================================~%MSG: iiwa_msgs/SinePatternControlMode~%# The degree of freedom for performing the sine oscillation.~%int32 cartesian_dof~%~%# The value of the frequency for the sine oscillation [Hz].~%float64 frequency~%~%# The value of the amplitude. In [N].~%float64 amplitude~%~%# The value of the stiffness. In [N/m].~%float64 stiffness~%================================================================================~%MSG: iiwa_msgs/CartesianControlModeLimits~%# Sets the maximum cartesian deviation accepted. If the deviation is exceeded a stop condition occurs. ~%# [x, y, z] in [mm]. Precondition: value > 0.0.~%# [a, b, c] in [rad]. Precondition: value > 0.0.~%CartesianQuantity max_path_deviation~%~%# The maximum control force parameter.~%# [x, y, z] in [N]. Precondition: value > 0.0.~%# [a, b, c] in [Nm]. Precondition: value > 0.0.~%CartesianQuantity max_control_force~%~%# Indicates whether a stop condition is fired if the maximum control force is exceeded. ~%bool max_control_force_stop~%~%# Maximum Cartesian velocity parameter ~%# [x, y, z] in [mm/s]. Precondition: value > 0.0.~%# [a, b, c] in [rad/s]. Precondition: value > 0.0.~%CartesianQuantity max_cartesian_velocity ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ConfigureControlMode-request)))
  "Returns full string definition for message of type 'ConfigureControlMode-request"
  (cl:format cl:nil "~%~%~%int32 control_mode~%iiwa_msgs/JointImpedanceControlMode joint_impedance~%iiwa_msgs/CartesianImpedanceControlMode cartesian_impedance~%iiwa_msgs/DesiredForceControlMode desired_force~%iiwa_msgs/SinePatternControlMode sine_pattern~%iiwa_msgs/CartesianControlModeLimits limits~%~%================================================================================~%MSG: iiwa_msgs/JointImpedanceControlMode~%# Stiffness values in [Nm/rad]. Stiffness values must be >= 0. ~%JointQuantity joint_stiffness~%~%# Damping values. Damping values must be between 0 and 1. ~%JointQuantity joint_damping~%~%================================================================================~%MSG: iiwa_msgs/JointQuantity~%float32 a1~%float32 a2~%float32 a3~%float32 a4~%float32 a5~%float32 a6~%float32 a7~%================================================================================~%MSG: iiwa_msgs/CartesianImpedanceControlMode~%~%# Stiffness values [x, y, z, a, b, c] for the cartesian impedance, x, y, z in [N/m], a, b, c in [Nm/rad]. ~%# Precondition: 0.0 <= x, y, z <= 5000.0 and 0.0 <= a, b, c <= 300.0. ~%CartesianQuantity cartesian_stiffness~%~%# Dimensionless damping values for the cartesian impedance control, for all degrees of freedom : [x, y, z, a, b, c].~%# Precondition: 0.1 <= x, y, z, a, b, c <= 1.0. ~%CartesianQuantity cartesian_damping~%~%# The stiffness value for null space [Nm/rad]. ~%# Precondition: 0.0 <= value. ~%float64 nullspace_stiffness~%~%# The damping parameter for null space [Nm*s/rad]. ~%# Precondition: value >= 0.3 and value <= 1.0. - A good damping value is 0.7. ~%float64 nullspace_damping~%================================================================================~%MSG: iiwa_msgs/CartesianQuantity~%float32 x~%float32 y~%float32 z~%float32 a~%float32 b~%float32 c~%================================================================================~%MSG: iiwa_msgs/DesiredForceControlMode~%# The degree of freedom on which the desired force~%int32 cartesian_dof~%~%# The value of the desired force. In [N].~%float64 desired_force~%~%# The value of the stiffness. In [N/m].~%float64 desired_stiffness~%================================================================================~%MSG: iiwa_msgs/SinePatternControlMode~%# The degree of freedom for performing the sine oscillation.~%int32 cartesian_dof~%~%# The value of the frequency for the sine oscillation [Hz].~%float64 frequency~%~%# The value of the amplitude. In [N].~%float64 amplitude~%~%# The value of the stiffness. In [N/m].~%float64 stiffness~%================================================================================~%MSG: iiwa_msgs/CartesianControlModeLimits~%# Sets the maximum cartesian deviation accepted. If the deviation is exceeded a stop condition occurs. ~%# [x, y, z] in [mm]. Precondition: value > 0.0.~%# [a, b, c] in [rad]. Precondition: value > 0.0.~%CartesianQuantity max_path_deviation~%~%# The maximum control force parameter.~%# [x, y, z] in [N]. Precondition: value > 0.0.~%# [a, b, c] in [Nm]. Precondition: value > 0.0.~%CartesianQuantity max_control_force~%~%# Indicates whether a stop condition is fired if the maximum control force is exceeded. ~%bool max_control_force_stop~%~%# Maximum Cartesian velocity parameter ~%# [x, y, z] in [mm/s]. Precondition: value > 0.0.~%# [a, b, c] in [rad/s]. Precondition: value > 0.0.~%CartesianQuantity max_cartesian_velocity ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ConfigureControlMode-request>))
  (cl:+ 0
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'joint_impedance))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'cartesian_impedance))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'desired_force))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'sine_pattern))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'limits))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ConfigureControlMode-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ConfigureControlMode-request
    (cl:cons ':control_mode (control_mode msg))
    (cl:cons ':joint_impedance (joint_impedance msg))
    (cl:cons ':cartesian_impedance (cartesian_impedance msg))
    (cl:cons ':desired_force (desired_force msg))
    (cl:cons ':sine_pattern (sine_pattern msg))
    (cl:cons ':limits (limits msg))
))
;//! \htmlinclude ConfigureControlMode-response.msg.html

(cl:defclass <ConfigureControlMode-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (error
    :reader error
    :initarg :error
    :type cl:string
    :initform ""))
)

(cl:defclass ConfigureControlMode-response (<ConfigureControlMode-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ConfigureControlMode-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ConfigureControlMode-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-srv:<ConfigureControlMode-response> is deprecated: use iiwa_msgs-srv:ConfigureControlMode-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <ConfigureControlMode-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:success-val is deprecated.  Use iiwa_msgs-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <ConfigureControlMode-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:error-val is deprecated.  Use iiwa_msgs-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ConfigureControlMode-response>) ostream)
  "Serializes a message object of type '<ConfigureControlMode-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'error))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ConfigureControlMode-response>) istream)
  "Deserializes a message object of type '<ConfigureControlMode-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'error) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'error) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ConfigureControlMode-response>)))
  "Returns string type for a service object of type '<ConfigureControlMode-response>"
  "iiwa_msgs/ConfigureControlModeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ConfigureControlMode-response)))
  "Returns string type for a service object of type 'ConfigureControlMode-response"
  "iiwa_msgs/ConfigureControlModeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ConfigureControlMode-response>)))
  "Returns md5sum for a message object of type '<ConfigureControlMode-response>"
  "680a54772ae74cfe325dd171700c3d78")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ConfigureControlMode-response)))
  "Returns md5sum for a message object of type 'ConfigureControlMode-response"
  "680a54772ae74cfe325dd171700c3d78")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ConfigureControlMode-response>)))
  "Returns full string definition for message of type '<ConfigureControlMode-response>"
  (cl:format cl:nil "bool success~%string error~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ConfigureControlMode-response)))
  "Returns full string definition for message of type 'ConfigureControlMode-response"
  (cl:format cl:nil "bool success~%string error~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ConfigureControlMode-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'error))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ConfigureControlMode-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ConfigureControlMode-response
    (cl:cons ':success (success msg))
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ConfigureControlMode)))
  'ConfigureControlMode-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ConfigureControlMode)))
  'ConfigureControlMode-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ConfigureControlMode)))
  "Returns string type for a service object of type '<ConfigureControlMode>"
  "iiwa_msgs/ConfigureControlMode")