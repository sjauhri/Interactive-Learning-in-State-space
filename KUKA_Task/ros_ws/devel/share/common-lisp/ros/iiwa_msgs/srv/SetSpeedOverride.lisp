; Auto-generated. Do not edit!


(cl:in-package iiwa_msgs-srv)


;//! \htmlinclude SetSpeedOverride-request.msg.html

(cl:defclass <SetSpeedOverride-request> (roslisp-msg-protocol:ros-message)
  ((override_reduction
    :reader override_reduction
    :initarg :override_reduction
    :type cl:float
    :initform 0.0))
)

(cl:defclass SetSpeedOverride-request (<SetSpeedOverride-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetSpeedOverride-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetSpeedOverride-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-srv:<SetSpeedOverride-request> is deprecated: use iiwa_msgs-srv:SetSpeedOverride-request instead.")))

(cl:ensure-generic-function 'override_reduction-val :lambda-list '(m))
(cl:defmethod override_reduction-val ((m <SetSpeedOverride-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:override_reduction-val is deprecated.  Use iiwa_msgs-srv:override_reduction instead.")
  (override_reduction m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetSpeedOverride-request>) ostream)
  "Serializes a message object of type '<SetSpeedOverride-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'override_reduction))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetSpeedOverride-request>) istream)
  "Deserializes a message object of type '<SetSpeedOverride-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'override_reduction) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetSpeedOverride-request>)))
  "Returns string type for a service object of type '<SetSpeedOverride-request>"
  "iiwa_msgs/SetSpeedOverrideRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetSpeedOverride-request)))
  "Returns string type for a service object of type 'SetSpeedOverride-request"
  "iiwa_msgs/SetSpeedOverrideRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetSpeedOverride-request>)))
  "Returns md5sum for a message object of type '<SetSpeedOverride-request>"
  "5cb6d9d155adc8ed76143d144d178f68")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetSpeedOverride-request)))
  "Returns md5sum for a message object of type 'SetSpeedOverride-request"
  "5cb6d9d155adc8ed76143d144d178f68")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetSpeedOverride-request>)))
  "Returns full string definition for message of type '<SetSpeedOverride-request>"
  (cl:format cl:nil "~%float64 override_reduction~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetSpeedOverride-request)))
  "Returns full string definition for message of type 'SetSpeedOverride-request"
  (cl:format cl:nil "~%float64 override_reduction~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetSpeedOverride-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetSpeedOverride-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetSpeedOverride-request
    (cl:cons ':override_reduction (override_reduction msg))
))
;//! \htmlinclude SetSpeedOverride-response.msg.html

(cl:defclass <SetSpeedOverride-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass SetSpeedOverride-response (<SetSpeedOverride-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetSpeedOverride-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetSpeedOverride-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-srv:<SetSpeedOverride-response> is deprecated: use iiwa_msgs-srv:SetSpeedOverride-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetSpeedOverride-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:success-val is deprecated.  Use iiwa_msgs-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <SetSpeedOverride-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:error-val is deprecated.  Use iiwa_msgs-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetSpeedOverride-response>) ostream)
  "Serializes a message object of type '<SetSpeedOverride-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'error))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetSpeedOverride-response>) istream)
  "Deserializes a message object of type '<SetSpeedOverride-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetSpeedOverride-response>)))
  "Returns string type for a service object of type '<SetSpeedOverride-response>"
  "iiwa_msgs/SetSpeedOverrideResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetSpeedOverride-response)))
  "Returns string type for a service object of type 'SetSpeedOverride-response"
  "iiwa_msgs/SetSpeedOverrideResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetSpeedOverride-response>)))
  "Returns md5sum for a message object of type '<SetSpeedOverride-response>"
  "5cb6d9d155adc8ed76143d144d178f68")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetSpeedOverride-response)))
  "Returns md5sum for a message object of type 'SetSpeedOverride-response"
  "5cb6d9d155adc8ed76143d144d178f68")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetSpeedOverride-response>)))
  "Returns full string definition for message of type '<SetSpeedOverride-response>"
  (cl:format cl:nil "~%bool success~%string error~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetSpeedOverride-response)))
  "Returns full string definition for message of type 'SetSpeedOverride-response"
  (cl:format cl:nil "~%bool success~%string error~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetSpeedOverride-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'error))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetSpeedOverride-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetSpeedOverride-response
    (cl:cons ':success (success msg))
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetSpeedOverride)))
  'SetSpeedOverride-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetSpeedOverride)))
  'SetSpeedOverride-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetSpeedOverride)))
  "Returns string type for a service object of type '<SetSpeedOverride>"
  "iiwa_msgs/SetSpeedOverride")