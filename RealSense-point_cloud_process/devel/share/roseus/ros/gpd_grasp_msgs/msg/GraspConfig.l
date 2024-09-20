;; Auto-generated. Do not edit!


(when (boundp 'gpd_grasp_msgs::GraspConfig)
  (if (not (find-package "GPD_GRASP_MSGS"))
    (make-package "GPD_GRASP_MSGS"))
  (shadow 'GraspConfig (find-package "GPD_GRASP_MSGS")))
(unless (find-package "GPD_GRASP_MSGS::GRASPCONFIG")
  (make-package "GPD_GRASP_MSGS::GRASPCONFIG"))

(in-package "ROS")
;;//! \htmlinclude GraspConfig.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass gpd_grasp_msgs::GraspConfig
  :super ros::object
  :slots (_bottom _top _surface _approach _binormal _axis _sample _width _score ))

(defmethod gpd_grasp_msgs::GraspConfig
  (:init
   (&key
    ((:bottom __bottom) (instance geometry_msgs::Point :init))
    ((:top __top) (instance geometry_msgs::Point :init))
    ((:surface __surface) (instance geometry_msgs::Point :init))
    ((:approach __approach) (instance geometry_msgs::Vector3 :init))
    ((:binormal __binormal) (instance geometry_msgs::Vector3 :init))
    ((:axis __axis) (instance geometry_msgs::Vector3 :init))
    ((:sample __sample) (instance geometry_msgs::Point :init))
    ((:width __width) (instance std_msgs::Float32 :init))
    ((:score __score) (instance std_msgs::Float32 :init))
    )
   (send-super :init)
   (setq _bottom __bottom)
   (setq _top __top)
   (setq _surface __surface)
   (setq _approach __approach)
   (setq _binormal __binormal)
   (setq _axis __axis)
   (setq _sample __sample)
   (setq _width __width)
   (setq _score __score)
   self)
  (:bottom
   (&rest __bottom)
   (if (keywordp (car __bottom))
       (send* _bottom __bottom)
     (progn
       (if __bottom (setq _bottom (car __bottom)))
       _bottom)))
  (:top
   (&rest __top)
   (if (keywordp (car __top))
       (send* _top __top)
     (progn
       (if __top (setq _top (car __top)))
       _top)))
  (:surface
   (&rest __surface)
   (if (keywordp (car __surface))
       (send* _surface __surface)
     (progn
       (if __surface (setq _surface (car __surface)))
       _surface)))
  (:approach
   (&rest __approach)
   (if (keywordp (car __approach))
       (send* _approach __approach)
     (progn
       (if __approach (setq _approach (car __approach)))
       _approach)))
  (:binormal
   (&rest __binormal)
   (if (keywordp (car __binormal))
       (send* _binormal __binormal)
     (progn
       (if __binormal (setq _binormal (car __binormal)))
       _binormal)))
  (:axis
   (&rest __axis)
   (if (keywordp (car __axis))
       (send* _axis __axis)
     (progn
       (if __axis (setq _axis (car __axis)))
       _axis)))
  (:sample
   (&rest __sample)
   (if (keywordp (car __sample))
       (send* _sample __sample)
     (progn
       (if __sample (setq _sample (car __sample)))
       _sample)))
  (:width
   (&rest __width)
   (if (keywordp (car __width))
       (send* _width __width)
     (progn
       (if __width (setq _width (car __width)))
       _width)))
  (:score
   (&rest __score)
   (if (keywordp (car __score))
       (send* _score __score)
     (progn
       (if __score (setq _score (car __score)))
       _score)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point _bottom
    (send _bottom :serialization-length)
    ;; geometry_msgs/Point _top
    (send _top :serialization-length)
    ;; geometry_msgs/Point _surface
    (send _surface :serialization-length)
    ;; geometry_msgs/Vector3 _approach
    (send _approach :serialization-length)
    ;; geometry_msgs/Vector3 _binormal
    (send _binormal :serialization-length)
    ;; geometry_msgs/Vector3 _axis
    (send _axis :serialization-length)
    ;; geometry_msgs/Point _sample
    (send _sample :serialization-length)
    ;; std_msgs/Float32 _width
    (send _width :serialization-length)
    ;; std_msgs/Float32 _score
    (send _score :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point _bottom
       (send _bottom :serialize s)
     ;; geometry_msgs/Point _top
       (send _top :serialize s)
     ;; geometry_msgs/Point _surface
       (send _surface :serialize s)
     ;; geometry_msgs/Vector3 _approach
       (send _approach :serialize s)
     ;; geometry_msgs/Vector3 _binormal
       (send _binormal :serialize s)
     ;; geometry_msgs/Vector3 _axis
       (send _axis :serialize s)
     ;; geometry_msgs/Point _sample
       (send _sample :serialize s)
     ;; std_msgs/Float32 _width
       (send _width :serialize s)
     ;; std_msgs/Float32 _score
       (send _score :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point _bottom
     (send _bottom :deserialize buf ptr-) (incf ptr- (send _bottom :serialization-length))
   ;; geometry_msgs/Point _top
     (send _top :deserialize buf ptr-) (incf ptr- (send _top :serialization-length))
   ;; geometry_msgs/Point _surface
     (send _surface :deserialize buf ptr-) (incf ptr- (send _surface :serialization-length))
   ;; geometry_msgs/Vector3 _approach
     (send _approach :deserialize buf ptr-) (incf ptr- (send _approach :serialization-length))
   ;; geometry_msgs/Vector3 _binormal
     (send _binormal :deserialize buf ptr-) (incf ptr- (send _binormal :serialization-length))
   ;; geometry_msgs/Vector3 _axis
     (send _axis :deserialize buf ptr-) (incf ptr- (send _axis :serialization-length))
   ;; geometry_msgs/Point _sample
     (send _sample :deserialize buf ptr-) (incf ptr- (send _sample :serialization-length))
   ;; std_msgs/Float32 _width
     (send _width :deserialize buf ptr-) (incf ptr- (send _width :serialization-length))
   ;; std_msgs/Float32 _score
     (send _score :deserialize buf ptr-) (incf ptr- (send _score :serialization-length))
   ;;
   self)
  )

(setf (get gpd_grasp_msgs::GraspConfig :md5sum-) "8e6b3c31591d4b0fc202f092dca68301")
(setf (get gpd_grasp_msgs::GraspConfig :datatype-) "gpd_grasp_msgs/GraspConfig")
(setf (get gpd_grasp_msgs::GraspConfig :definition-)
      "# This message describes a 2-finger grasp configuration by its 6-DOF pose, 
# consisting of a 3-DOF position and 3-DOF orientation, and the opening 
# width of the robot hand.

# Position
geometry_msgs/Point bottom # centered bottom/base of the robot hand)
geometry_msgs/Point top # centered top/fingertip of the robot hand)
geometry_msgs/Point surface # centered position on object surface

# Orientation represented as three axis (R = [approach binormal axis])
geometry_msgs/Vector3 approach # The grasp approach direction
geometry_msgs/Vector3 binormal # The binormal
geometry_msgs/Vector3 axis # The hand axis

geometry_msgs/Point sample # Point at which the grasp was found

std_msgs/Float32 width # Required aperture (opening width) of the robot hand 

std_msgs/Float32 score # Score assigned to the grasp by the classifier

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

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
float64 z
================================================================================
MSG: std_msgs/Float32
float32 data
")



(provide :gpd_grasp_msgs/GraspConfig "8e6b3c31591d4b0fc202f092dca68301")


