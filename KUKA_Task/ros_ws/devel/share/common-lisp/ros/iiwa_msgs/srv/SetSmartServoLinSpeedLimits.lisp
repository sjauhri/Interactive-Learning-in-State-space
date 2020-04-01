; Auto-generated. Do not edit!


(cl:in-package iiwa_msgs-srv)


;//! \htmlinclude SetSmartServoLinSpeedLimits-request.msg.html

(cl:defclass <SetSmartServoLinSpeedLimits-request> (roslisp-msg-protocol:ros-message)
  ((max_cartesian_velocity
    :reader max_cartesian_velocity
    :initarg :max_cartesian_velocity
    :type geometry_msgs-msg:Twist
    :initform (cl:make-instance 'geometry_msgs-msg:Twist)))
)

(cl:defclass SetSmartServoLinSpeedLimits-request (<SetSmartServoLinSpeedLimits-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetSmartServoLinSpeedLimits-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetSmartServoLinSpeedLimits-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-srv:<SetSmartServoLinSpeedLimits-request> is deprecated: use iiwa_msgs-srv:SetSmartServoLinSpeedLimits-request instead.")))

(cl:ensure-generic-function 'max_cartesian_velocity-val :lambda-list '(m))
(cl:defmethod max_cartesian_velocity-val ((m <SetSmartServoLinSpeedLimits-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:max_cartesian_velocity-val is deprecated.  Use iiwa_msgs-srv:max_cartesian_velocity instead.")
  (max_cartesian_velocity m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetSmartServoLinSpeedLimits-request>) ostream)
  "Serializes a message object of type '<SetSmartServoLinSpeedLimits-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'max_cartesian_velocity) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetSmartServoLinSpeedLimits-request>) istream)
  "Deserializes a message object of type '<SetSmartServoLinSpeedLimits-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'max_cartesian_velocity) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetSmartServoLinSpeedLimits-request>)))
  "Returns string type for a service object of type '<SetSmartServoLinSpeedLimits-request>"
  "iiwa_msgs/SetSmartServoLinSpeedLimitsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetSmartServoLinSpeedLimits-request)))
  "Returns string type for a service object of type 'SetSmartServoLinSpeedLimits-request"
  "iiwa_msgs/SetSmartServoLinSpeedLimitsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetSmartServoLinSpeedLimits-request>)))
  "Returns md5sum for a message object of type '<SetSmartServoLinSpeedLimits-request>"
  "ba27ded3da7c7c0e58e5316ff3ba3f60")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetSmartServoLinSpeedLimits-request)))
  "Returns md5sum for a message object of type 'SetSmartServoLinSpeedLimits-request"
  "ba27ded3da7c7c0e58e5316ff3ba3f60")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetSmartServoLinSpeedLimits-request>)))
  "Returns full string definition for message of type '<SetSmartServoLinSpeedLimits-request>"
  (cl:format cl:nil "~%geometry_msgs/Twist max_cartesian_velocity~%~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetSmartServoLinSpeedLimits-request)))
  "Returns full string definition for message of type 'SetSmartServoLinSpeedLimits-request"
  (cl:format cl:nil "~%geometry_msgs/Twist max_cartesian_velocity~%~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetSmartServoLinSpeedLimits-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'max_cartesian_velocity))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetSmartServoLinSpeedLimits-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetSmartServoLinSpeedLimits-request
    (cl:cons ':max_cartesian_velocity (max_cartesian_velocity msg))
))
;//! \htmlinclude SetSmartServoLinSpeedLimits-response.msg.html

(cl:defclass <SetSmartServoLinSpeedLimits-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass SetSmartServoLinSpeedLimits-response (<SetSmartServoLinSpeedLimits-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetSmartServoLinSpeedLimits-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetSmartServoLinSpeedLimits-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-srv:<SetSmartServoLinSpeedLimits-response> is deprecated: use iiwa_msgs-srv:SetSmartServoLinSpeedLimits-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetSmartServoLinSpeedLimits-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:success-val is deprecated.  Use iiwa_msgs-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <SetSmartServoLinSpeedLimits-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:error-val is deprecated.  Use iiwa_msgs-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetSmartServoLinSpeedLimits-response>) ostream)
  "Serializes a message object of type '<SetSmartServoLinSpeedLimits-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'error))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetSmartServoLinSpeedLimits-response>) istream)
  "Deserializes a message object of type '<SetSmartServoLinSpeedLimits-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetSmartServoLinSpeedLimits-response>)))
  "Returns string type for a service object of type '<SetSmartServoLinSpeedLimits-response>"
  "iiwa_msgs/SetSmartServoLinSpeedLimitsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetSmartServoLinSpeedLimits-response)))
  "Returns string type for a service object of type 'SetSmartServoLinSpeedLimits-response"
  "iiwa_msgs/SetSmartServoLinSpeedLimitsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetSmartServoLinSpeedLimits-response>)))
  "Returns md5sum for a message object of type '<SetSmartServoLinSpeedLimits-response>"
  "ba27ded3da7c7c0e58e5316ff3ba3f60")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetSmartServoLinSpeedLimits-response)))
  "Returns md5sum for a message object of type 'SetSmartServoLinSpeedLimits-response"
  "ba27ded3da7c7c0e58e5316ff3ba3f60")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetSmartServoLinSpeedLimits-response>)))
  "Returns full string definition for message of type '<SetSmartServoLinSpeedLimits-response>"
  (cl:format cl:nil "~%bool success~%string error~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetSmartServoLinSpeedLimits-response)))
  "Returns full string definition for message of type 'SetSmartServoLinSpeedLimits-response"
  (cl:format cl:nil "~%bool success~%string error~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetSmartServoLinSpeedLimits-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'error))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetSmartServoLinSpeedLimits-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetSmartServoLinSpeedLimits-response
    (cl:cons ':success (success msg))
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetSmartServoLinSpeedLimits)))
  'SetSmartServoLinSpeedLimits-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetSmartServoLinSpeedLimits)))
  'SetSmartServoLinSpeedLimits-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetSmartServoLinSpeedLimits)))
  "Returns string type for a service object of type '<SetSmartServoLinSpeedLimits>"
  "iiwa_msgs/SetSmartServoLinSpeedLimits")