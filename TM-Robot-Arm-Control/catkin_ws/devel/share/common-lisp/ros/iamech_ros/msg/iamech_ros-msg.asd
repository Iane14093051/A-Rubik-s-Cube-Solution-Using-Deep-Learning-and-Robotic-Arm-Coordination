
(cl:in-package :asdf)

(defsystem "iamech_ros-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "PLCStatus" :depends-on ("_package_PLCStatus"))
    (:file "_package_PLCStatus" :depends-on ("_package"))
    (:file "Wheel" :depends-on ("_package_Wheel"))
    (:file "_package_Wheel" :depends-on ("_package"))
  ))