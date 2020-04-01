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

class SinePatternControlMode {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.cartesian_dof = null;
      this.frequency = null;
      this.amplitude = null;
      this.stiffness = null;
    }
    else {
      if (initObj.hasOwnProperty('cartesian_dof')) {
        this.cartesian_dof = initObj.cartesian_dof
      }
      else {
        this.cartesian_dof = 0;
      }
      if (initObj.hasOwnProperty('frequency')) {
        this.frequency = initObj.frequency
      }
      else {
        this.frequency = 0.0;
      }
      if (initObj.hasOwnProperty('amplitude')) {
        this.amplitude = initObj.amplitude
      }
      else {
        this.amplitude = 0.0;
      }
      if (initObj.hasOwnProperty('stiffness')) {
        this.stiffness = initObj.stiffness
      }
      else {
        this.stiffness = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SinePatternControlMode
    // Serialize message field [cartesian_dof]
    bufferOffset = _serializer.int32(obj.cartesian_dof, buffer, bufferOffset);
    // Serialize message field [frequency]
    bufferOffset = _serializer.float64(obj.frequency, buffer, bufferOffset);
    // Serialize message field [amplitude]
    bufferOffset = _serializer.float64(obj.amplitude, buffer, bufferOffset);
    // Serialize message field [stiffness]
    bufferOffset = _serializer.float64(obj.stiffness, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SinePatternControlMode
    let len;
    let data = new SinePatternControlMode(null);
    // Deserialize message field [cartesian_dof]
    data.cartesian_dof = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [frequency]
    data.frequency = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [amplitude]
    data.amplitude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [stiffness]
    data.stiffness = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 28;
  }

  static datatype() {
    // Returns string type for a message object
    return 'iiwa_msgs/SinePatternControlMode';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e72785e47bec423cb99a63dd32ae2a54';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # The degree of freedom for performing the sine oscillation.
    int32 cartesian_dof
    
    # The value of the frequency for the sine oscillation [Hz].
    float64 frequency
    
    # The value of the amplitude. In [N].
    float64 amplitude
    
    # The value of the stiffness. In [N/m].
    float64 stiffness
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SinePatternControlMode(null);
    if (msg.cartesian_dof !== undefined) {
      resolved.cartesian_dof = msg.cartesian_dof;
    }
    else {
      resolved.cartesian_dof = 0
    }

    if (msg.frequency !== undefined) {
      resolved.frequency = msg.frequency;
    }
    else {
      resolved.frequency = 0.0
    }

    if (msg.amplitude !== undefined) {
      resolved.amplitude = msg.amplitude;
    }
    else {
      resolved.amplitude = 0.0
    }

    if (msg.stiffness !== undefined) {
      resolved.stiffness = msg.stiffness;
    }
    else {
      resolved.stiffness = 0.0
    }

    return resolved;
    }
};

module.exports = SinePatternControlMode;
