;; Auto-generated. Do not edit!


(when (boundp 'iiwa_msgs::SetWorkpiece)
  (if (not (find-package "IIWA_MSGS"))
    (make-package "IIWA_MSGS"))
  (shadow 'SetWorkpiece (find-package "IIWA_MSGS")))
(unless (find-package "IIWA_MSGS::SETWORKPIECE")
  (make-package "IIWA_MSGS::SETWORKPIECE"))
(unless (find-package "IIWA_MSGS::SETWORKPIECEREQUEST")
  (make-package "IIWA_MSGS::SETWORKPIECEREQUEST"))
(unless (find-package "IIWA_MSGS::SETWORKPIECERESPONSE")
  (make-package "IIWA_MSGS::SETWORKPIECERESPONSE"))

(in-package "ROS")





(defclass iiwa_msgs::SetWorkpieceRequest
  :super ros::object
  :slots (_workpiece_id ))

(defmethod iiwa_msgs::SetWorkpieceRequest
  (:init
   (&key
    ((:workpiece_id __workpiece_id) "")
    )
   (send-super :init)
   (setq _workpiece_id (string __workpiece_id))
   self)
  (:workpiece_id
   (&optional __workpiece_id)
   (if __workpiece_id (setq _workpiece_id __workpiece_id)) _workpiece_id)
  (:serialization-length
   ()
   (+
    ;; string _workpiece_id
    4 (length _workpiece_id)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _workpiece_id
       (write-long (length _workpiece_id) s) (princ _workpiece_id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _workpiece_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _workpiece_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass iiwa_msgs::SetWorkpieceResponse
  :super ros::object
  :slots (_success _error ))

(defmethod iiwa_msgs::SetWorkpieceResponse
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

(defclass iiwa_msgs::SetWorkpiece
  :super ros::object
  :slots ())

(setf (get iiwa_msgs::SetWorkpiece :md5sum-) "63c849990571529ad5b5c1483c88f899")
(setf (get iiwa_msgs::SetWorkpiece :datatype-) "iiwa_msgs/SetWorkpiece")
(setf (get iiwa_msgs::SetWorkpiece :request) iiwa_msgs::SetWorkpieceRequest)
(setf (get iiwa_msgs::SetWorkpiece :response) iiwa_msgs::SetWorkpieceResponse)

(defmethod iiwa_msgs::SetWorkpieceRequest
  (:response () (instance iiwa_msgs::SetWorkpieceResponse :init)))

(setf (get iiwa_msgs::SetWorkpieceRequest :md5sum-) "63c849990571529ad5b5c1483c88f899")
(setf (get iiwa_msgs::SetWorkpieceRequest :datatype-) "iiwa_msgs/SetWorkpieceRequest")
(setf (get iiwa_msgs::SetWorkpieceRequest :definition-)
      "



string workpiece_id
---
bool success
string error
")

(setf (get iiwa_msgs::SetWorkpieceResponse :md5sum-) "63c849990571529ad5b5c1483c88f899")
(setf (get iiwa_msgs::SetWorkpieceResponse :datatype-) "iiwa_msgs/SetWorkpieceResponse")
(setf (get iiwa_msgs::SetWorkpieceResponse :definition-)
      "



string workpiece_id
---
bool success
string error
")



(provide :iiwa_msgs/SetWorkpiece "63c849990571529ad5b5c1483c88f899")


