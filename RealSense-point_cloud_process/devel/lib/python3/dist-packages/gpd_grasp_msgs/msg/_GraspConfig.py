# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from gpd_grasp_msgs/GraspConfig.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import geometry_msgs.msg
import std_msgs.msg

class GraspConfig(genpy.Message):
  _md5sum = "8e6b3c31591d4b0fc202f092dca68301"
  _type = "gpd_grasp_msgs/GraspConfig"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """# This message describes a 2-finger grasp configuration by its 6-DOF pose, 
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
float32 data"""
  __slots__ = ['bottom','top','surface','approach','binormal','axis','sample','width','score']
  _slot_types = ['geometry_msgs/Point','geometry_msgs/Point','geometry_msgs/Point','geometry_msgs/Vector3','geometry_msgs/Vector3','geometry_msgs/Vector3','geometry_msgs/Point','std_msgs/Float32','std_msgs/Float32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       bottom,top,surface,approach,binormal,axis,sample,width,score

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(GraspConfig, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.bottom is None:
        self.bottom = geometry_msgs.msg.Point()
      if self.top is None:
        self.top = geometry_msgs.msg.Point()
      if self.surface is None:
        self.surface = geometry_msgs.msg.Point()
      if self.approach is None:
        self.approach = geometry_msgs.msg.Vector3()
      if self.binormal is None:
        self.binormal = geometry_msgs.msg.Vector3()
      if self.axis is None:
        self.axis = geometry_msgs.msg.Vector3()
      if self.sample is None:
        self.sample = geometry_msgs.msg.Point()
      if self.width is None:
        self.width = std_msgs.msg.Float32()
      if self.score is None:
        self.score = std_msgs.msg.Float32()
    else:
      self.bottom = geometry_msgs.msg.Point()
      self.top = geometry_msgs.msg.Point()
      self.surface = geometry_msgs.msg.Point()
      self.approach = geometry_msgs.msg.Vector3()
      self.binormal = geometry_msgs.msg.Vector3()
      self.axis = geometry_msgs.msg.Vector3()
      self.sample = geometry_msgs.msg.Point()
      self.width = std_msgs.msg.Float32()
      self.score = std_msgs.msg.Float32()

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_21d2f().pack(_x.bottom.x, _x.bottom.y, _x.bottom.z, _x.top.x, _x.top.y, _x.top.z, _x.surface.x, _x.surface.y, _x.surface.z, _x.approach.x, _x.approach.y, _x.approach.z, _x.binormal.x, _x.binormal.y, _x.binormal.z, _x.axis.x, _x.axis.y, _x.axis.z, _x.sample.x, _x.sample.y, _x.sample.z, _x.width.data, _x.score.data))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.bottom is None:
        self.bottom = geometry_msgs.msg.Point()
      if self.top is None:
        self.top = geometry_msgs.msg.Point()
      if self.surface is None:
        self.surface = geometry_msgs.msg.Point()
      if self.approach is None:
        self.approach = geometry_msgs.msg.Vector3()
      if self.binormal is None:
        self.binormal = geometry_msgs.msg.Vector3()
      if self.axis is None:
        self.axis = geometry_msgs.msg.Vector3()
      if self.sample is None:
        self.sample = geometry_msgs.msg.Point()
      if self.width is None:
        self.width = std_msgs.msg.Float32()
      if self.score is None:
        self.score = std_msgs.msg.Float32()
      end = 0
      _x = self
      start = end
      end += 176
      (_x.bottom.x, _x.bottom.y, _x.bottom.z, _x.top.x, _x.top.y, _x.top.z, _x.surface.x, _x.surface.y, _x.surface.z, _x.approach.x, _x.approach.y, _x.approach.z, _x.binormal.x, _x.binormal.y, _x.binormal.z, _x.axis.x, _x.axis.y, _x.axis.z, _x.sample.x, _x.sample.y, _x.sample.z, _x.width.data, _x.score.data,) = _get_struct_21d2f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_21d2f().pack(_x.bottom.x, _x.bottom.y, _x.bottom.z, _x.top.x, _x.top.y, _x.top.z, _x.surface.x, _x.surface.y, _x.surface.z, _x.approach.x, _x.approach.y, _x.approach.z, _x.binormal.x, _x.binormal.y, _x.binormal.z, _x.axis.x, _x.axis.y, _x.axis.z, _x.sample.x, _x.sample.y, _x.sample.z, _x.width.data, _x.score.data))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.bottom is None:
        self.bottom = geometry_msgs.msg.Point()
      if self.top is None:
        self.top = geometry_msgs.msg.Point()
      if self.surface is None:
        self.surface = geometry_msgs.msg.Point()
      if self.approach is None:
        self.approach = geometry_msgs.msg.Vector3()
      if self.binormal is None:
        self.binormal = geometry_msgs.msg.Vector3()
      if self.axis is None:
        self.axis = geometry_msgs.msg.Vector3()
      if self.sample is None:
        self.sample = geometry_msgs.msg.Point()
      if self.width is None:
        self.width = std_msgs.msg.Float32()
      if self.score is None:
        self.score = std_msgs.msg.Float32()
      end = 0
      _x = self
      start = end
      end += 176
      (_x.bottom.x, _x.bottom.y, _x.bottom.z, _x.top.x, _x.top.y, _x.top.z, _x.surface.x, _x.surface.y, _x.surface.z, _x.approach.x, _x.approach.y, _x.approach.z, _x.binormal.x, _x.binormal.y, _x.binormal.z, _x.axis.x, _x.axis.y, _x.axis.z, _x.sample.x, _x.sample.y, _x.sample.z, _x.width.data, _x.score.data,) = _get_struct_21d2f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_21d2f = None
def _get_struct_21d2f():
    global _struct_21d2f
    if _struct_21d2f is None:
        _struct_21d2f = struct.Struct("<21d2f")
    return _struct_21d2f
