; Auto-generated. Do not edit!


(cl:in-package iiwa_msgs-srv)


;//! \htmlinclude SetPTPJointSpeedLimits-request.msg.html

(cl:defclass <SetPTPJointSpeedLimits-request> (roslisp-msg-protocol:ros-message)
  ((joint_relative_velocity
    :reader joint_relative_velocity
    :initarg :joint_relative_velocity
    :type cl:float
    :initform 0.0)
   (joint_relative_acceleration
    :reader joint_relative_acceleration
    :initarg :joint_relative_acceleration
    :type cl:float
    :initform 0.0))
)

(cl:defclass SetPTPJointSpeedLimits-request (<SetPTPJointSpeedLimits-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetPTPJointSpeedLimits-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetPTPJointSpeedLimits-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-srv:<SetPTPJointSpeedLimits-request> is deprecated: use iiwa_msgs-srv:SetPTPJointSpeedLimits-request instead.")))

(cl:ensure-generic-function 'joint_relative_velocity-val :lambda-list '(m))
(cl:defmethod joint_relative_velocity-val ((m <SetPTPJointSpeedLimits-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:joint_relative_velocity-val is deprecated.  Use iiwa_msgs-srv:joint_relative_velocity instead.")
  (joint_relative_velocity m))

(cl:ensure-generic-function 'joint_relative_acceleration-val :lambda-list '(m))
(cl:defmethod joint_relative_acceleration-val ((m <SetPTPJointSpeedLimits-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:joint_relative_acceleration-val is deprecated.  Use iiwa_msgs-srv:joint_relative_acceleration instead.")
  (joint_relative_acceleration m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetPTPJointSpeedLimits-request>) ostream)
  "Serializes a message object of type '<SetPTPJointSpeedLimits-request>"
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
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetPTPJointSpeedLimits-request>) istream)
  "Deserializes a message object of type '<SetPTPJointSpeedLimits-request>"
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
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetPTPJointSpeedLimits-request>)))
  "Returns string type for a service object of type '<SetPTPJointSpeedLimits-request>"
  "iiwa_msgs/SetPTPJointSpeedLimitsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPTPJointSpeedLimits-request)))
  "Returns string type for a service object of type 'SetPTPJointSpeedLimits-request"
  "iiwa_msgs/SetPTPJointSpeedLimitsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetPTPJointSpeedLimits-request>)))
  "Returns md5sum for a message object of type '<SetPTPJointSpeedLimits-request>"
  "e5ffdd082606e43192e0949ab1d5a1f3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetPTPJointSpeedLimits-request)))
  "Returns md5sum for a message object of type 'SetPTPJointSpeedLimits-request"
  "e5ffdd082606e43192e0949ab1d5a1f3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetPTPJointSpeedLimits-request>)))
  "Returns full string definition for message of type '<SetPTPJointSpeedLimits-request>"
  (cl:format cl:nil "~%~%~%~%float64 joint_relative_velocity~%~%~%float64 joint_relative_acceleration~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetPTPJointSpeedLimits-request)))
  "Returns full string definition for message of type 'SetPTPJointSpeedLimits-request"
  (cl:format cl:nil "~%~%~%~%float64 joint_relative_velocity~%~%~%float64 joint_relative_acceleration~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetPTPJointSpeedLimits-request>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetPTPJointSpeedLimits-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetPTPJointSpeedLimits-request
    (cl:cons ':joint_relative_velocity (joint_relative_velocity msg))
    (cl:cons ':joint_relative_acceleration (joint_relative_acceleration msg))
))
;//! \htmlinclude SetPTPJointSpeedLimits-response.msg.html

(cl:defclass <SetPTPJointSpeedLimits-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass SetPTPJointSpeedLimits-response (<SetPTPJointSpeedLimits-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetPTPJointSpeedLimits-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetPTPJointSpeedLimits-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-srv:<SetPTPJointSpeedLimits-response> is deprecated: use iiwa_msgs-srv:SetPTPJointSpeedLimits-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetPTPJointSpeedLimits-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:success-val is deprecated.  Use iiwa_msgs-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <SetPTPJointSpeedLimits-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:error-val is deprecated.  Use iiwa_msgs-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetPTPJointSpeedLimits-response>) ostream)
  "Serializes a message object of type '<SetPTPJointSpeedLimits-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'error))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetPTPJointSpeedLimits-response>) istream)
  "Deserializes a message object of type '<SetPTPJointSpeedLimits-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetPTPJointSpeedLimits-response>)))
  "Returns string type for a service object of type '<SetPTPJointSpeedLimits-response>"
  "iiwa_msgs/SetPTPJointSpeedLimitsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPTPJointSpeedLimits-response)))
  "Returns string type for a service object of type 'SetPTPJointSpeedLimits-response"
  "iiwa_msgs/SetPTPJointSpeedLimitsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetPTPJointSpeedLimits-response>)))
  "Returns md5sum for a message object of type '<SetPTPJointSpeedLimits-response>"
  "e5ffdd082606e43192e0949ab1d5a1f3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetPTPJointSpeedLimits-response)))
  "Returns md5sum for a message object of type 'SetPTPJointSpeedLimits-response"
  "e5ffdd082606e43192e0949ab1d5a1f3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetPTPJointSpeedLimits-response>)))
  "Returns full string definition for message of type '<SetPTPJointSpeedLimits-response>"
  (cl:format cl:nil "~%bool success~%string error~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetPTPJointSpeedLimits-response)))
  "Returns full string definition for message of type 'SetPTPJointSpeedLimits-response"
  (cl:format cl:nil "~%bool success~%string error~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetPTPJointSpeedLimits-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'error))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetPTPJointSpeedLimits-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetPTPJointSpeedLimits-response
    (cl:cons ':success (success msg))
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetPTPJointSpeedLimits)))
  'SetPTPJointSpeedLimits-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetPTPJointSpeedLimits)))
  'SetPTPJointSpeedLimits-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPTPJointSpeedLimits)))
  "Returns string type for a service object of type '<SetPTPJointSpeedLimits>"
  "iiwa_msgs/SetPTPJointSpeedLimits")