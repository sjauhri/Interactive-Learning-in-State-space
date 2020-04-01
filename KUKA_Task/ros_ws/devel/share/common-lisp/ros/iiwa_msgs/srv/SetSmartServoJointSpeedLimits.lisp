; Auto-generated. Do not edit!


(cl:in-package iiwa_msgs-srv)


;//! \htmlinclude SetSmartServoJointSpeedLimits-request.msg.html

(cl:defclass <SetSmartServoJointSpeedLimits-request> (roslisp-msg-protocol:ros-message)
  ((joint_relative_velocity
    :reader joint_relative_velocity
    :initarg :joint_relative_velocity
    :type cl:float
    :initform 0.0)
   (joint_relative_acceleration
    :reader joint_relative_acceleration
    :initarg :joint_relative_acceleration
    :type cl:float
    :initform 0.0)
   (override_joint_acceleration
    :reader override_joint_acceleration
    :initarg :override_joint_acceleration
    :type cl:float
    :initform 0.0))
)

(cl:defclass SetSmartServoJointSpeedLimits-request (<SetSmartServoJointSpeedLimits-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetSmartServoJointSpeedLimits-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetSmartServoJointSpeedLimits-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-srv:<SetSmartServoJointSpeedLimits-request> is deprecated: use iiwa_msgs-srv:SetSmartServoJointSpeedLimits-request instead.")))

(cl:ensure-generic-function 'joint_relative_velocity-val :lambda-list '(m))
(cl:defmethod joint_relative_velocity-val ((m <SetSmartServoJointSpeedLimits-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:joint_relative_velocity-val is deprecated.  Use iiwa_msgs-srv:joint_relative_velocity instead.")
  (joint_relative_velocity m))

(cl:ensure-generic-function 'joint_relative_acceleration-val :lambda-list '(m))
(cl:defmethod joint_relative_acceleration-val ((m <SetSmartServoJointSpeedLimits-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:joint_relative_acceleration-val is deprecated.  Use iiwa_msgs-srv:joint_relative_acceleration instead.")
  (joint_relative_acceleration m))

(cl:ensure-generic-function 'override_joint_acceleration-val :lambda-list '(m))
(cl:defmethod override_joint_acceleration-val ((m <SetSmartServoJointSpeedLimits-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:override_joint_acceleration-val is deprecated.  Use iiwa_msgs-srv:override_joint_acceleration instead.")
  (override_joint_acceleration m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetSmartServoJointSpeedLimits-request>) ostream)
  "Serializes a message object of type '<SetSmartServoJointSpeedLimits-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'joint_relative_velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'joint_relative_acceleration))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'override_joint_acceleration))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetSmartServoJointSpeedLimits-request>) istream)
  "Deserializes a message object of type '<SetSmartServoJointSpeedLimits-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'joint_relative_velocity) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'joint_relative_acceleration) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'override_joint_acceleration) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetSmartServoJointSpeedLimits-request>)))
  "Returns string type for a service object of type '<SetSmartServoJointSpeedLimits-request>"
  "iiwa_msgs/SetSmartServoJointSpeedLimitsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetSmartServoJointSpeedLimits-request)))
  "Returns string type for a service object of type 'SetSmartServoJointSpeedLimits-request"
  "iiwa_msgs/SetSmartServoJointSpeedLimitsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetSmartServoJointSpeedLimits-request>)))
  "Returns md5sum for a message object of type '<SetSmartServoJointSpeedLimits-request>"
  "960e33fb145e93219db644650cd367e4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetSmartServoJointSpeedLimits-request)))
  "Returns md5sum for a message object of type 'SetSmartServoJointSpeedLimits-request"
  "960e33fb145e93219db644650cd367e4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetSmartServoJointSpeedLimits-request>)))
  "Returns full string definition for message of type '<SetSmartServoJointSpeedLimits-request>"
  (cl:format cl:nil "~%~%~%~%float64 joint_relative_velocity~%~%~%float64 joint_relative_acceleration~%~%~%float64 override_joint_acceleration~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetSmartServoJointSpeedLimits-request)))
  "Returns full string definition for message of type 'SetSmartServoJointSpeedLimits-request"
  (cl:format cl:nil "~%~%~%~%float64 joint_relative_velocity~%~%~%float64 joint_relative_acceleration~%~%~%float64 override_joint_acceleration~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetSmartServoJointSpeedLimits-request>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetSmartServoJointSpeedLimits-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetSmartServoJointSpeedLimits-request
    (cl:cons ':joint_relative_velocity (joint_relative_velocity msg))
    (cl:cons ':joint_relative_acceleration (joint_relative_acceleration msg))
    (cl:cons ':override_joint_acceleration (override_joint_acceleration msg))
))
;//! \htmlinclude SetSmartServoJointSpeedLimits-response.msg.html

(cl:defclass <SetSmartServoJointSpeedLimits-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass SetSmartServoJointSpeedLimits-response (<SetSmartServoJointSpeedLimits-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetSmartServoJointSpeedLimits-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetSmartServoJointSpeedLimits-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-srv:<SetSmartServoJointSpeedLimits-response> is deprecated: use iiwa_msgs-srv:SetSmartServoJointSpeedLimits-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetSmartServoJointSpeedLimits-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:success-val is deprecated.  Use iiwa_msgs-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <SetSmartServoJointSpeedLimits-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:error-val is deprecated.  Use iiwa_msgs-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetSmartServoJointSpeedLimits-response>) ostream)
  "Serializes a message object of type '<SetSmartServoJointSpeedLimits-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'error))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetSmartServoJointSpeedLimits-response>) istream)
  "Deserializes a message object of type '<SetSmartServoJointSpeedLimits-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetSmartServoJointSpeedLimits-response>)))
  "Returns string type for a service object of type '<SetSmartServoJointSpeedLimits-response>"
  "iiwa_msgs/SetSmartServoJointSpeedLimitsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetSmartServoJointSpeedLimits-response)))
  "Returns string type for a service object of type 'SetSmartServoJointSpeedLimits-response"
  "iiwa_msgs/SetSmartServoJointSpeedLimitsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetSmartServoJointSpeedLimits-response>)))
  "Returns md5sum for a message object of type '<SetSmartServoJointSpeedLimits-response>"
  "960e33fb145e93219db644650cd367e4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetSmartServoJointSpeedLimits-response)))
  "Returns md5sum for a message object of type 'SetSmartServoJointSpeedLimits-response"
  "960e33fb145e93219db644650cd367e4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetSmartServoJointSpeedLimits-response>)))
  "Returns full string definition for message of type '<SetSmartServoJointSpeedLimits-response>"
  (cl:format cl:nil "~%bool success~%string error~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetSmartServoJointSpeedLimits-response)))
  "Returns full string definition for message of type 'SetSmartServoJointSpeedLimits-response"
  (cl:format cl:nil "~%bool success~%string error~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetSmartServoJointSpeedLimits-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'error))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetSmartServoJointSpeedLimits-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetSmartServoJointSpeedLimits-response
    (cl:cons ':success (success msg))
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetSmartServoJointSpeedLimits)))
  'SetSmartServoJointSpeedLimits-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetSmartServoJointSpeedLimits)))
  'SetSmartServoJointSpeedLimits-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetSmartServoJointSpeedLimits)))
  "Returns string type for a service object of type '<SetSmartServoJointSpeedLimits>"
  "iiwa_msgs/SetSmartServoJointSpeedLimits")