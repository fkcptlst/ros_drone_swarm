// Auto-generated. Do not edit!

// (in-package prometheus_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class DroneState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.connected = null;
      this.armed = null;
      this.landed = null;
      this.mode = null;
      this.odom_valid = null;
      this.time_from_start = null;
      this.position = null;
      this.rel_alt = null;
      this.velocity = null;
      this.attitude = null;
      this.attitude_q = null;
      this.attitude_rate = null;
      this.battery_state = null;
      this.uav_id = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('connected')) {
        this.connected = initObj.connected
      }
      else {
        this.connected = false;
      }
      if (initObj.hasOwnProperty('armed')) {
        this.armed = initObj.armed
      }
      else {
        this.armed = false;
      }
      if (initObj.hasOwnProperty('landed')) {
        this.landed = initObj.landed
      }
      else {
        this.landed = false;
      }
      if (initObj.hasOwnProperty('mode')) {
        this.mode = initObj.mode
      }
      else {
        this.mode = '';
      }
      if (initObj.hasOwnProperty('odom_valid')) {
        this.odom_valid = initObj.odom_valid
      }
      else {
        this.odom_valid = false;
      }
      if (initObj.hasOwnProperty('time_from_start')) {
        this.time_from_start = initObj.time_from_start
      }
      else {
        this.time_from_start = 0.0;
      }
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('rel_alt')) {
        this.rel_alt = initObj.rel_alt
      }
      else {
        this.rel_alt = 0.0;
      }
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('attitude')) {
        this.attitude = initObj.attitude
      }
      else {
        this.attitude = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('attitude_q')) {
        this.attitude_q = initObj.attitude_q
      }
      else {
        this.attitude_q = new geometry_msgs.msg.Quaternion();
      }
      if (initObj.hasOwnProperty('attitude_rate')) {
        this.attitude_rate = initObj.attitude_rate
      }
      else {
        this.attitude_rate = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('battery_state')) {
        this.battery_state = initObj.battery_state
      }
      else {
        this.battery_state = 0.0;
      }
      if (initObj.hasOwnProperty('uav_id')) {
        this.uav_id = initObj.uav_id
      }
      else {
        this.uav_id = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DroneState
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [connected]
    bufferOffset = _serializer.bool(obj.connected, buffer, bufferOffset);
    // Serialize message field [armed]
    bufferOffset = _serializer.bool(obj.armed, buffer, bufferOffset);
    // Serialize message field [landed]
    bufferOffset = _serializer.bool(obj.landed, buffer, bufferOffset);
    // Serialize message field [mode]
    bufferOffset = _serializer.string(obj.mode, buffer, bufferOffset);
    // Serialize message field [odom_valid]
    bufferOffset = _serializer.bool(obj.odom_valid, buffer, bufferOffset);
    // Serialize message field [time_from_start]
    bufferOffset = _serializer.float32(obj.time_from_start, buffer, bufferOffset);
    // Check that the constant length array field [position] has the right length
    if (obj.position.length !== 3) {
      throw new Error('Unable to serialize array field position - length must be 3')
    }
    // Serialize message field [position]
    bufferOffset = _arraySerializer.float32(obj.position, buffer, bufferOffset, 3);
    // Serialize message field [rel_alt]
    bufferOffset = _serializer.float32(obj.rel_alt, buffer, bufferOffset);
    // Check that the constant length array field [velocity] has the right length
    if (obj.velocity.length !== 3) {
      throw new Error('Unable to serialize array field velocity - length must be 3')
    }
    // Serialize message field [velocity]
    bufferOffset = _arraySerializer.float32(obj.velocity, buffer, bufferOffset, 3);
    // Check that the constant length array field [attitude] has the right length
    if (obj.attitude.length !== 3) {
      throw new Error('Unable to serialize array field attitude - length must be 3')
    }
    // Serialize message field [attitude]
    bufferOffset = _arraySerializer.float32(obj.attitude, buffer, bufferOffset, 3);
    // Serialize message field [attitude_q]
    bufferOffset = geometry_msgs.msg.Quaternion.serialize(obj.attitude_q, buffer, bufferOffset);
    // Check that the constant length array field [attitude_rate] has the right length
    if (obj.attitude_rate.length !== 3) {
      throw new Error('Unable to serialize array field attitude_rate - length must be 3')
    }
    // Serialize message field [attitude_rate]
    bufferOffset = _arraySerializer.float32(obj.attitude_rate, buffer, bufferOffset, 3);
    // Serialize message field [battery_state]
    bufferOffset = _serializer.float32(obj.battery_state, buffer, bufferOffset);
    // Serialize message field [uav_id]
    bufferOffset = _serializer.int32(obj.uav_id, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DroneState
    let len;
    let data = new DroneState(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [connected]
    data.connected = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [armed]
    data.armed = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [landed]
    data.landed = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [mode]
    data.mode = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [odom_valid]
    data.odom_valid = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [time_from_start]
    data.time_from_start = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [position]
    data.position = _arrayDeserializer.float32(buffer, bufferOffset, 3)
    // Deserialize message field [rel_alt]
    data.rel_alt = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [velocity]
    data.velocity = _arrayDeserializer.float32(buffer, bufferOffset, 3)
    // Deserialize message field [attitude]
    data.attitude = _arrayDeserializer.float32(buffer, bufferOffset, 3)
    // Deserialize message field [attitude_q]
    data.attitude_q = geometry_msgs.msg.Quaternion.deserialize(buffer, bufferOffset);
    // Deserialize message field [attitude_rate]
    data.attitude_rate = _arrayDeserializer.float32(buffer, bufferOffset, 3)
    // Deserialize message field [battery_state]
    data.battery_state = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [uav_id]
    data.uav_id = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += object.mode.length;
    return length + 104;
  }

  static datatype() {
    // Returns string type for a message object
    return 'prometheus_msgs/DroneState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '72d6b80a24c6e84574785458feec57ce';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    
    ## 机载电脑是否连接上飞控，true已连接，false则不是
    bool connected
    ## 是否解锁，true为已解锁，false则不是
    bool armed
    ## 是否降落，true为已降落，false则代表在空中
    bool landed
    ## PX4飞控当前飞行模式
    string mode
    bool odom_valid
    
    ## 系统启动时间
    float32 time_from_start             ## [s]
    
    ## 无人机状态量：位置、速度、姿态
    float32[3] position                 ## [m]
    float32  rel_alt                               ## [m] only for outdoor
    float32[3] velocity                 ## [m/s]
    float32[3] attitude                 ## [rad]
    geometry_msgs/Quaternion attitude_q ## 四元数
    float32[3] attitude_rate            ## [rad/s]
    float32 battery_state               ## 电池状态    #float32
    
    ## XXX implemented
    int32 uav_id ## 无人机id
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DroneState(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.connected !== undefined) {
      resolved.connected = msg.connected;
    }
    else {
      resolved.connected = false
    }

    if (msg.armed !== undefined) {
      resolved.armed = msg.armed;
    }
    else {
      resolved.armed = false
    }

    if (msg.landed !== undefined) {
      resolved.landed = msg.landed;
    }
    else {
      resolved.landed = false
    }

    if (msg.mode !== undefined) {
      resolved.mode = msg.mode;
    }
    else {
      resolved.mode = ''
    }

    if (msg.odom_valid !== undefined) {
      resolved.odom_valid = msg.odom_valid;
    }
    else {
      resolved.odom_valid = false
    }

    if (msg.time_from_start !== undefined) {
      resolved.time_from_start = msg.time_from_start;
    }
    else {
      resolved.time_from_start = 0.0
    }

    if (msg.position !== undefined) {
      resolved.position = msg.position;
    }
    else {
      resolved.position = new Array(3).fill(0)
    }

    if (msg.rel_alt !== undefined) {
      resolved.rel_alt = msg.rel_alt;
    }
    else {
      resolved.rel_alt = 0.0
    }

    if (msg.velocity !== undefined) {
      resolved.velocity = msg.velocity;
    }
    else {
      resolved.velocity = new Array(3).fill(0)
    }

    if (msg.attitude !== undefined) {
      resolved.attitude = msg.attitude;
    }
    else {
      resolved.attitude = new Array(3).fill(0)
    }

    if (msg.attitude_q !== undefined) {
      resolved.attitude_q = geometry_msgs.msg.Quaternion.Resolve(msg.attitude_q)
    }
    else {
      resolved.attitude_q = new geometry_msgs.msg.Quaternion()
    }

    if (msg.attitude_rate !== undefined) {
      resolved.attitude_rate = msg.attitude_rate;
    }
    else {
      resolved.attitude_rate = new Array(3).fill(0)
    }

    if (msg.battery_state !== undefined) {
      resolved.battery_state = msg.battery_state;
    }
    else {
      resolved.battery_state = 0.0
    }

    if (msg.uav_id !== undefined) {
      resolved.uav_id = msg.uav_id;
    }
    else {
      resolved.uav_id = 0
    }

    return resolved;
    }
};

module.exports = DroneState;
