
(cl:in-package :asdf)

(defsystem "rosbot_ekf-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Configuration" :depends-on ("_package_Configuration"))
    (:file "_package_Configuration" :depends-on ("_package"))
  ))