;; Auto-generated. Do not edit!


(when (boundp 'iiwa_msgs::SetSmartServoLinSpeedLimits)
  (if (not (find-package "IIWA_MSGS"))
    (make-package "IIWA_MSGS"))
  (shadow 'SetSmartServoLinSpeedLimits (find-package "IIWA_MSGS")))
(unless (find-package "IIWA_MSGS::SETSMARTSERVOLINSPEEDLIMITS")
  (make-package "IIWA_MSGS::SETSMARTSERVOLINSPEEDLIMITS"))
(unless (find-package "IIWA_MSGS::SETSMARTSERVOLINSPEEDLIMITSREQUEST")
  (make-package "IIWA_MSGS::SETSMARTSERVOLINSPEEDLIMITSREQUEST"))
(unless (find-package "IIWA_MSGS::SETSMARTSERVOLINSPEEDLIMITSRESPONSE")
  (make-package "IIWA_MSGS::SETSMARTSERVOLINSPEEDLIMITSRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass iiwa_msgs::SetSmartServoLinSpeedLimitsRequest
  :super ros::object
  :slots (_max_cartesian_velocity ))

(defmethod iiwa_msgs::SetSmartServoLinSpeedLimitsRequest
  (:init
   (&key
    ((:max_cartesian_velocity __max_cartesian_velocity) (instance geometry_msgs::Twist :init))
    )
   (send-super :init)
   (setq _max_cartesian_velocity __max_cartesian_velocity)
   self)
  (:max_cartesian_velocity
   (&rest __max_cartesian_velocity)
   (if (keywordp (car __max_cartesian_velocity))
       (send* _max_cartesian_velocity __max_cartesian_velocity)
     (progn
       (if __max_cartesian_velocity (setq _max_cartesian_velocity (car __max_cartesian_velocity)))
       _max_cartesian_velocity)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Twist _max_cartesian_velocity
    (send _max_cartesian_velocity :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Twist _max_cartesian_velocity
       (send _max_cartesian_velocity :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Twist _max_cartesian_velocity
     (send _max_cartesian_velocity :deserialize buf ptr-) (incf ptr- (send _max_cartesian_velocity :serialization-length))
   ;;
   self)
  )

(defclass iiwa_msgs::SetSmartServoLinSpeedLimitsResponse
  :super ros::object
  :slots (_success _error ))

(defmethod iiwa_msgs::SetSmartServoLinSpeedLimitsResponse
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

(defclass iiwa_msgs::SetSmartServoLinSpeedLimits
  :super ros::object
  :slots ())

(setf (get iiwa_msgs::SetSmartServoLinSpeedLimits :md5sum-) "ba27ded3da7c7c0e58e5316ff3ba3f60")
(setf (get iiwa_msgs::SetSmartServoLinSpeedLimits :datatype-) "iiwa_msgs/SetSmartServoLinSpeedLimits")
(setf (get iiwa_msgs::SetSmartServoLinSpeedLimits :request) iiwa_msgs::SetSmartServoLinSpeedLimitsRequest)
(setf (get iiwa_msgs::SetSmartServoLinSpeedLimits :response) iiwa_msgs::SetSmartServoLinSpeedLimitsResponse)

(defmethod iiwa_msgs::SetSmartServoLinSpeedLimitsRequest
  (:response () (instance iiwa_msgs::SetSmartServoLinSpeedLimitsResponse :init)))

(setf (get iiwa_msgs::SetSmartServoLinSpeedLimitsRequest :md5sum-) "ba27ded3da7c7c0e58e5316ff3ba3f60")
(setf (get iiwa_msgs::SetSmartServoLinSpeedLimitsRequest :datatype-) "iiwa_msgs/SetSmartServoLinSpeedLimitsRequest")
(setf (get iiwa_msgs::SetSmartServoLinSpeedLimitsRequest :definition-)
      "
geometry_msgs/Twist max_cartesian_velocity


================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
---

bool success
string error

")

(setf (get iiwa_msgs::SetSmartServoLinSpeedLimitsResponse :md5sum-) "ba27ded3da7c7c0e58e5316ff3ba3f60")
(setf (get iiwa_msgs::SetSmartServoLinSpeedLimitsResponse :datatype-) "iiwa_msgs/SetSmartServoLinSpeedLimitsResponse")
(setf (get iiwa_msgs::SetSmartServoLinSpeedLimitsResponse :definition-)
      "
geometry_msgs/Twist max_cartesian_velocity


================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
---

bool success
string error

")



(provide :iiwa_msgs/SetSmartServoLinSpeedLimits "ba27ded3da7c7c0e58e5316ff3ba3f60")


