;; Auto-generated. Do not edit!


(when (boundp 'gqcnn::GQCNNGrasp)
  (if (not (find-package "GQCNN"))
    (make-package "GQCNN"))
  (shadow 'GQCNNGrasp (find-package "GQCNN")))
(unless (find-package "GQCNN::GQCNNGRASP")
  (make-package "GQCNN::GQCNNGRASP"))

(in-package "ROS")
;;//! \htmlinclude GQCNNGrasp.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(intern "*PARALLEL_JAW*" (find-package "GQCNN::GQCNNGRASP"))
(shadow '*PARALLEL_JAW* (find-package "GQCNN::GQCNNGRASP"))
(defconstant gqcnn::GQCNNGrasp::*PARALLEL_JAW* 0)
(intern "*SUCTION*" (find-package "GQCNN::GQCNNGRASP"))
(shadow '*SUCTION* (find-package "GQCNN::GQCNNGRASP"))
(defconstant gqcnn::GQCNNGrasp::*SUCTION* 1)

(defun gqcnn::GQCNNGrasp-to-symbol (const)
  (cond
        ((= const 0) 'gqcnn::GQCNNGrasp::*PARALLEL_JAW*)
        ((= const 1) 'gqcnn::GQCNNGrasp::*SUCTION*)
        (t nil)))

(defclass gqcnn::GQCNNGrasp
  :super ros::object
  :slots (_pose _q_value _grasp_type _center_px _angle _depth _thumbnail ))

(defmethod gqcnn::GQCNNGrasp
  (:init
   (&key
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    ((:q_value __q_value) 0.0)
    ((:grasp_type __grasp_type) 0)
    ((:center_px __center_px) (make-array 2 :initial-element 0.0 :element-type :float))
    ((:angle __angle) 0.0)
    ((:depth __depth) 0.0)
    ((:thumbnail __thumbnail) (instance sensor_msgs::Image :init))
    )
   (send-super :init)
   (setq _pose __pose)
   (setq _q_value (float __q_value))
   (setq _grasp_type (round __grasp_type))
   (setq _center_px __center_px)
   (setq _angle (float __angle))
   (setq _depth (float __depth))
   (setq _thumbnail __thumbnail)
   self)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:q_value
   (&optional __q_value)
   (if __q_value (setq _q_value __q_value)) _q_value)
  (:grasp_type
   (&optional __grasp_type)
   (if __grasp_type (setq _grasp_type __grasp_type)) _grasp_type)
  (:center_px
   (&optional __center_px)
   (if __center_px (setq _center_px __center_px)) _center_px)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:depth
   (&optional __depth)
   (if __depth (setq _depth __depth)) _depth)
  (:thumbnail
   (&rest __thumbnail)
   (if (keywordp (car __thumbnail))
       (send* _thumbnail __thumbnail)
     (progn
       (if __thumbnail (setq _thumbnail (car __thumbnail)))
       _thumbnail)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ;; float64 _q_value
    8
    ;; uint8 _grasp_type
    1
    ;; float64[2] _center_px
    (* 8    2)
    ;; float64 _angle
    8
    ;; float64 _depth
    8
    ;; sensor_msgs/Image _thumbnail
    (send _thumbnail :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;; float64 _q_value
       (sys::poke _q_value (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint8 _grasp_type
       (write-byte _grasp_type s)
     ;; float64[2] _center_px
     (dotimes (i 2)
       (sys::poke (elt _center_px i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _depth
       (sys::poke _depth (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; sensor_msgs/Image _thumbnail
       (send _thumbnail :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; float64 _q_value
     (setq _q_value (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint8 _grasp_type
     (setq _grasp_type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float64[2] _center_px
   (dotimes (i (length _center_px))
     (setf (elt _center_px i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64 _angle
     (setq _angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _depth
     (setq _depth (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; sensor_msgs/Image _thumbnail
     (send _thumbnail :deserialize buf ptr-) (incf ptr- (send _thumbnail :serialization-length))
   ;;
   self)
  )

(setf (get gqcnn::GQCNNGrasp :md5sum-) "42d4b9ffbd41cf1bdd4a4e08ef7d0dec")
(setf (get gqcnn::GQCNNGrasp :datatype-) "gqcnn/GQCNNGrasp")
(setf (get gqcnn::GQCNNGrasp :definition-)
      "# Copyright ©2017. The Regents of the University of California (Regents).
# All Rights Reserved. Permission to use, copy, modify, and distribute this
# software and its documentation for educational, research, and not-for-profit
# purposes, without fee and without a signed licensing agreement, is hereby
# granted, provided that the above copyright notice, this paragraph and the
# following two paragraphs appear in all copies, modifications, and
# distributions. Contact The Office of Technology Licensing, UC Berkeley, 2150
# Shattuck Avenue, Suite 510, Berkeley, CA 94720-1620, (510) 643-7201,
# otl@berkeley.edu,
# http://ipira.berkeley.edu/industry-info for commercial licensing opportunities.

# IN NO EVENT SHALL REGENTS BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL,
# INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING LOST PROFITS, ARISING OUT OF
# THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF REGENTS HAS BEEN
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# REGENTS SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE. THE SOFTWARE AND ACCOMPANYING DOCUMENTATION, IF ANY, PROVIDED
# HEREUNDER IS PROVIDED \"AS IS\". REGENTS HAS NO OBLIGATION TO PROVIDE
# MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.

geometry_msgs/Pose pose
float64 q_value

uint8 PARALLEL_JAW=0
uint8 SUCTION=1
uint8 grasp_type

float64[2] center_px
float64 angle
float64 depth
sensor_msgs/Image thumbnail

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :gqcnn/GQCNNGrasp "42d4b9ffbd41cf1bdd4a4e08ef7d0dec")


