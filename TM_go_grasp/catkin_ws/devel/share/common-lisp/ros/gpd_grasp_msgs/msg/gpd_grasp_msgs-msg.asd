
(cl:in-package :asdf)

(defsystem "gpd_grasp_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "GraspConfig" :depends-on ("_package_GraspConfig"))
    (:file "_package_GraspConfig" :depends-on ("_package"))
    (:file "GraspConfigList" :depends-on ("_package_GraspConfigList"))
    (:file "_package_GraspConfigList" :depends-on ("_package"))
  ))