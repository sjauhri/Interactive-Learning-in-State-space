; Auto-generated. Do not edit!


(cl:in-package iiwa_msgs-msg)


;//! \htmlinclude CartesianControlModeLimits.msg.html

(cl:defclass <CartesianControlModeLimits> (roslisp-msg-protocol:ros-message)
  ((max_path_deviation
    :reader max_path_deviation
    :initarg :max_path_deviation
    :type iiwa_msgs-msg:CartesianQuantity
    :initform (cl:make-instance 'iiwa_msgs-msg:CartesianQuantity))
   (max_control_force
    :reader max_control_force
    :initarg :max_control_force
    :type iiwa_msgs-msg:CartesianQuantity
    :initform (cl:make-instance 'iiwa_msgs-msg:CartesianQuantity))
   (max_control_force_stop
    :reader max_control_force_stop
    :initarg :max_control_force_stop
    :type cl:boolean
    :initform cl:nil)
   (max_cartesian_velocity
    :reader max_cartesian_velocity
    :initarg :max_cartesian_velocity
    :type iiwa_msgs-msg:CartesianQuantity
    :initform (cl:make-instance 'iiwa_msgs-msg:CartesianQuantity)))
)

(cl:defclass CartesianControlModeLimits (<CartesianControlModeLimits>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CartesianControlModeLimits>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CartesianControlModeLimits)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-msg:<CartesianControlModeLimits> is deprecated: use iiwa_msgs-msg:CartesianControlModeLimits instead.")))

(cl:ensure-generic-function 'max_path_deviation-val :lambda-list '(m))
(cl:defmethod max_path_deviation-val ((m <CartesianControlModeLimits>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:max_path_deviation-val is deprecated.  Use iiwa_msgs-msg:max_path_deviation instead.")
  (max_path_deviation m))

(cl:ensure-generic-function 'max_control_force-val :lambda-list '(m))
(cl:defmethod max_control_force-val ((m <CartesianControlModeLimits>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:max_control_force-val is deprecated.  Use iiwa_msgs-msg:max_control_force instead.")
  (max_control_force m))

(cl:ensure-generic-function 'max_control_force_stop-val :lambda-list '(m))
(cl:defmethod max_control_force_stop-val ((m <CartesianControlModeLimits>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:max_control_force_stop-val is deprecated.  Use iiwa_msgs-msg:max_control_force_stop instead.")
  (max_control_force_stop m))

(cl:ensure-generic-function 'max_cartesian_velocity-val :lambda-list '(m))
(cl:defmethod max_cartesian_velocity-val ((m <CartesianControlModeLimits>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:max_cartesian_velocity-val is deprecated.  Use iiwa_msgs-msg:max_cartesian_velocity instead.")
  (max_cartesian_velocity m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CartesianControlModeLimits>) ostream)
  "Serializes a message object of type '<CartesianControlModeLimits>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'max_path_deviation) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'max_control_force) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'max_control_force_stop) 1 0)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'max_cartesian_velocity) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CartesianControlModeLimits>) istream)
  "Deserializes a message object of type '<CartesianControlModeLimits>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'max_path_deviation) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'max_control_force) istream)
    (cl:setf (cl:slot-value msg 'max_control_force_stop) (cl:not (cl:zerop (cl:read-byte istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'max_cartesian_velocity) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CartesianControlModeLimits>)))
  "Returns string type for a message object of type '<CartesianControlModeLimits>"
  "iiwa_msgs/CartesianControlModeLimits")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CartesianControlModeLimits)))
  "Returns string type for a message object of type 'CartesianControlModeLimits"
  "iiwa_msgs/CartesianControlModeLimits")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CartesianControlModeLimits>)))
  "Returns md5sum for a message object of type '<CartesianControlModeLimits>"
  "36b3a99aeab262cf60ecef9129ccb529")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CartesianControlModeLimits)))
  "Returns md5sum for a message object of type 'CartesianControlModeLimits"
  "36b3a99aeab262cf60ecef9129ccb529")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CartesianControlModeLimits>)))
  "Returns full string definition for message of type '<CartesianControlModeLimits>"
  (cl:format cl:nil "# Sets the maximum cartesian deviation accepted. If the deviation is exceeded a stop condition occurs. ~%# [x, y, z] in [mm]. Precondition: value > 0.0.~%# [a, b, c] in [rad]. Precondition: value > 0.0.~%CartesianQuantity max_path_deviation~%~%# The maximum control force parameter.~%# [x, y, z] in [N]. Precondition: value > 0.0.~%# [a, b, c] in [Nm]. Precondition: value > 0.0.~%CartesianQuantity max_control_force~%~%# Indicates whether a stop condition is fired if the maximum control force is exceeded. ~%bool max_control_force_stop~%~%# Maximum Cartesian velocity parameter ~%# [x, y, z] in [mm/s]. Precondition: value > 0.0.~%# [a, b, c] in [rad/s]. Precondition: value > 0.0.~%CartesianQuantity max_cartesian_velocity ~%~%================================================================================~%MSG: iiwa_msgs/CartesianQuantity~%float32 x~%float32 y~%float32 z~%float32 a~%float32 b~%float32 c~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CartesianControlModeLimits)))
  "Returns full string definition for message of type 'CartesianControlModeLimits"
  (cl:format cl:nil "# Sets the maximum cartesian deviation accepted. If the deviation is exceeded a stop condition occurs. ~%# [x, y, z] in [mm]. Precondition: value > 0.0.~%# [a, b, c] in [rad]. Precondition: value > 0.0.~%CartesianQuantity max_path_deviation~%~%# The maximum control force parameter.~%# [x, y, z] in [N]. Precondition: value > 0.0.~%# [a, b, c] in [Nm]. Precondition: value > 0.0.~%CartesianQuantity max_control_force~%~%# Indicates whether a stop condition is fired if the maximum control force is exceeded. ~%bool max_control_force_stop~%~%# Maximum Cartesian velocity parameter ~%# [x, y, z] in [mm/s]. Precondition: value > 0.0.~%# [a, b, c] in [rad/s]. Precondition: value > 0.0.~%CartesianQuantity max_cartesian_velocity ~%~%================================================================================~%MSG: iiwa_msgs/CartesianQuantity~%float32 x~%float32 y~%float32 z~%float32 a~%float32 b~%float32 c~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CartesianControlModeLimits>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'max_path_deviation))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'max_control_force))
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'max_cartesian_velocity))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CartesianControlModeLimits>))
  "Converts a ROS message object to a list"
  (cl:list 'CartesianControlModeLimits
    (cl:cons ':max_path_deviation (max_path_deviation msg))
    (cl:cons ':max_control_force (max_control_force msg))
    (cl:cons ':max_control_force_stop (max_control_force_stop msg))
    (cl:cons ':max_cartesian_velocity (max_cartesian_velocity msg))
))
