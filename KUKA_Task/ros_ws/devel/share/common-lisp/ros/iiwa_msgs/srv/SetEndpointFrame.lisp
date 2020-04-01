; Auto-generated. Do not edit!


(cl:in-package iiwa_msgs-srv)


;//! \htmlinclude SetEndpointFrame-request.msg.html

(cl:defclass <SetEndpointFrame-request> (roslisp-msg-protocol:ros-message)
  ((frame_id
    :reader frame_id
    :initarg :frame_id
    :type cl:string
    :initform ""))
)

(cl:defclass SetEndpointFrame-request (<SetEndpointFrame-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetEndpointFrame-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetEndpointFrame-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-srv:<SetEndpointFrame-request> is deprecated: use iiwa_msgs-srv:SetEndpointFrame-request instead.")))

(cl:ensure-generic-function 'frame_id-val :lambda-list '(m))
(cl:defmethod frame_id-val ((m <SetEndpointFrame-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:frame_id-val is deprecated.  Use iiwa_msgs-srv:frame_id instead.")
  (frame_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetEndpointFrame-request>) ostream)
  "Serializes a message object of type '<SetEndpointFrame-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'frame_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'frame_id))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetEndpointFrame-request>) istream)
  "Deserializes a message object of type '<SetEndpointFrame-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'frame_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'frame_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetEndpointFrame-request>)))
  "Returns string type for a service object of type '<SetEndpointFrame-request>"
  "iiwa_msgs/SetEndpointFrameRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetEndpointFrame-request)))
  "Returns string type for a service object of type 'SetEndpointFrame-request"
  "iiwa_msgs/SetEndpointFrameRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetEndpointFrame-request>)))
  "Returns md5sum for a message object of type '<SetEndpointFrame-request>"
  "422abb646a850d7c7d04073e2d2f950e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetEndpointFrame-request)))
  "Returns md5sum for a message object of type 'SetEndpointFrame-request"
  "422abb646a850d7c7d04073e2d2f950e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetEndpointFrame-request>)))
  "Returns full string definition for message of type '<SetEndpointFrame-request>"
  (cl:format cl:nil "~%~%~%string frame_id~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetEndpointFrame-request)))
  "Returns full string definition for message of type 'SetEndpointFrame-request"
  (cl:format cl:nil "~%~%~%string frame_id~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetEndpointFrame-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'frame_id))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetEndpointFrame-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetEndpointFrame-request
    (cl:cons ':frame_id (frame_id msg))
))
;//! \htmlinclude SetEndpointFrame-response.msg.html

(cl:defclass <SetEndpointFrame-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass SetEndpointFrame-response (<SetEndpointFrame-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetEndpointFrame-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetEndpointFrame-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-srv:<SetEndpointFrame-response> is deprecated: use iiwa_msgs-srv:SetEndpointFrame-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetEndpointFrame-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:success-val is deprecated.  Use iiwa_msgs-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <SetEndpointFrame-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:error-val is deprecated.  Use iiwa_msgs-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetEndpointFrame-response>) ostream)
  "Serializes a message object of type '<SetEndpointFrame-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'error))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetEndpointFrame-response>) istream)
  "Deserializes a message object of type '<SetEndpointFrame-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetEndpointFrame-response>)))
  "Returns string type for a service object of type '<SetEndpointFrame-response>"
  "iiwa_msgs/SetEndpointFrameResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetEndpointFrame-response)))
  "Returns string type for a service object of type 'SetEndpointFrame-response"
  "iiwa_msgs/SetEndpointFrameResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetEndpointFrame-response>)))
  "Returns md5sum for a message object of type '<SetEndpointFrame-response>"
  "422abb646a850d7c7d04073e2d2f950e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetEndpointFrame-response)))
  "Returns md5sum for a message object of type 'SetEndpointFrame-response"
  "422abb646a850d7c7d04073e2d2f950e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetEndpointFrame-response>)))
  "Returns full string definition for message of type '<SetEndpointFrame-response>"
  (cl:format cl:nil "~%bool success~%string error~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetEndpointFrame-response)))
  "Returns full string definition for message of type 'SetEndpointFrame-response"
  (cl:format cl:nil "~%bool success~%string error~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetEndpointFrame-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'error))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetEndpointFrame-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetEndpointFrame-response
    (cl:cons ':success (success msg))
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetEndpointFrame)))
  'SetEndpointFrame-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetEndpointFrame)))
  'SetEndpointFrame-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetEndpointFrame)))
  "Returns string type for a service object of type '<SetEndpointFrame>"
  "iiwa_msgs/SetEndpointFrame")