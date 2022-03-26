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

class StatisticiansParchment {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.total_functional_uav = null;
      this.Sx = null;
      this.Sy = null;
      this.Sz = null;
      this.Sw = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('total_functional_uav')) {
        this.total_functional_uav = initObj.total_functional_uav
      }
      else {
        this.total_functional_uav = 0;
      }
      if (initObj.hasOwnProperty('Sx')) {
        this.Sx = initObj.Sx
      }
      else {
        this.Sx = 0;
      }
      if (initObj.hasOwnProperty('Sy')) {
        this.Sy = initObj.Sy
      }
      else {
        this.Sy = 0;
      }
      if (initObj.hasOwnProperty('Sz')) {
        this.Sz = initObj.Sz
      }
      else {
        this.Sz = 0;
      }
      if (initObj.hasOwnProperty('Sw')) {
        this.Sw = initObj.Sw
      }
      else {
        this.Sw = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type StatisticiansParchment
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [total_functional_uav]
    bufferOffset = _serializer.int32(obj.total_functional_uav, buffer, bufferOffset);
    // Serialize message field [Sx]
    bufferOffset = _serializer.int32(obj.Sx, buffer, bufferOffset);
    // Serialize message field [Sy]
    bufferOffset = _serializer.int32(obj.Sy, buffer, bufferOffset);
    // Serialize message field [Sz]
    bufferOffset = _serializer.int32(obj.Sz, buffer, bufferOffset);
    // Serialize message field [Sw]
    bufferOffset = _serializer.int32(obj.Sw, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type StatisticiansParchment
    let len;
    let data = new StatisticiansParchment(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [total_functional_uav]
    data.total_functional_uav = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [Sx]
    data.Sx = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [Sy]
    data.Sy = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [Sz]
    data.Sz = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [Sw]
    data.Sw = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'prometheus_msgs/StatisticiansParchment';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '50df0b7bd2a7cbd006c92bd5f716afd5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #this message is for the statistician node to transmit processed data to the statisticians_scribble node
    std_msgs/Header header
    
    int32 total_functional_uav
    int32 Sx #num of committed to current best
    int32 Sy #committed to prev best
    int32 Sz #polling
    int32 Sw #others
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
    const resolved = new StatisticiansParchment(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.total_functional_uav !== undefined) {
      resolved.total_functional_uav = msg.total_functional_uav;
    }
    else {
      resolved.total_functional_uav = 0
    }

    if (msg.Sx !== undefined) {
      resolved.Sx = msg.Sx;
    }
    else {
      resolved.Sx = 0
    }

    if (msg.Sy !== undefined) {
      resolved.Sy = msg.Sy;
    }
    else {
      resolved.Sy = 0
    }

    if (msg.Sz !== undefined) {
      resolved.Sz = msg.Sz;
    }
    else {
      resolved.Sz = 0
    }

    if (msg.Sw !== undefined) {
      resolved.Sw = msg.Sw;
    }
    else {
      resolved.Sw = 0
    }

    return resolved;
    }
};

module.exports = StatisticiansParchment;
