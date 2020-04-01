;; Auto-generated. Do not edit!


(when (boundp 'rosbot_ekf::Configuration)
  (if (not (find-package "ROSBOT_EKF"))
    (make-package "ROSBOT_EKF"))
  (shadow 'Configuration (find-package "ROSBOT_EKF")))
(unless (find-package "ROSBOT_EKF::CONFIGURATION")
  (make-package "ROSBOT_EKF::CONFIGURATION"))
(unless (find-package "ROSBOT_EKF::CONFIGURATIONREQUEST")
  (make-package "ROSBOT_EKF::CONFIGURATIONREQUEST"))
(unless (find-package "ROSBOT_EKF::CONFIGURATIONRESPONSE")
  (make-package "ROSBOT_EKF::CONFIGURATIONRESPONSE"))

(in-package "ROS")





(defclass rosbot_ekf::ConfigurationRequest
  :super ros::object
  :slots (_command _data ))

(defmethod rosbot_ekf::ConfigurationRequest
  (:init
   (&key
    ((:command __command) "")
    ((:data __data) "")
    )
   (send-super :init)
   (setq _command (string __command))
   (setq _data (string __data))
   self)
  (:command
   (&optional __command)
   (if __command (setq _command __command)) _command)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; string _command
    4 (length _command)
    ;; string _data
    4 (length _data)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _command
       (write-long (length _command) s) (princ _command s)
     ;; string _data
       (write-long (length _data) s) (princ _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _command
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _command (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _data
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _data (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(intern "*SUCCESS*" (find-package "ROSBOT_EKF::CONFIGURATIONRESPONSE"))
(shadow '*SUCCESS* (find-package "ROSBOT_EKF::CONFIGURATIONRESPONSE"))
(defconstant rosbot_ekf::ConfigurationResponse::*SUCCESS* 0)
(intern "*FAILURE*" (find-package "ROSBOT_EKF::CONFIGURATIONRESPONSE"))
(shadow '*FAILURE* (find-package "ROSBOT_EKF::CONFIGURATIONRESPONSE"))
(defconstant rosbot_ekf::ConfigurationResponse::*FAILURE* 1)
(intern "*COMMAND_NOT_FOUND*" (find-package "ROSBOT_EKF::CONFIGURATIONRESPONSE"))
(shadow '*COMMAND_NOT_FOUND* (find-package "ROSBOT_EKF::CONFIGURATIONRESPONSE"))
(defconstant rosbot_ekf::ConfigurationResponse::*COMMAND_NOT_FOUND* 2)
(defclass rosbot_ekf::ConfigurationResponse
  :super ros::object
  :slots (_data _result ))

(defmethod rosbot_ekf::ConfigurationResponse
  (:init
   (&key
    ((:data __data) "")
    ((:result __result) 0)
    )
   (send-super :init)
   (setq _data (string __data))
   (setq _result (round __result))
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; string _data
    4 (length _data)
    ;; uint8 _result
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _data
       (write-long (length _data) s) (princ _data s)
     ;; uint8 _result
       (write-byte _result s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _data
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _data (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _result
     (setq _result (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass rosbot_ekf::Configuration
  :super ros::object
  :slots ())

(setf (get rosbot_ekf::Configuration :md5sum-) "b942000b3d255d27335aa543bc4443e3")
(setf (get rosbot_ekf::Configuration :datatype-) "rosbot_ekf/Configuration")
(setf (get rosbot_ekf::Configuration :request) rosbot_ekf::ConfigurationRequest)
(setf (get rosbot_ekf::Configuration :response) rosbot_ekf::ConfigurationResponse)

(defmethod rosbot_ekf::ConfigurationRequest
  (:response () (instance rosbot_ekf::ConfigurationResponse :init)))

(setf (get rosbot_ekf::ConfigurationRequest :md5sum-) "b942000b3d255d27335aa543bc4443e3")
(setf (get rosbot_ekf::ConfigurationRequest :datatype-) "rosbot_ekf/ConfigurationRequest")
(setf (get rosbot_ekf::ConfigurationRequest :definition-)
      "string command
string data
---
string data
uint8 result
uint8 SUCCESS=0
uint8 FAILURE=1
uint8 COMMAND_NOT_FOUND=2

")

(setf (get rosbot_ekf::ConfigurationResponse :md5sum-) "b942000b3d255d27335aa543bc4443e3")
(setf (get rosbot_ekf::ConfigurationResponse :datatype-) "rosbot_ekf/ConfigurationResponse")
(setf (get rosbot_ekf::ConfigurationResponse :definition-)
      "string command
string data
---
string data
uint8 result
uint8 SUCCESS=0
uint8 FAILURE=1
uint8 COMMAND_NOT_FOUND=2

")



(provide :rosbot_ekf/Configuration "b942000b3d255d27335aa543bc4443e3")


