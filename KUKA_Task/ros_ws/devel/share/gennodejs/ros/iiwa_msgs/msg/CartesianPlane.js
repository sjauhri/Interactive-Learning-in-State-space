// Auto-generated. Do not edit!

// (in-package iiwa_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class CartesianPlane {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CartesianPlane
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CartesianPlane
    let len;
    let data = new CartesianPlane(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a message object
    return 'iiwa_msgs/CartesianPlane';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '15617e8d13d4abd04145334685da37ba';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 XY = 1
    int32 XZ = 2
    int32 YZ = 3
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CartesianPlane(null);
    return resolved;
    }
};

// Constants for message
CartesianPlane.Constants = {
  XY: 1,
  XZ: 2,
  YZ: 3,
}

module.exports = CartesianPlane;
