
(cl:in-package :asdf)

(defsystem "gqcnn-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :gqcnn-msg
               :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "GQCNNGraspPlanner" :depends-on ("_package_GQCNNGraspPlanner"))
    (:file "_package_GQCNNGraspPlanner" :depends-on ("_package"))
    (:file "GQCNNGraspPlannerBoundingBox" :depends-on ("_package_GQCNNGraspPlannerBoundingBox"))
    (:file "_package_GQCNNGraspPlannerBoundingBox" :depends-on ("_package"))
    (:file "GQCNNGraspPlannerFull" :depends-on ("_package_GQCNNGraspPlannerFull"))
    (:file "_package_GQCNNGraspPlannerFull" :depends-on ("_package"))
    (:file "GQCNNGraspPlannerSegmask" :depends-on ("_package_GQCNNGraspPlannerSegmask"))
    (:file "_package_GQCNNGraspPlannerSegmask" :depends-on ("_package"))
  ))