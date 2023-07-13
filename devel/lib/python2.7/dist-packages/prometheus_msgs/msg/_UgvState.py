# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from prometheus_msgs/UgvState.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import geometry_msgs.msg
import std_msgs.msg

class UgvState(genpy.Message):
  _md5sum = "6e1039506e3e03cde90e1715508b0ced"
  _type = "prometheus_msgs/UgvState"
  _has_header = True  # flag to mark the presence of a Header object
  _full_text = """std_msgs/Header header

## 机载电脑是否连接上飞控，true已连接，false则不是
bool connected
## 是否解锁，true为已解锁，false则不是
bool armed
bool guided
## PX4飞控当前飞行模式
string mode

## 无人机状态量：位置、速度、姿态
float32[3] position                 ## [m]
float32[3] velocity                 ## [m/s]
float32[3] attitude                 ## [rad]
geometry_msgs/Quaternion attitude_q ## 四元数
float32 battery                 ## 
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

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
"""
  __slots__ = ['header','connected','armed','guided','mode','position','velocity','attitude','attitude_q','battery']
  _slot_types = ['std_msgs/Header','bool','bool','bool','string','float32[3]','float32[3]','float32[3]','geometry_msgs/Quaternion','float32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,connected,armed,guided,mode,position,velocity,attitude,attitude_q,battery

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(UgvState, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.connected is None:
        self.connected = False
      if self.armed is None:
        self.armed = False
      if self.guided is None:
        self.guided = False
      if self.mode is None:
        self.mode = ''
      if self.position is None:
        self.position = [0.] * 3
      if self.velocity is None:
        self.velocity = [0.] * 3
      if self.attitude is None:
        self.attitude = [0.] * 3
      if self.attitude_q is None:
        self.attitude_q = geometry_msgs.msg.Quaternion()
      if self.battery is None:
        self.battery = 0.
    else:
      self.header = std_msgs.msg.Header()
      self.connected = False
      self.armed = False
      self.guided = False
      self.mode = ''
      self.position = [0.] * 3
      self.velocity = [0.] * 3
      self.attitude = [0.] * 3
      self.attitude_q = geometry_msgs.msg.Quaternion()
      self.battery = 0.

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
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_3B().pack(_x.connected, _x.armed, _x.guided))
      _x = self.mode
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      buff.write(_get_struct_3f().pack(*self.position))
      buff.write(_get_struct_3f().pack(*self.velocity))
      buff.write(_get_struct_3f().pack(*self.attitude))
      _x = self
      buff.write(_get_struct_4df().pack(_x.attitude_q.x, _x.attitude_q.y, _x.attitude_q.z, _x.attitude_q.w, _x.battery))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.attitude_q is None:
        self.attitude_q = geometry_msgs.msg.Quaternion()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 3
      (_x.connected, _x.armed, _x.guided,) = _get_struct_3B().unpack(str[start:end])
      self.connected = bool(self.connected)
      self.armed = bool(self.armed)
      self.guided = bool(self.guided)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.mode = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.mode = str[start:end]
      start = end
      end += 12
      self.position = _get_struct_3f().unpack(str[start:end])
      start = end
      end += 12
      self.velocity = _get_struct_3f().unpack(str[start:end])
      start = end
      end += 12
      self.attitude = _get_struct_3f().unpack(str[start:end])
      _x = self
      start = end
      end += 36
      (_x.attitude_q.x, _x.attitude_q.y, _x.attitude_q.z, _x.attitude_q.w, _x.battery,) = _get_struct_4df().unpack(str[start:end])
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
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_3B().pack(_x.connected, _x.armed, _x.guided))
      _x = self.mode
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      buff.write(self.position.tostring())
      buff.write(self.velocity.tostring())
      buff.write(self.attitude.tostring())
      _x = self
      buff.write(_get_struct_4df().pack(_x.attitude_q.x, _x.attitude_q.y, _x.attitude_q.z, _x.attitude_q.w, _x.battery))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.attitude_q is None:
        self.attitude_q = geometry_msgs.msg.Quaternion()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 3
      (_x.connected, _x.armed, _x.guided,) = _get_struct_3B().unpack(str[start:end])
      self.connected = bool(self.connected)
      self.armed = bool(self.armed)
      self.guided = bool(self.guided)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.mode = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.mode = str[start:end]
      start = end
      end += 12
      self.position = numpy.frombuffer(str[start:end], dtype=numpy.float32, count=3)
      start = end
      end += 12
      self.velocity = numpy.frombuffer(str[start:end], dtype=numpy.float32, count=3)
      start = end
      end += 12
      self.attitude = numpy.frombuffer(str[start:end], dtype=numpy.float32, count=3)
      _x = self
      start = end
      end += 36
      (_x.attitude_q.x, _x.attitude_q.y, _x.attitude_q.z, _x.attitude_q.w, _x.battery,) = _get_struct_4df().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_3B = None
def _get_struct_3B():
    global _struct_3B
    if _struct_3B is None:
        _struct_3B = struct.Struct("<3B")
    return _struct_3B
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
_struct_3f = None
def _get_struct_3f():
    global _struct_3f
    if _struct_3f is None:
        _struct_3f = struct.Struct("<3f")
    return _struct_3f
_struct_4df = None
def _get_struct_4df():
    global _struct_4df
    if _struct_4df is None:
        _struct_4df = struct.Struct("<4df")
    return _struct_4df