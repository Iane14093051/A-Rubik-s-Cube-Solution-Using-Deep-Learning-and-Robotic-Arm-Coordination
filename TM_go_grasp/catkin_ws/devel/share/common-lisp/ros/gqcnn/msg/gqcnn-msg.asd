
(cl:in-package :asdf)

(defsystem "gqcnn-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "Action" :depends-on ("_package_Action"))
    (:file "_package_Action" :depends-on ("_package"))
    (:file "BoundingBox" :depends-on ("_package_BoundingBox"))
    (:file "_package_BoundingBox" :depends-on ("_package"))
    (:file "GQCNNGrasp" :depends-on ("_package_GQCNNGrasp"))
    (:file "_package_GQCNNGrasp" :depends-on ("_package"))
    (:file "Observation" :depends-on ("_package_Observation"))
    (:file "_package_Observation" :depends-on ("_package"))
  ))