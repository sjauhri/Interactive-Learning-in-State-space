; Auto-generated. Do not edit!


(cl:in-package iiwa_msgs-srv)


;//! \htmlinclude SetWorkpiece-request.msg.html

(cl:defclass <SetWorkpiece-request> (roslisp-msg-protocol:ros-message)
  ((workpiece_id
    :reader workpiece_id
    :initarg :workpiece_id
    :type cl:string
    :initform ""))
)

(cl:defclass SetWorkpiece-request (<SetWorkpiece-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetWorkpiece-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetWorkpiece-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-srv:<SetWorkpiece-request> is deprecated: use iiwa_msgs-srv:SetWorkpiece-request instead.")))

(cl:ensure-generic-function 'workpiece_id-val :lambda-list '(m))
(cl:defmethod workpiece_id-val ((m <SetWorkpiece-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:workpiece_id-val is deprecated.  Use iiwa_msgs-srv:workpiece_id instead.")
  (workpiece_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetWorkpiece-request>) ostream)
  "Serializes a message object of type '<SetWorkpiece-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'workpiece_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'workpiece_id))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetWorkpiece-request>) istream)
  "Deserializes a message object of type '<SetWorkpiece-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'workpiece_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'workpiece_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetWorkpiece-request>)))
  "Returns string type for a service object of type '<SetWorkpiece-request>"
  "iiwa_msgs/SetWorkpieceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetWorkpiece-request)))
  "Returns string type for a service object of type 'SetWorkpiece-request"
  "iiwa_msgs/SetWorkpieceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetWorkpiece-request>)))
  "Returns md5sum for a message object of type '<SetWorkpiece-request>"
  "63c849990571529ad5b5c1483c88f899")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetWorkpiece-request)))
  "Returns md5sum for a message object of type 'SetWorkpiece-request"
  "63c849990571529ad5b5c1483c88f899")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetWorkpiece-request>)))
  "Returns full string definition for message of type '<SetWorkpiece-request>"
  (cl:format cl:nil "~%~%~%~%string workpiece_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetWorkpiece-request)))
  "Returns full string definition for message of type 'SetWorkpiece-request"
  (cl:format cl:nil "~%~%~%~%string workpiece_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetWorkpiece-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'workpiece_id))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetWorkpiece-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetWorkpiece-request
    (cl:cons ':workpiece_id (workpiece_id msg))
))
;//! \htmlinclude SetWorkpiece-response.msg.html

(cl:defclass <SetWorkpiece-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass SetWorkpiece-response (<SetWorkpiece-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetWorkpiece-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetWorkpiece-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-srv:<SetWorkpiece-response> is deprecated: use iiwa_msgs-srv:SetWorkpiece-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetWorkpiece-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:success-val is deprecated.  Use iiwa_msgs-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <SetWorkpiece-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:error-val is deprecated.  Use iiwa_msgs-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetWorkpiece-response>) ostream)
  "Serializes a message object of type '<SetWorkpiece-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'error))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetWorkpiece-response>) istream)
  "Deserializes a message object of type '<SetWorkpiece-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetWorkpiece-response>)))
  "Returns string type for a service object of type '<SetWorkpiece-response>"
  "iiwa_msgs/SetWorkpieceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetWorkpiece-response)))
  "Returns string type for a service object of type 'SetWorkpiece-response"
  "iiwa_msgs/SetWorkpieceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetWorkpiece-response>)))
  "Returns md5sum for a message object of type '<SetWorkpiece-response>"
  "63c849990571529ad5b5c1483c88f899")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetWorkpiece-response)))
  "Returns md5sum for a message object of type 'SetWorkpiece-response"
  "63c849990571529ad5b5c1483c88f899")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetWorkpiece-response>)))
  "Returns full string definition for message of type '<SetWorkpiece-response>"
  (cl:format cl:nil "bool success~%string error~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetWorkpiece-response)))
  "Returns full string definition for message of type 'SetWorkpiece-response"
  (cl:format cl:nil "bool success~%string error~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetWorkpiece-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'error))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetWorkpiece-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetWorkpiece-response
    (cl:cons ':success (success msg))
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetWorkpiece)))
  'SetWorkpiece-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetWorkpiece)))
  'SetWorkpiece-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetWorkpiece)))
  "Returns string type for a service object of type '<SetWorkpiece>"
  "iiwa_msgs/SetWorkpiece")