
(cl:in-package :asdf)

(defsystem "iamech_ros-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "WPLC" :depends-on ("_package_WPLC"))
    (:file "_package_WPLC" :depends-on ("_package"))
  ))