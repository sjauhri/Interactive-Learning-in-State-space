; Auto-generated. Do not edit!


(cl:in-package iiwa_msgs-srv)


;//! \htmlinclude SetPTPCartesianSpeedLimits-request.msg.html

(cl:defclass <SetPTPCartesianSpeedLimits-request> (roslisp-msg-protocol:ros-message)
  ((maxCartesianVelocity
    :reader maxCartesianVelocity
    :initarg :maxCartesianVelocity
    :type cl:float
    :initform 0.0)
   (maxOrientationVelocity
    :reader maxOrientationVelocity
    :initarg :maxOrientationVelocity
    :type cl:float
    :initform 0.0)
   (maxCartesianAcceleration
    :reader maxCartesianAcceleration
    :initarg :maxCartesianAcceleration
    :type cl:float
    :initform 0.0)
   (maxOrientationAcceleration
    :reader maxOrientationAcceleration
    :initarg :maxOrientationAcceleration
    :type cl:float
    :initform 0.0)
   (maxCartesianJerk
    :reader maxCartesianJerk
    :initarg :maxCartesianJerk
    :type cl:float
    :initform 0.0)
   (maxOrientationJerk
    :reader maxOrientationJerk
    :initarg :maxOrientationJerk
    :type cl:float
    :initform 0.0))
)

(cl:defclass SetPTPCartesianSpeedLimits-request (<SetPTPCartesianSpeedLimits-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetPTPCartesianSpeedLimits-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetPTPCartesianSpeedLimits-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-srv:<SetPTPCartesianSpeedLimits-request> is deprecated: use iiwa_msgs-srv:SetPTPCartesianSpeedLimits-request instead.")))

(cl:ensure-generic-function 'maxCartesianVelocity-val :lambda-list '(m))
(cl:defmethod maxCartesianVelocity-val ((m <SetPTPCartesianSpeedLimits-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:maxCartesianVelocity-val is deprecated.  Use iiwa_msgs-srv:maxCartesianVelocity instead.")
  (maxCartesianVelocity m))

(cl:ensure-generic-function 'maxOrientationVelocity-val :lambda-list '(m))
(cl:defmethod maxOrientationVelocity-val ((m <SetPTPCartesianSpeedLimits-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:maxOrientationVelocity-val is deprecated.  Use iiwa_msgs-srv:maxOrientationVelocity instead.")
  (maxOrientationVelocity m))

(cl:ensure-generic-function 'maxCartesianAcceleration-val :lambda-list '(m))
(cl:defmethod maxCartesianAcceleration-val ((m <SetPTPCartesianSpeedLimits-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:maxCartesianAcceleration-val is deprecated.  Use iiwa_msgs-srv:maxCartesianAcceleration instead.")
  (maxCartesianAcceleration m))

(cl:ensure-generic-function 'maxOrientationAcceleration-val :lambda-list '(m))
(cl:defmethod maxOrientationAcceleration-val ((m <SetPTPCartesianSpeedLimits-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:maxOrientationAcceleration-val is deprecated.  Use iiwa_msgs-srv:maxOrientationAcceleration instead.")
  (maxOrientationAcceleration m))

(cl:ensure-generic-function 'maxCartesianJerk-val :lambda-list '(m))
(cl:defmethod maxCartesianJerk-val ((m <SetPTPCartesianSpeedLimits-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:maxCartesianJerk-val is deprecated.  Use iiwa_msgs-srv:maxCartesianJerk instead.")
  (maxCartesianJerk m))

(cl:ensure-generic-function 'maxOrientationJerk-val :lambda-list '(m))
(cl:defmethod maxOrientationJerk-val ((m <SetPTPCartesianSpeedLimits-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:maxOrientationJerk-val is deprecated.  Use iiwa_msgs-srv:maxOrientationJerk instead.")
  (maxOrientationJerk m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetPTPCartesianSpeedLimits-request>) ostream)
  "Serializes a message object of type '<SetPTPCartesianSpeedLimits-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'maxCartesianVelocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'maxOrientationVelocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'maxCartesianAcceleration))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'maxOrientationAcceleration))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'maxCartesianJerk))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'maxOrientationJerk))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetPTPCartesianSpeedLimits-request>) istream)
  "Deserializes a message object of type '<SetPTPCartesianSpeedLimits-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'maxCartesianVelocity) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'maxOrientationVelocity) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'maxCartesianAcceleration) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'maxOrientationAcceleration) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'maxCartesianJerk) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'maxOrientationJerk) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetPTPCartesianSpeedLimits-request>)))
  "Returns string type for a service object of type '<SetPTPCartesianSpeedLimits-request>"
  "iiwa_msgs/SetPTPCartesianSpeedLimitsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPTPCartesianSpeedLimits-request)))
  "Returns string type for a service object of type 'SetPTPCartesianSpeedLimits-request"
  "iiwa_msgs/SetPTPCartesianSpeedLimitsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetPTPCartesianSpeedLimits-request>)))
  "Returns md5sum for a message object of type '<SetPTPCartesianSpeedLimits-request>"
  "f4c42c9db5a373c4820a5b6872a3a795")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetPTPCartesianSpeedLimits-request)))
  "Returns md5sum for a message object of type 'SetPTPCartesianSpeedLimits-request"
  "f4c42c9db5a373c4820a5b6872a3a795")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetPTPCartesianSpeedLimits-request>)))
  "Returns full string definition for message of type '<SetPTPCartesianSpeedLimits-request>"
  (cl:format cl:nil "~%~%~%~%float64 maxCartesianVelocity~%~%~%float64 maxOrientationVelocity~%~%~%float64 maxCartesianAcceleration~%~%~%float64 maxOrientationAcceleration~%~%~%float64 maxCartesianJerk~%~%~%float64 maxOrientationJerk~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetPTPCartesianSpeedLimits-request)))
  "Returns full string definition for message of type 'SetPTPCartesianSpeedLimits-request"
  (cl:format cl:nil "~%~%~%~%float64 maxCartesianVelocity~%~%~%float64 maxOrientationVelocity~%~%~%float64 maxCartesianAcceleration~%~%~%float64 maxOrientationAcceleration~%~%~%float64 maxCartesianJerk~%~%~%float64 maxOrientationJerk~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetPTPCartesianSpeedLimits-request>))
  (cl:+ 0
     8
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetPTPCartesianSpeedLimits-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetPTPCartesianSpeedLimits-request
    (cl:cons ':maxCartesianVelocity (maxCartesianVelocity msg))
    (cl:cons ':maxOrientationVelocity (maxOrientationVelocity msg))
    (cl:cons ':maxCartesianAcceleration (maxCartesianAcceleration msg))
    (cl:cons ':maxOrientationAcceleration (maxOrientationAcceleration msg))
    (cl:cons ':maxCartesianJerk (maxCartesianJerk msg))
    (cl:cons ':maxOrientationJerk (maxOrientationJerk msg))
))
;//! \htmlinclude SetPTPCartesianSpeedLimits-response.msg.html

(cl:defclass <SetPTPCartesianSpeedLimits-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass SetPTPCartesianSpeedLimits-response (<SetPTPCartesianSpeedLimits-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetPTPCartesianSpeedLimits-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetPTPCartesianSpeedLimits-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-srv:<SetPTPCartesianSpeedLimits-response> is deprecated: use iiwa_msgs-srv:SetPTPCartesianSpeedLimits-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetPTPCartesianSpeedLimits-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:success-val is deprecated.  Use iiwa_msgs-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <SetPTPCartesianSpeedLimits-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:error-val is deprecated.  Use iiwa_msgs-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetPTPCartesianSpeedLimits-response>) ostream)
  "Serializes a message object of type '<SetPTPCartesianSpeedLimits-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'error))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetPTPCartesianSpeedLimits-response>) istream)
  "Deserializes a message object of type '<SetPTPCartesianSpeedLimits-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetPTPCartesianSpeedLimits-response>)))
  "Returns string type for a service object of type '<SetPTPCartesianSpeedLimits-response>"
  "iiwa_msgs/SetPTPCartesianSpeedLimitsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPTPCartesianSpeedLimits-response)))
  "Returns string type for a service object of type 'SetPTPCartesianSpeedLimits-response"
  "iiwa_msgs/SetPTPCartesianSpeedLimitsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetPTPCartesianSpeedLimits-response>)))
  "Returns md5sum for a message object of type '<SetPTPCartesianSpeedLimits-response>"
  "f4c42c9db5a373c4820a5b6872a3a795")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetPTPCartesianSpeedLimits-response)))
  "Returns md5sum for a message object of type 'SetPTPCartesianSpeedLimits-response"
  "f4c42c9db5a373c4820a5b6872a3a795")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetPTPCartesianSpeedLimits-response>)))
  "Returns full string definition for message of type '<SetPTPCartesianSpeedLimits-response>"
  (cl:format cl:nil "bool success~%string error~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetPTPCartesianSpeedLimits-response)))
  "Returns full string definition for message of type 'SetPTPCartesianSpeedLimits-response"
  (cl:format cl:nil "bool success~%string error~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetPTPCartesianSpeedLimits-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'error))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetPTPCartesianSpeedLimits-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetPTPCartesianSpeedLimits-response
    (cl:cons ':success (success msg))
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetPTPCartesianSpeedLimits)))
  'SetPTPCartesianSpeedLimits-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetPTPCartesianSpeedLimits)))
  'SetPTPCartesianSpeedLimits-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPTPCartesianSpeedLimits)))
  "Returns string type for a service object of type '<SetPTPCartesianSpeedLimits>"
  "iiwa_msgs/SetPTPCartesianSpeedLimits")