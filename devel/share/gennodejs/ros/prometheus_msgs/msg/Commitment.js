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

class Commitment {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.uav_id = null;
      this.commitmentState = null;
      this.sitePos = null;
      this.quality = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('uav_id')) {
        this.uav_id = initObj.uav_id
      }
      else {
        this.uav_id = 0;
      }
      if (initObj.hasOwnProperty('commitmentState')) {
        this.commitmentState = initObj.commitmentState
      }
      else {
        this.commitmentState = 0;
      }
      if (initObj.hasOwnProperty('sitePos')) {
        this.sitePos = initObj.sitePos
      }
      else {
        this.sitePos = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('quality')) {
        this.quality = initObj.quality
      }
      else {
        this.quality = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Commitment
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [uav_id]
    bufferOffset = _serializer.int32(obj.uav_id, buffer, bufferOffset);
    // Serialize message field [commitmentState]
    bufferOffset = _serializer.int32(obj.commitmentState, buffer, bufferOffset);
    // Check that the constant length array field [sitePos] has the right length
    if (obj.sitePos.length !== 3) {
      throw new Error('Unable to serialize array field sitePos - length must be 3')
    }
    // Serialize message field [sitePos]
    bufferOffset = _arraySerializer.float32(obj.sitePos, buffer, bufferOffset, 3);
    // Serialize message field [quality]
    bufferOffset = _serializer.float32(obj.quality, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Commitment
    let len;
    let data = new Commitment(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [uav_id]
    data.uav_id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [commitmentState]
    data.commitmentState = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [sitePos]
    data.sitePos = _arrayDeserializer.float32(buffer, bufferOffset, 3)
    // Deserialize message field [quality]
    data.quality = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'prometheus_msgs/Commitment';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '29a5733d98998434ae7ab271018dc948';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    
    ## XXX implemented
    int32 uav_id ## 无人机id
    
    int32 commitmentState ## 无人机commitment_state
    float32[3] sitePos ## L_m
    float32 quality ## q_m
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
    const resolved = new Commitment(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.uav_id !== undefined) {
      resolved.uav_id = msg.uav_id;
    }
    else {
      resolved.uav_id = 0
    }

    if (msg.commitmentState !== undefined) {
      resolved.commitmentState = msg.commitmentState;
    }
    else {
      resolved.commitmentState = 0
    }

    if (msg.sitePos !== undefined) {
      resolved.sitePos = msg.sitePos;
    }
    else {
      resolved.sitePos = new Array(3).fill(0)
    }

    if (msg.quality !== undefined) {
      resolved.quality = msg.quality;
    }
    else {
      resolved.quality = 0.0
    }

    return resolved;
    }
};

module.exports = Commitment;
