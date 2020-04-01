; Auto-generated. Do not edit!


(cl:in-package iiwa_msgs-srv)


;//! \htmlinclude TimeToDestination-request.msg.html

(cl:defclass <TimeToDestination-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass TimeToDestination-request (<TimeToDestination-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TimeToDestination-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TimeToDestination-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-srv:<TimeToDestination-request> is deprecated: use iiwa_msgs-srv:TimeToDestination-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TimeToDestination-request>) ostream)
  "Serializes a message object of type '<TimeToDestination-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TimeToDestination-request>) istream)
  "Deserializes a message object of type '<TimeToDestination-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TimeToDestination-request>)))
  "Returns string type for a service object of type '<TimeToDestination-request>"
  "iiwa_msgs/TimeToDestinationRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TimeToDestination-request)))
  "Returns string type for a service object of type 'TimeToDestination-request"
  "iiwa_msgs/TimeToDestinationRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TimeToDestination-request>)))
  "Returns md5sum for a message object of type '<TimeToDestination-request>"
  "b71b59cce98847d0bd0310eb052e8f3f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TimeToDestination-request)))
  "Returns md5sum for a message object of type 'TimeToDestination-request"
  "b71b59cce98847d0bd0310eb052e8f3f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TimeToDestination-request>)))
  "Returns full string definition for message of type '<TimeToDestination-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TimeToDestination-request)))
  "Returns full string definition for message of type 'TimeToDestination-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TimeToDestination-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TimeToDestination-request>))
  "Converts a ROS message object to a list"
  (cl:list 'TimeToDestination-request
))
;//! \htmlinclude TimeToDestination-response.msg.html

(cl:defclass <TimeToDestination-response> (roslisp-msg-protocol:ros-message)
  ((remaining_time
    :reader remaining_time
    :initarg :remaining_time
    :type cl:float
    :initform 0.0))
)

(cl:defclass TimeToDestination-response (<TimeToDestination-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TimeToDestination-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TimeToDestination-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-srv:<TimeToDestination-response> is deprecated: use iiwa_msgs-srv:TimeToDestination-response instead.")))

(cl:ensure-generic-function 'remaining_time-val :lambda-list '(m))
(cl:defmethod remaining_time-val ((m <TimeToDestination-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-srv:remaining_time-val is deprecated.  Use iiwa_msgs-srv:remaining_time instead.")
  (remaining_time m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TimeToDestination-response>) ostream)
  "Serializes a message object of type '<TimeToDestination-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'remaining_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TimeToDestination-response>) istream)
  "Deserializes a message object of type '<TimeToDestination-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'remaining_time) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TimeToDestination-response>)))
  "Returns string type for a service object of type '<TimeToDestination-response>"
  "iiwa_msgs/TimeToDestinationResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TimeToDestination-response)))
  "Returns string type for a service object of type 'TimeToDestination-response"
  "iiwa_msgs/TimeToDestinationResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TimeToDestination-response>)))
  "Returns md5sum for a message object of type '<TimeToDestination-response>"
  "b71b59cce98847d0bd0310eb052e8f3f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TimeToDestination-response)))
  "Returns md5sum for a message object of type 'TimeToDestination-response"
  "b71b59cce98847d0bd0310eb052e8f3f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TimeToDestination-response>)))
  "Returns full string definition for message of type '<TimeToDestination-response>"
  (cl:format cl:nil "float64 remaining_time~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TimeToDestination-response)))
  "Returns full string definition for message of type 'TimeToDestination-response"
  (cl:format cl:nil "float64 remaining_time~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TimeToDestination-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TimeToDestination-response>))
  "Converts a ROS message object to a list"
  (cl:list 'TimeToDestination-response
    (cl:cons ':remaining_time (remaining_time msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'TimeToDestination)))
  'TimeToDestination-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'TimeToDestination)))
  'TimeToDestination-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TimeToDestination)))
  "Returns string type for a service object of type '<TimeToDestination>"
  "iiwa_msgs/TimeToDestination")