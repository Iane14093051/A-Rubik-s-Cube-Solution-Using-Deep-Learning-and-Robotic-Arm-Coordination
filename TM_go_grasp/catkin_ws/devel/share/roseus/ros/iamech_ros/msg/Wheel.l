;; Auto-generated. Do not edit!


(when (boundp 'iamech_ros::Wheel)
  (if (not (find-package "IAMECH_ROS"))
    (make-package "IAMECH_ROS"))
  (shadow 'Wheel (find-package "IAMECH_ROS")))
(unless (find-package "IAMECH_ROS::WHEEL")
  (make-package "IAMECH_ROS::WHEEL"))

(in-package "ROS")
;;//! \htmlinclude Wheel.msg.html


(defclass iamech_ros::Wheel
  :super ros::object
  :slots (_bReady _bMoving _bError _pos _velocity _ErrorCode _temperature _volt ))

(defmethod iamech_ros::Wheel
  (:init
   (&key
    ((:bReady __bReady) 0)
    ((:bMoving __bMoving) 0)
    ((:bError __bError) 0)
    ((:pos __pos) 0)
    ((:velocity __velocity) 0)
    ((:ErrorCode __ErrorCode) 0)
    ((:temperature __temperature) 0)
    ((:volt __volt) 0)
    )
   (send-super :init)
   (setq _bReady (round __bReady))
   (setq _bMoving (round __bMoving))
   (setq _bError (round __bError))
   (setq _pos (round __pos))
   (setq _velocity (round __velocity))
   (setq _ErrorCode (round __ErrorCode))
   (setq _temperature (round __temperature))
   (setq _volt (round __volt))
   self)
  (:bReady
   (&optional __bReady)
   (if __bReady (setq _bReady __bReady)) _bReady)
  (:bMoving
   (&optional __bMoving)
   (if __bMoving (setq _bMoving __bMoving)) _bMoving)
  (:bError
   (&optional __bError)
   (if __bError (setq _bError __bError)) _bError)
  (:pos
   (&optional __pos)
   (if __pos (setq _pos __pos)) _pos)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:ErrorCode
   (&optional __ErrorCode)
   (if __ErrorCode (setq _ErrorCode __ErrorCode)) _ErrorCode)
  (:temperature
   (&optional __temperature)
   (if __temperature (setq _temperature __temperature)) _temperature)
  (:volt
   (&optional __volt)
   (if __volt (setq _volt __volt)) _volt)
  (:serialization-length
   ()
   (+
    ;; int32 _bReady
    4
    ;; int32 _bMoving
    4
    ;; int32 _bError
    4
    ;; int32 _pos
    4
    ;; int32 _velocity
    4
    ;; int32 _ErrorCode
    4
    ;; int32 _temperature
    4
    ;; int32 _volt
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _bReady
       (write-long _bReady s)
     ;; int32 _bMoving
       (write-long _bMoving s)
     ;; int32 _bError
       (write-long _bError s)
     ;; int32 _pos
       (write-long _pos s)
     ;; int32 _velocity
       (write-long _velocity s)
     ;; int32 _ErrorCode
       (write-long _ErrorCode s)
     ;; int32 _temperature
       (write-long _temperature s)
     ;; int32 _volt
       (write-long _volt s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _bReady
     (setq _bReady (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _bMoving
     (setq _bMoving (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _bError
     (setq _bError (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _pos
     (setq _pos (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _velocity
     (setq _velocity (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _ErrorCode
     (setq _ErrorCode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _temperature
     (setq _temperature (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _volt
     (setq _volt (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get iamech_ros::Wheel :md5sum-) "cb0e446b2d87810af5b33fbf4f7f9055")
(setf (get iamech_ros::Wheel :datatype-) "iamech_ros/Wheel")
(setf (get iamech_ros::Wheel :definition-)
      "int32 bReady
int32 bMoving
int32 bError
int32 pos
int32 velocity
int32 ErrorCode
int32 temperature
int32 volt

")



(provide :iamech_ros/Wheel "cb0e446b2d87810af5b33fbf4f7f9055")


