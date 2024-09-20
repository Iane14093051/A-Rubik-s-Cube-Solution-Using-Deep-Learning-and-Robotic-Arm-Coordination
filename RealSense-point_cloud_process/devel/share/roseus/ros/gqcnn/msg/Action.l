;; Auto-generated. Do not edit!


(when (boundp 'gqcnn::Action)
  (if (not (find-package "GQCNN"))
    (make-package "GQCNN"))
  (shadow 'Action (find-package "GQCNN")))
(unless (find-package "GQCNN::ACTION")
  (make-package "GQCNN::ACTION"))

(in-package "ROS")
;;//! \htmlinclude Action.msg.html


(defclass gqcnn::Action
  :super ros::object
  :slots (_width _height _mask_data _action_type _action_data _confidence ))

(defmethod gqcnn::Action
  (:init
   (&key
    ((:width __width) 0)
    ((:height __height) 0)
    ((:mask_data __mask_data) (make-array 0 :initial-element 0 :element-type :char))
    ((:action_type __action_type) "")
    ((:action_data __action_data) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:confidence __confidence) 0.0)
    )
   (send-super :init)
   (setq _width (round __width))
   (setq _height (round __height))
   (setq _mask_data __mask_data)
   (setq _action_type (string __action_type))
   (setq _action_data __action_data)
   (setq _confidence (float __confidence))
   self)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:mask_data
   (&optional __mask_data)
   (if __mask_data (setq _mask_data __mask_data)) _mask_data)
  (:action_type
   (&optional __action_type)
   (if __action_type (setq _action_type __action_type)) _action_type)
  (:action_data
   (&optional __action_data)
   (if __action_data (setq _action_data __action_data)) _action_data)
  (:confidence
   (&optional __confidence)
   (if __confidence (setq _confidence __confidence)) _confidence)
  (:serialization-length
   ()
   (+
    ;; uint32 _width
    4
    ;; uint32 _height
    4
    ;; uint8[] _mask_data
    (* 1    (length _mask_data)) 4
    ;; string _action_type
    4 (length _action_type)
    ;; float32[] _action_data
    (* 4    (length _action_data)) 4
    ;; float32 _confidence
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _width
       (write-long _width s)
     ;; uint32 _height
       (write-long _height s)
     ;; uint8[] _mask_data
     (write-long (length _mask_data) s)
     (princ _mask_data s)
     ;; string _action_type
       (write-long (length _action_type) s) (princ _action_type s)
     ;; float32[] _action_data
     (write-long (length _action_data) s)
     (dotimes (i (length _action_data))
       (sys::poke (elt _action_data i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32 _confidence
       (sys::poke _confidence (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _width
     (setq _width (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _height
     (setq _height (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8[] _mask_data
   (let ((n (sys::peek buf ptr- :integer))) (incf ptr- 4)
     (setq _mask_data (make-array n :element-type :char))
     (replace _mask_data buf :start2 ptr-) (incf ptr- n))
   ;; string _action_type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _action_type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32[] _action_data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _action_data (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _action_data i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32 _confidence
     (setq _confidence (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get gqcnn::Action :md5sum-) "ec928182aa4f966ba689e9ac10b10d2d")
(setf (get gqcnn::Action :datatype-) "gqcnn/Action")
(setf (get gqcnn::Action :definition-)
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
uint8[] mask_data
string action_type
float32[] action_data
float32 confidence

")



(provide :gqcnn/Action "ec928182aa4f966ba689e9ac10b10d2d")


