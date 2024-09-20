;; Auto-generated. Do not edit!


(when (boundp 'gqcnn::Observation)
  (if (not (find-package "GQCNN"))
    (make-package "GQCNN"))
  (shadow 'Observation (find-package "GQCNN")))
(unless (find-package "GQCNN::OBSERVATION")
  (make-package "GQCNN::OBSERVATION"))

(in-package "ROS")
;;//! \htmlinclude Observation.msg.html


(defclass gqcnn::Observation
  :super ros::object
  :slots (_width _height _image_data ))

(defmethod gqcnn::Observation
  (:init
   (&key
    ((:width __width) 0)
    ((:height __height) 0)
    ((:image_data __image_data) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _width (round __width))
   (setq _height (round __height))
   (setq _image_data __image_data)
   self)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:image_data
   (&optional __image_data)
   (if __image_data (setq _image_data __image_data)) _image_data)
  (:serialization-length
   ()
   (+
    ;; uint32 _width
    4
    ;; uint32 _height
    4
    ;; float32[] _image_data
    (* 4    (length _image_data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _width
       (write-long _width s)
     ;; uint32 _height
       (write-long _height s)
     ;; float32[] _image_data
     (write-long (length _image_data) s)
     (dotimes (i (length _image_data))
       (sys::poke (elt _image_data i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _width
     (setq _width (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _height
     (setq _height (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32[] _image_data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _image_data (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _image_data i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get gqcnn::Observation :md5sum-) "0c65489c2c2d2e14daf0f0525a5d2a78")
(setf (get gqcnn::Observation :datatype-) "gqcnn/Observation")
(setf (get gqcnn::Observation :definition-)
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

uint32 width
uint32 height
float32[] image_data

")



(provide :gqcnn/Observation "0c65489c2c2d2e14daf0f0525a5d2a78")


