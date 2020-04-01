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

class SetWorkpieceRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.workpiece_id = null;
    }
    else {
      if (initObj.hasOwnProperty('workpiece_id')) {
        this.workpiece_id = initObj.workpiece_id
      }
      else {
        this.workpiece_id = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetWorkpieceRequest
    // Serialize message field [workpiece_id]
    bufferOffset = _serializer.string(obj.workpiece_id, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetWorkpieceRequest
    let len;
    let data = new SetWorkpieceRequest(null);
    // Deserialize message field [workpiece_id]
    data.workpiece_id = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.workpiece_id.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'iiwa_msgs/SetWorkpieceRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0157a464cf6d49c977a614271ab236bf';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    
    
    string workpiece_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetWorkpieceRequest(null);
    if (msg.workpiece_id !== undefined) {
      resolved.workpiece_id = msg.workpiece_id;
    }
    else {
      resolved.workpiece_id = ''
    }

    return resolved;
    }
};

class SetWorkpieceResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
      this.error = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
      if (initObj.hasOwnProperty('error')) {
        this.error = initObj.error
      }
      else {
        this.error = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetWorkpieceResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [error]
    bufferOffset = _serializer.string(obj.error, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetWorkpieceResponse
    let len;
    let data = new SetWorkpieceResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [error]
    data.error = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.error.length;
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'iiwa_msgs/SetWorkpieceResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '45872d25d65c97743cc71afc6d4e884d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    string error
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetWorkpieceResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    if (msg.error !== undefined) {
      resolved.error = msg.error;
    }
    else {
      resolved.error = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: SetWorkpieceRequest,
  Response: SetWorkpieceResponse,
  md5sum() { return '63c849990571529ad5b5c1483c88f899'; },
  datatype() { return 'iiwa_msgs/SetWorkpiece'; }
};
