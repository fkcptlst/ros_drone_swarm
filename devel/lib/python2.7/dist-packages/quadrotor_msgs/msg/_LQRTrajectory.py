# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from quadrotor_msgs/LQRTrajectory.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import std_msgs.msg

class LQRTrajectory(genpy.Message):
  _md5sum = "46be446c56bc8bf131978edfc4464480"
  _type = "quadrotor_msgs/LQRTrajectory"
  _has_header = True  # flag to mark the presence of a Header object
  _full_text = """Header header

# the trajectory id, starts from "1".
uint32 trajectory_id

# the action command for trajectory server.
uint32 ACTION_ADD           =   1
uint32 ACTION_ABORT         =   2
uint32 ACTION_WARN_START           =   3
uint32 ACTION_WARN_FINAL           =   4
uint32 ACTION_WARN_IMPOSSIBLE      =   5
uint32 action

# the weight coefficient of the control effort
float64 r

# the yaw command
float64 start_yaw
float64 final_yaw

# the initial and final state
float64[6] s0
float64[3] ut
 
float64[6] sf 

# the optimal arrival time
float64 t_f

string debug_info

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
"""
  # Pseudo-constants
  ACTION_ADD = 1
  ACTION_ABORT = 2
  ACTION_WARN_START = 3
  ACTION_WARN_FINAL = 4
  ACTION_WARN_IMPOSSIBLE = 5

  __slots__ = ['header','trajectory_id','action','r','start_yaw','final_yaw','s0','ut','sf','t_f','debug_info']
  _slot_types = ['std_msgs/Header','uint32','uint32','float64','float64','float64','float64[6]','float64[3]','float64[6]','float64','string']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,trajectory_id,action,r,start_yaw,final_yaw,s0,ut,sf,t_f,debug_info

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(LQRTrajectory, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.trajectory_id is None:
        self.trajectory_id = 0
      if self.action is None:
        self.action = 0
      if self.r is None:
        self.r = 0.
      if self.start_yaw is None:
        self.start_yaw = 0.
      if self.final_yaw is None:
        self.final_yaw = 0.
      if self.s0 is None:
        self.s0 = [0.] * 6
      if self.ut is None:
        self.ut = [0.] * 3
      if self.sf is None:
        self.sf = [0.] * 6
      if self.t_f is None:
        self.t_f = 0.
      if self.debug_info is None:
        self.debug_info = ''
    else:
      self.header = std_msgs.msg.Header()
      self.trajectory_id = 0
      self.action = 0
      self.r = 0.
      self.start_yaw = 0.
      self.final_yaw = 0.
      self.s0 = [0.] * 6
      self.ut = [0.] * 3
      self.sf = [0.] * 6
      self.t_f = 0.
      self.debug_info = ''

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
      buff.write(_get_struct_2I3d().pack(_x.trajectory_id, _x.action, _x.r, _x.start_yaw, _x.final_yaw))
      buff.write(_get_struct_6d().pack(*self.s0))
      buff.write(_get_struct_3d().pack(*self.ut))
      buff.write(_get_struct_6d().pack(*self.sf))
      _x = self.t_f
      buff.write(_get_struct_d().pack(_x))
      _x = self.debug_info
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
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
      end += 32
      (_x.trajectory_id, _x.action, _x.r, _x.start_yaw, _x.final_yaw,) = _get_struct_2I3d().unpack(str[start:end])
      start = end
      end += 48
      self.s0 = _get_struct_6d().unpack(str[start:end])
      start = end
      end += 24
      self.ut = _get_struct_3d().unpack(str[start:end])
      start = end
      end += 48
      self.sf = _get_struct_6d().unpack(str[start:end])
      start = end
      end += 8
      (self.t_f,) = _get_struct_d().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.debug_info = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.debug_info = str[start:end]
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
      buff.write(_get_struct_2I3d().pack(_x.trajectory_id, _x.action, _x.r, _x.start_yaw, _x.final_yaw))
      buff.write(self.s0.tostring())
      buff.write(self.ut.tostring())
      buff.write(self.sf.tostring())
      _x = self.t_f
      buff.write(_get_struct_d().pack(_x))
      _x = self.debug_info
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
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
      end += 32
      (_x.trajectory_id, _x.action, _x.r, _x.start_yaw, _x.final_yaw,) = _get_struct_2I3d().unpack(str[start:end])
      start = end
      end += 48
      self.s0 = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=6)
      start = end
      end += 24
      self.ut = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=3)
      start = end
      end += 48
      self.sf = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=6)
      start = end
      end += 8
      (self.t_f,) = _get_struct_d().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.debug_info = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.debug_info = str[start:end]
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2I3d = None
def _get_struct_2I3d():
    global _struct_2I3d
    if _struct_2I3d is None:
        _struct_2I3d = struct.Struct("<2I3d")
    return _struct_2I3d
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
_struct_3d = None
def _get_struct_3d():
    global _struct_3d
    if _struct_3d is None:
        _struct_3d = struct.Struct("<3d")
    return _struct_3d
_struct_6d = None
def _get_struct_6d():
    global _struct_6d
    if _struct_6d is None:
        _struct_6d = struct.Struct("<6d")
    return _struct_6d
_struct_d = None
def _get_struct_d():
    global _struct_d
    if _struct_d is None:
        _struct_d = struct.Struct("<d")
    return _struct_d
