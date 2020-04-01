// Auto-generated. Do not edit!

// (in-package iiwa_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class TimeToDestinationRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TimeToDestinationRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TimeToDestinationRequest
    let len;
    let data = new TimeToDestinationRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'iiwa_msgs/TimeToDestinationRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TimeToDestinationRequest(null);
    return resolved;
    }
};

class TimeToDestinationResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.remaining_time = null;
    }
    else {
      if (initObj.hasOwnProperty('remaining_time')) {
        this.remaining_time = initObj.remaining_time
      }
      else {
        this.remaining_time = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TimeToDestinationResponse
    // Serialize message field [remaining_time]
    bufferOffset = _serializer.float64(obj.remaining_time, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TimeToDestinationResponse
    let len;
    let data = new TimeToDestinationResponse(null);
    // Deserialize message field [remaining_time]
    data.remaining_time = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'iiwa_msgs/TimeToDestinationResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b71b59cce98847d0bd0310eb052e8f3f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 remaining_time
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TimeToDestinationResponse(null);
    if (msg.remaining_time !== undefined) {
      resolved.remaining_time = msg.remaining_time;
    }
    else {
      resolved.remaining_time = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: TimeToDestinationRequest,
  Response: TimeToDestinationResponse,
  md5sum() { return 'b71b59cce98847d0bd0310eb052e8f3f'; },
  datatype() { return 'iiwa_msgs/TimeToDestination'; }
};
