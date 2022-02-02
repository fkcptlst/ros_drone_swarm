// Auto-generated. Do not edit!

// (in-package prometheus_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class SwarmCommandGround {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.Command_ID = null;
      this.source = null;
      this.All_Offboard_Control_Flg = null;
      this.Mode = null;
      this.swarm_shape = null;
      this.Move_mode = null;
      this.swarm_size = null;
      this.position_ref = null;
      this.velocity_ref = null;
      this.acceleration_ref = null;
      this.yaw_ref = null;
      this.yaw_rate_ref = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('Command_ID')) {
        this.Command_ID = initObj.Command_ID
      }
      else {
        this.Command_ID = 0;
      }
      if (initObj.hasOwnProperty('source')) {
        this.source = initObj.source
      }
      else {
        this.source = '';
      }
      if (initObj.hasOwnProperty('All_Offboard_Control_Flg')) {
        this.All_Offboard_Control_Flg = initObj.All_Offboard_Control_Flg
      }
      else {
        this.All_Offboard_Control_Flg = false;
      }
      if (initObj.hasOwnProperty('Mode')) {
        this.Mode = initObj.Mode
      }
      else {
        this.Mode = 0;
      }
      if (initObj.hasOwnProperty('swarm_shape')) {
        this.swarm_shape = initObj.swarm_shape
      }
      else {
        this.swarm_shape = 0;
      }
      if (initObj.hasOwnProperty('Move_mode')) {
        this.Move_mode = initObj.Move_mode
      }
      else {
        this.Move_mode = 0;
      }
      if (initObj.hasOwnProperty('swarm_size')) {
        this.swarm_size = initObj.swarm_size
      }
      else {
        this.swarm_size = 0.0;
      }
      if (initObj.hasOwnProperty('position_ref')) {
        this.position_ref = initObj.position_ref
      }
      else {
        this.position_ref = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('velocity_ref')) {
        this.velocity_ref = initObj.velocity_ref
      }
      else {
        this.velocity_ref = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('acceleration_ref')) {
        this.acceleration_ref = initObj.acceleration_ref
      }
      else {
        this.acceleration_ref = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('yaw_ref')) {
        this.yaw_ref = initObj.yaw_ref
      }
      else {
        this.yaw_ref = 0.0;
      }
      if (initObj.hasOwnProperty('yaw_rate_ref')) {
        this.yaw_rate_ref = initObj.yaw_rate_ref
      }
      else {
        this.yaw_rate_ref = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SwarmCommandGround
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [Command_ID]
    bufferOffset = _serializer.uint32(obj.Command_ID, buffer, bufferOffset);
    // Serialize message field [source]
    bufferOffset = _serializer.string(obj.source, buffer, bufferOffset);
    // Serialize message field [All_Offboard_Control_Flg]
    bufferOffset = _serializer.bool(obj.All_Offboard_Control_Flg, buffer, bufferOffset);
    // Serialize message field [Mode]
    bufferOffset = _serializer.uint8(obj.Mode, buffer, bufferOffset);
    // Serialize message field [swarm_shape]
    bufferOffset = _serializer.uint8(obj.swarm_shape, buffer, bufferOffset);
    // Serialize message field [Move_mode]
    bufferOffset = _serializer.uint8(obj.Move_mode, buffer, bufferOffset);
    // Serialize message field [swarm_size]
    bufferOffset = _serializer.float32(obj.swarm_size, buffer, bufferOffset);
    // Check that the constant length array field [position_ref] has the right length
    if (obj.position_ref.length !== 3) {
      throw new Error('Unable to serialize array field position_ref - length must be 3')
    }
    // Serialize message field [position_ref]
    bufferOffset = _arraySerializer.float32(obj.position_ref, buffer, bufferOffset, 3);
    // Check that the constant length array field [velocity_ref] has the right length
    if (obj.velocity_ref.length !== 3) {
      throw new Error('Unable to serialize array field velocity_ref - length must be 3')
    }
    // Serialize message field [velocity_ref]
    bufferOffset = _arraySerializer.float32(obj.velocity_ref, buffer, bufferOffset, 3);
    // Check that the constant length array field [acceleration_ref] has the right length
    if (obj.acceleration_ref.length !== 3) {
      throw new Error('Unable to serialize array field acceleration_ref - length must be 3')
    }
    // Serialize message field [acceleration_ref]
    bufferOffset = _arraySerializer.float32(obj.acceleration_ref, buffer, bufferOffset, 3);
    // Serialize message field [yaw_ref]
    bufferOffset = _serializer.float32(obj.yaw_ref, buffer, bufferOffset);
    // Serialize message field [yaw_rate_ref]
    bufferOffset = _serializer.float32(obj.yaw_rate_ref, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SwarmCommandGround
    let len;
    let data = new SwarmCommandGround(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [Command_ID]
    data.Command_ID = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [source]
    data.source = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [All_Offboard_Control_Flg]
    data.All_Offboard_Control_Flg = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [Mode]
    data.Mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [swarm_shape]
    data.swarm_shape = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Move_mode]
    data.Move_mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [swarm_size]
    data.swarm_size = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [position_ref]
    data.position_ref = _arrayDeserializer.float32(buffer, bufferOffset, 3)
    // Deserialize message field [velocity_ref]
    data.velocity_ref = _arrayDeserializer.float32(buffer, bufferOffset, 3)
    // Deserialize message field [acceleration_ref]
    data.acceleration_ref = _arrayDeserializer.float32(buffer, bufferOffset, 3)
    // Deserialize message field [yaw_ref]
    data.yaw_ref = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yaw_rate_ref]
    data.yaw_rate_ref = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += object.source.length;
    return length + 60;
  }

  static datatype() {
    // Returns string type for a message object
    return 'prometheus_msgs/SwarmCommandGround';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bcde920b51ed64de69265b8e65e78836';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    
    ## 控制命令的编号 防止接收到错误命令， 编号应该逐次递加
    uint32 Command_ID
    
    ## 消息来源
    string source
    
    ##控制所有活动切换为offboard的flg
    bool All_Offboard_Control_Flg
    
    ## 控制命令的模式 
    uint8 Mode
    # enum Mode 控制模式枚举
    uint8 Idle=0
    uint8 Takeoff=1
    uint8 Hold=2
    uint8 Land=3
    uint8 Disarm=4
    uint8 Position_Control=5
    uint8 Velocity_Control=6
    uint8 Accel_Control=7
    uint8 Move=8
    uint8 User_Mode1=9
    
    ## 控制参考量 
    uint8 swarm_shape
    
    uint8 One_column=0
    uint8 Triangle=1
    uint8 Square=2
    uint8 Circular=3
    
    ## 默认为 XYZ位置追踪模式 （sub_mode = 0）； 速度追踪启用时，控制器不考虑位置参考量及位置状态反馈
    uint8 Move_mode
    
    uint8 XYZ_POS      = 0  ##0b00
    uint8 XY_POS_Z_VEL = 1  ##0b01
    uint8 XY_VEL_Z_POS = 2  ##0b10
    uint8 XYZ_VEL = 3       ##0b11
    uint8 XYZ_ACC = 4
    uint8 TRAJECTORY   = 5 
    uint8 XYZ_POS_BODY = 6  
    uint8 XYZ_VEL_BODY = 7
    uint8 XY_VEL_Z_POS_BODY = 8
    
    float32 swarm_size
    
    float32[3] position_ref          ## [m]
    float32[3] velocity_ref          ## [m]
    float32[3] acceleration_ref
    float32 yaw_ref                  ## [rad]
    float32 yaw_rate_ref
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SwarmCommandGround(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.Command_ID !== undefined) {
      resolved.Command_ID = msg.Command_ID;
    }
    else {
      resolved.Command_ID = 0
    }

    if (msg.source !== undefined) {
      resolved.source = msg.source;
    }
    else {
      resolved.source = ''
    }

    if (msg.All_Offboard_Control_Flg !== undefined) {
      resolved.All_Offboard_Control_Flg = msg.All_Offboard_Control_Flg;
    }
    else {
      resolved.All_Offboard_Control_Flg = false
    }

    if (msg.Mode !== undefined) {
      resolved.Mode = msg.Mode;
    }
    else {
      resolved.Mode = 0
    }

    if (msg.swarm_shape !== undefined) {
      resolved.swarm_shape = msg.swarm_shape;
    }
    else {
      resolved.swarm_shape = 0
    }

    if (msg.Move_mode !== undefined) {
      resolved.Move_mode = msg.Move_mode;
    }
    else {
      resolved.Move_mode = 0
    }

    if (msg.swarm_size !== undefined) {
      resolved.swarm_size = msg.swarm_size;
    }
    else {
      resolved.swarm_size = 0.0
    }

    if (msg.position_ref !== undefined) {
      resolved.position_ref = msg.position_ref;
    }
    else {
      resolved.position_ref = new Array(3).fill(0)
    }

    if (msg.velocity_ref !== undefined) {
      resolved.velocity_ref = msg.velocity_ref;
    }
    else {
      resolved.velocity_ref = new Array(3).fill(0)
    }

    if (msg.acceleration_ref !== undefined) {
      resolved.acceleration_ref = msg.acceleration_ref;
    }
    else {
      resolved.acceleration_ref = new Array(3).fill(0)
    }

    if (msg.yaw_ref !== undefined) {
      resolved.yaw_ref = msg.yaw_ref;
    }
    else {
      resolved.yaw_ref = 0.0
    }

    if (msg.yaw_rate_ref !== undefined) {
      resolved.yaw_rate_ref = msg.yaw_rate_ref;
    }
    else {
      resolved.yaw_rate_ref = 0.0
    }

    return resolved;
    }
};

// Constants for message
SwarmCommandGround.Constants = {
  IDLE: 0,
  TAKEOFF: 1,
  HOLD: 2,
  LAND: 3,
  DISARM: 4,
  POSITION_CONTROL: 5,
  VELOCITY_CONTROL: 6,
  ACCEL_CONTROL: 7,
  MOVE: 8,
  USER_MODE1: 9,
  ONE_COLUMN: 0,
  TRIANGLE: 1,
  SQUARE: 2,
  CIRCULAR: 3,
  XYZ_POS: 0,
  XY_POS_Z_VEL: 1,
  XY_VEL_Z_POS: 2,
  XYZ_VEL: 3,
  XYZ_ACC: 4,
  TRAJECTORY: 5,
  XYZ_POS_BODY: 6,
  XYZ_VEL_BODY: 7,
  XY_VEL_Z_POS_BODY: 8,
}

module.exports = SwarmCommandGround;
