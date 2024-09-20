# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from tm_msgs/ConnectTMRequest.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class ConnectTMRequest(genpy.Message):
  _md5sum = "689402be41aef39745cc8a1b503617c8"
  _type = "tm_msgs/ConnectTMRequest"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """#float64 DEFAULT_TIMEOUT = 1.0
#float64 DEFAULT_TIMEVAL = 3.0
#server :   TMSVR, TMSCT
#connect/reconnect : In Connection phase. 
#connect    == true. Keeping connect function
#reconnect  == true. If connect funcition fail, It will reconnect.

int8 TMSVR = 0
int8 TMSCT = 1

int8 server
bool connect
bool reconnect
float64 timeout
float64 timeval
"""
  # Pseudo-constants
  TMSVR = 0
  TMSCT = 1

  __slots__ = ['server','connect','reconnect','timeout','timeval']
  _slot_types = ['int8','bool','bool','float64','float64']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       server,connect,reconnect,timeout,timeval

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(ConnectTMRequest, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.server is None:
        self.server = 0
      if self.connect is None:
        self.connect = False
      if self.reconnect is None:
        self.reconnect = False
      if self.timeout is None:
        self.timeout = 0.
      if self.timeval is None:
        self.timeval = 0.
    else:
      self.server = 0
      self.connect = False
      self.reconnect = False
      self.timeout = 0.
      self.timeval = 0.

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
      buff.write(_get_struct_b2B2d().pack(_x.server, _x.connect, _x.reconnect, _x.timeout, _x.timeval))
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
      end = 0
      _x = self
      start = end
      end += 19
      (_x.server, _x.connect, _x.reconnect, _x.timeout, _x.timeval,) = _get_struct_b2B2d().unpack(str[start:end])
      self.connect = bool(self.connect)
      self.reconnect = bool(self.reconnect)
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
      buff.write(_get_struct_b2B2d().pack(_x.server, _x.connect, _x.reconnect, _x.timeout, _x.timeval))
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
      end = 0
      _x = self
      start = end
      end += 19
      (_x.server, _x.connect, _x.reconnect, _x.timeout, _x.timeval,) = _get_struct_b2B2d().unpack(str[start:end])
      self.connect = bool(self.connect)
      self.reconnect = bool(self.reconnect)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_b2B2d = None
def _get_struct_b2B2d():
    global _struct_b2B2d
    if _struct_b2B2d is None:
        _struct_b2B2d = struct.Struct("<b2B2d")
    return _struct_b2B2d
# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from tm_msgs/ConnectTMResponse.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class ConnectTMResponse(genpy.Message):
  _md5sum = "6f6da3883749771fac40d6deb24a8c02"
  _type = "tm_msgs/ConnectTMResponse"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """#ok :   connect status
bool ok

"""
  __slots__ = ['ok']
  _slot_types = ['bool']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       ok

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(ConnectTMResponse, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.ok is None:
        self.ok = False
    else:
      self.ok = False

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
      _x = self.ok
      buff.write(_get_struct_B().pack(_x))
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
      end = 0
      start = end
      end += 1
      (self.ok,) = _get_struct_B().unpack(str[start:end])
      self.ok = bool(self.ok)
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
      _x = self.ok
      buff.write(_get_struct_B().pack(_x))
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
      end = 0
      start = end
      end += 1
      (self.ok,) = _get_struct_B().unpack(str[start:end])
      self.ok = bool(self.ok)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_B = None
def _get_struct_B():
    global _struct_B
    if _struct_B is None:
        _struct_B = struct.Struct("<B")
    return _struct_B
class ConnectTM(object):
  _type          = 'tm_msgs/ConnectTM'
  _md5sum = '0d50ce933552e4d5e66858757bce799c'
  _request_class  = ConnectTMRequest
  _response_class = ConnectTMResponse
