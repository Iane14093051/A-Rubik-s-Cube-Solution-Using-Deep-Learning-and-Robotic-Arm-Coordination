;; Auto-generated. Do not edit!


(when (boundp 'gqcnn::BoundingBox)
  (if (not (find-package "GQCNN"))
    (make-package "GQCNN"))
  (shadow 'BoundingBox (find-package "GQCNN")))
(unless (find-package "GQCNN::BOUNDINGBOX")
  (make-package "GQCNN::BOUNDINGBOX"))

(in-package "ROS")
;;//! \htmlinclude BoundingBox.msg.html


(defclass gqcnn::BoundingBox
  :super ros::object
  :slots (_minX _minY _maxX _maxY ))

(defmethod gqcnn::BoundingBox
  (:init
   (&key
    ((:minX __minX) 0.0)
    ((:minY __minY) 0.0)
    ((:maxX __maxX) 0.0)
    ((:maxY __maxY) 0.0)
    )
   (send-super :init)
   (setq _minX (float __minX))
   (setq _minY (float __minY))
   (setq _maxX (float __maxX))
   (setq _maxY (float __maxY))
   self)
  (:minX
   (&optional __minX)
   (if __minX (setq _minX __minX)) _minX)
  (:minY
   (&optional __minY)
   (if __minY (setq _minY __minY)) _minY)
  (:maxX
   (&optional __maxX)
   (if __maxX (setq _maxX __maxX)) _maxX)
  (:maxY
   (&optional __maxY)
   (if __maxY (setq _maxY __maxY)) _maxY)
  (:serialization-length
   ()
   (+
    ;; float64 _minX
    8
    ;; float64 _minY
    8
    ;; float64 _maxX
    8
    ;; float64 _maxY
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _minX
       (sys::poke _minX (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _minY
       (sys::poke _minY (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _maxX
       (sys::poke _maxX (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _maxY
       (sys::poke _maxY (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _minX
     (setq _minX (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _minY
     (setq _minY (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _maxX
     (setq _maxX (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _maxY
     (setq _maxY (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get gqcnn::BoundingBox :md5sum-) "316ddfac9d67d96b86cd55005b01f75e")
(setf (get gqcnn::BoundingBox :datatype-) "gqcnn/BoundingBox")
(setf (get gqcnn::BoundingBox :definition-)
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

float64 minX
float64 minY
float64 maxX
float64 maxY

")



(provide :gqcnn/BoundingBox "316ddfac9d67d96b86cd55005b01f75e")


