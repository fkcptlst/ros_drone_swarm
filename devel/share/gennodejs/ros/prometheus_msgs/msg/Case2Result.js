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

class Case2Result {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.detected = null;
      this.moving_target = null;
      this.enu_position = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('detected')) {
        this.detected = initObj.detected
      }
      else {
        this.detected = false;
      }
      if (initObj.hasOwnProperty('moving_target')) {
        this.moving_target = initObj.moving_target
      }
      else {
        this.moving_target = false;
      }
      if (initObj.hasOwnProperty('enu_position')) {
        this.enu_position = initObj.enu_position
      }
      else {
        this.enu_position = new Array(3).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Case2Result
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [detected]
    bufferOffset = _serializer.bool(obj.detected, buffer, bufferOffset);
    // Serialize message field [moving_target]
    bufferOffset = _serializer.bool(obj.moving_target, buffer, bufferOffset);
    // Check that the constant length array field [enu_position] has the right length
    if (obj.enu_position.length !== 3) {
      throw new Error('Unable to serialize array field enu_position - length must be 3')
    }
    // Serialize message field [enu_position]
    bufferOffset = _arraySerializer.float32(obj.enu_position, buffer, bufferOffset, 3);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Case2Result
    let len;
    let data = new Case2Result(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [detected]
    data.detected = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [moving_target]
    data.moving_target = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [enu_position]
    data.enu_position = _arrayDeserializer.float32(buffer, bufferOffset, 3)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 14;
  }

  static datatype() {
    // Returns string type for a message object
    return 'prometheus_msgs/Case2Result';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '83bfbb05bea136ea934d7ed5f7e4bc96';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    
    ## 是否检测到标志位 
    bool detected
    
    bool moving_target
    
    ## 目标位置-全局坐标系-(x,y,z)
    float32[3] enu_position
    
    
    
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
    const resolved = new Case2Result(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.detected !== undefined) {
      resolved.detected = msg.detected;
    }
    else {
      resolved.detected = false
    }

    if (msg.moving_target !== undefined) {
      resolved.moving_target = msg.moving_target;
    }
    else {
      resolved.moving_target = false
    }

    if (msg.enu_position !== undefined) {
      resolved.enu_position = msg.enu_position;
    }
    else {
      resolved.enu_position = new Array(3).fill(0)
    }

    return resolved;
    }
};

module.exports = Case2Result;
