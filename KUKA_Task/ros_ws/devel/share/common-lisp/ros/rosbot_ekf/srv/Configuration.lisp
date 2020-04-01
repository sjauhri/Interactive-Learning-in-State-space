; Auto-generated. Do not edit!


(cl:in-package rosbot_ekf-srv)


;//! \htmlinclude Configuration-request.msg.html

(cl:defclass <Configuration-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:string
    :initform "")
   (data
    :reader data
    :initarg :data
    :type cl:string
    :initform ""))
)

(cl:defclass Configuration-request (<Configuration-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Configuration-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Configuration-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rosbot_ekf-srv:<Configuration-request> is deprecated: use rosbot_ekf-srv:Configuration-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <Configuration-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rosbot_ekf-srv:command-val is deprecated.  Use rosbot_ekf-srv:command instead.")
  (command m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <Configuration-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rosbot_ekf-srv:data-val is deprecated.  Use rosbot_ekf-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Configuration-request>) ostream)
  "Serializes a message object of type '<Configuration-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'command))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'command))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Configuration-request>) istream)
  "Deserializes a message object of type '<Configuration-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'command) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'data) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'data) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Configuration-request>)))
  "Returns string type for a service object of type '<Configuration-request>"
  "rosbot_ekf/ConfigurationRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Configuration-request)))
  "Returns string type for a service object of type 'Configuration-request"
  "rosbot_ekf/ConfigurationRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Configuration-request>)))
  "Returns md5sum for a message object of type '<Configuration-request>"
  "b942000b3d255d27335aa543bc4443e3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Configuration-request)))
  "Returns md5sum for a message object of type 'Configuration-request"
  "b942000b3d255d27335aa543bc4443e3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Configuration-request>)))
  "Returns full string definition for message of type '<Configuration-request>"
  (cl:format cl:nil "string command~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Configuration-request)))
  "Returns full string definition for message of type 'Configuration-request"
  (cl:format cl:nil "string command~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Configuration-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'command))
     4 (cl:length (cl:slot-value msg 'data))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Configuration-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Configuration-request
    (cl:cons ':command (command msg))
    (cl:cons ':data (data msg))
))
;//! \htmlinclude Configuration-response.msg.html

(cl:defclass <Configuration-response> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type cl:string
    :initform "")
   (result
    :reader result
    :initarg :result
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Configuration-response (<Configuration-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Configuration-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Configuration-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rosbot_ekf-srv:<Configuration-response> is deprecated: use rosbot_ekf-srv:Configuration-response instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <Configuration-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rosbot_ekf-srv:data-val is deprecated.  Use rosbot_ekf-srv:data instead.")
  (data m))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <Configuration-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rosbot_ekf-srv:result-val is deprecated.  Use rosbot_ekf-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<Configuration-response>)))
    "Constants for message type '<Configuration-response>"
  '((:SUCCESS . 0)
    (:FAILURE . 1)
    (:COMMAND_NOT_FOUND . 2))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'Configuration-response)))
    "Constants for message type 'Configuration-response"
  '((:SUCCESS . 0)
    (:FAILURE . 1)
    (:COMMAND_NOT_FOUND . 2))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Configuration-response>) ostream)
  "Serializes a message object of type '<Configuration-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'data))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'result)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Configuration-response>) istream)
  "Deserializes a message object of type '<Configuration-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'data) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'data) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'result)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Configuration-response>)))
  "Returns string type for a service object of type '<Configuration-response>"
  "rosbot_ekf/ConfigurationResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Configuration-response)))
  "Returns string type for a service object of type 'Configuration-response"
  "rosbot_ekf/ConfigurationResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Configuration-response>)))
  "Returns md5sum for a message object of type '<Configuration-response>"
  "b942000b3d255d27335aa543bc4443e3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Configuration-response)))
  "Returns md5sum for a message object of type 'Configuration-response"
  "b942000b3d255d27335aa543bc4443e3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Configuration-response>)))
  "Returns full string definition for message of type '<Configuration-response>"
  (cl:format cl:nil "string data~%uint8 result~%uint8 SUCCESS=0~%uint8 FAILURE=1~%uint8 COMMAND_NOT_FOUND=2~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Configuration-response)))
  "Returns full string definition for message of type 'Configuration-response"
  (cl:format cl:nil "string data~%uint8 result~%uint8 SUCCESS=0~%uint8 FAILURE=1~%uint8 COMMAND_NOT_FOUND=2~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Configuration-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'data))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Configuration-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Configuration-response
    (cl:cons ':data (data msg))
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Configuration)))
  'Configuration-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Configuration)))
  'Configuration-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Configuration)))
  "Returns string type for a service object of type '<Configuration>"
  "rosbot_ekf/Configuration")