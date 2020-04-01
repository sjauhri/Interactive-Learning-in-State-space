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

class ControlMode {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ControlMode
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ControlMode
    let len;
    let data = new ControlMode(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a message object
    return 'iiwa_msgs/ControlMode';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fbf6f4c74f01882c27df4152be6af2d9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 POSITION_CONTROL = 0
    int32 JOINT_IMPEDANCE =  1
    int32 CARTESIAN_IMPEDANCE = 2
    int32 DESIRED_FORCE = 3
    int32 SINE_PATTERN = 4
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ControlMode(null);
    return resolved;
    }
};

// Constants for message
ControlMode.Constants = {
  POSITION_CONTROL: 0,
  JOINT_IMPEDANCE: 1,
  CARTESIAN_IMPEDANCE: 2,
  DESIRED_FORCE: 3,
  SINE_PATTERN: 4,
}

module.exports = ControlMode;
