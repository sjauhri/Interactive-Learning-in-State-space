; Auto-generated. Do not edit!


(cl:in-package iiwa_msgs-msg)


;//! \htmlinclude RedundancyInformation.msg.html

(cl:defclass <RedundancyInformation> (roslisp-msg-protocol:ros-message)
  ((e1
    :reader e1
    :initarg :e1
    :type cl:float
    :initform 0.0)
   (status
    :reader status
    :initarg :status
    :type cl:integer
    :initform 0)
   (turn
    :reader turn
    :initarg :turn
    :type cl:integer
    :initform 0))
)

(cl:defclass RedundancyInformation (<RedundancyInformation>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RedundancyInformation>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RedundancyInformation)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iiwa_msgs-msg:<RedundancyInformation> is deprecated: use iiwa_msgs-msg:RedundancyInformation instead.")))

(cl:ensure-generic-function 'e1-val :lambda-list '(m))
(cl:defmethod e1-val ((m <RedundancyInformation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:e1-val is deprecated.  Use iiwa_msgs-msg:e1 instead.")
  (e1 m))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <RedundancyInformation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:status-val is deprecated.  Use iiwa_msgs-msg:status instead.")
  (status m))

(cl:ensure-generic-function 'turn-val :lambda-list '(m))
(cl:defmethod turn-val ((m <RedundancyInformation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iiwa_msgs-msg:turn-val is deprecated.  Use iiwa_msgs-msg:turn instead.")
  (turn m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RedundancyInformation>) ostream)
  "Serializes a message object of type '<RedundancyInformation>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'e1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'status)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'turn)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RedundancyInformation>) istream)
  "Deserializes a message object of type '<RedundancyInformation>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'e1) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'turn) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RedundancyInformation>)))
  "Returns string type for a message object of type '<RedundancyInformation>"
  "iiwa_msgs/RedundancyInformation")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RedundancyInformation)))
  "Returns string type for a message object of type 'RedundancyInformation"
  "iiwa_msgs/RedundancyInformation")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RedundancyInformation>)))
  "Returns md5sum for a message object of type '<RedundancyInformation>"
  "890d08bd36db91494028e6c2e0f4ecc2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RedundancyInformation)))
  "Returns md5sum for a message object of type 'RedundancyInformation"
  "890d08bd36db91494028e6c2e0f4ecc2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RedundancyInformation>)))
  "Returns full string definition for message of type '<RedundancyInformation>"
  (cl:format cl:nil "# E1 parameter~%# Specifies Angle of the elbow joint.~%float64 e1~%~%# Status parameter~%#   Bit 0: 1 - The robot is working above its head~%#          0 - The robot is working in the ground area~%#   Bit 1: 1 - Angle A4 < 0°~%#          0 - Angle A4 >= 0°~%#   Bit 2: 1 - Angle A6 <= 0~%#          0 - Angle A6 > 0~%int32 status~%~%# Turn parameter~%# According to Sunrise handbook this is not used for the iiwa.~%int32 turn~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RedundancyInformation)))
  "Returns full string definition for message of type 'RedundancyInformation"
  (cl:format cl:nil "# E1 parameter~%# Specifies Angle of the elbow joint.~%float64 e1~%~%# Status parameter~%#   Bit 0: 1 - The robot is working above its head~%#          0 - The robot is working in the ground area~%#   Bit 1: 1 - Angle A4 < 0°~%#          0 - Angle A4 >= 0°~%#   Bit 2: 1 - Angle A6 <= 0~%#          0 - Angle A6 > 0~%int32 status~%~%# Turn parameter~%# According to Sunrise handbook this is not used for the iiwa.~%int32 turn~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RedundancyInformation>))
  (cl:+ 0
     8
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RedundancyInformation>))
  "Converts a ROS message object to a list"
  (cl:list 'RedundancyInformation
    (cl:cons ':e1 (e1 msg))
    (cl:cons ':status (status msg))
    (cl:cons ':turn (turn msg))
))
