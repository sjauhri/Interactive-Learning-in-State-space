;; Auto-generated. Do not edit!


(when (boundp 'iiwa_msgs::SetSpeedOverride)
  (if (not (find-package "IIWA_MSGS"))
    (make-package "IIWA_MSGS"))
  (shadow 'SetSpeedOverride (find-package "IIWA_MSGS")))
(unless (find-package "IIWA_MSGS::SETSPEEDOVERRIDE")
  (make-package "IIWA_MSGS::SETSPEEDOVERRIDE"))
(unless (find-package "IIWA_MSGS::SETSPEEDOVERRIDEREQUEST")
  (make-package "IIWA_MSGS::SETSPEEDOVERRIDEREQUEST"))
(unless (find-package "IIWA_MSGS::SETSPEEDOVERRIDERESPONSE")
  (make-package "IIWA_MSGS::SETSPEEDOVERRIDERESPONSE"))

(in-package "ROS")





(defclass iiwa_msgs::SetSpeedOverrideRequest
  :super ros::object
  :slots (_override_reduction ))

(defmethod iiwa_msgs::SetSpeedOverrideRequest
  (:init
   (&key
    ((:override_reduction __override_reduction) 0.0)
    )
   (send-super :init)
   (setq _override_reduction (float __override_reduction))
   self)
  (:override_reduction
   (&optional __override_reduction)
   (if __override_reduction (setq _override_reduction __override_reduction)) _override_reduction)
  (:serialization-length
   ()
   (+
    ;; float64 _override_reduction
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _override_reduction
       (sys::poke _override_reduction (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _override_reduction
     (setq _override_reduction (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass iiwa_msgs::SetSpeedOverrideResponse
  :super ros::object
  :slots (_success _error ))

(defmethod iiwa_msgs::SetSpeedOverrideResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:error __error) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _error (string __error))
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:error
   (&optional __error)
   (if __error (setq _error __error)) _error)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _error
    4 (length _error)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _error
       (write-long (length _error) s) (princ _error s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _error
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _error (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass iiwa_msgs::SetSpeedOverride
  :super ros::object
  :slots ())

(setf (get iiwa_msgs::SetSpeedOverride :md5sum-) "5cb6d9d155adc8ed76143d144d178f68")
(setf (get iiwa_msgs::SetSpeedOverride :datatype-) "iiwa_msgs/SetSpeedOverride")
(setf (get iiwa_msgs::SetSpeedOverride :request) iiwa_msgs::SetSpeedOverrideRequest)
(setf (get iiwa_msgs::SetSpeedOverride :response) iiwa_msgs::SetSpeedOverrideResponse)

(defmethod iiwa_msgs::SetSpeedOverrideRequest
  (:response () (instance iiwa_msgs::SetSpeedOverrideResponse :init)))

(setf (get iiwa_msgs::SetSpeedOverrideRequest :md5sum-) "5cb6d9d155adc8ed76143d144d178f68")
(setf (get iiwa_msgs::SetSpeedOverrideRequest :datatype-) "iiwa_msgs/SetSpeedOverrideRequest")
(setf (get iiwa_msgs::SetSpeedOverrideRequest :definition-)
      "
float64 override_reduction

---

bool success
string error
")

(setf (get iiwa_msgs::SetSpeedOverrideResponse :md5sum-) "5cb6d9d155adc8ed76143d144d178f68")
(setf (get iiwa_msgs::SetSpeedOverrideResponse :datatype-) "iiwa_msgs/SetSpeedOverrideResponse")
(setf (get iiwa_msgs::SetSpeedOverrideResponse :definition-)
      "
float64 override_reduction

---

bool success
string error
")



(provide :iiwa_msgs/SetSpeedOverride "5cb6d9d155adc8ed76143d144d178f68")


