// Auto-generated. Do not edit!

// (in-package iiwa_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let RedundancyInformation = require('./RedundancyInformation.js');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class CartesianPose {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.poseStamped = null;
      this.redundancy = null;
    }
    else {
      if (initObj.hasOwnProperty('poseStamped')) {
        this.poseStamped = initObj.poseStamped
      }
      else {
        this.poseStamped = new geometry_msgs.msg.PoseStamped();
      }
      if (initObj.hasOwnProperty('redundancy')) {
        this.redundancy = initObj.redundancy
      }
      else {
        this.redundancy = new RedundancyInformation();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CartesianPose
    // Serialize message field [poseStamped]
    bufferOffset = geometry_msgs.msg.PoseStamped.serialize(obj.poseStamped, buffer, bufferOffset);
    // Serialize message field [redundancy]
    bufferOffset = RedundancyInformation.serialize(obj.redundancy, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CartesianPose
    let len;
    let data = new CartesianPose(null);
    // Deserialize message field [poseStamped]
    data.poseStamped = geometry_msgs.msg.PoseStamped.deserialize(buffer, bufferOffset);
    // Deserialize message field [redundancy]
    data.redundancy = RedundancyInformation.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += geometry_msgs.msg.PoseStamped.getMessageSize(object.poseStamped);
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'iiwa_msgs/CartesianPose';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '92a9835b358c99d9efbecb11c25db23d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Target Pose including redundancy information.
    geometry_msgs/PoseStamped poseStamped
    
    # If you have issues with the robot not executing the motion copy this value from the Cartesian Position Tab of the
    # robot SmartPad. Set both parameters to -1 to disable them.
    RedundancyInformation redundancy
    
    ================================================================================
    MSG: geometry_msgs/PoseStamped
    # A Pose with reference coordinate frame and timestamp
    Header header
    Pose pose
    
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
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    ================================================================================
    MSG: iiwa_msgs/RedundancyInformation
    # E1 parameter
    # Specifies Angle of the elbow joint.
    float64 e1
    
    # Status parameter
    #   Bit 0: 1 - The robot is working above its head
    #          0 - The robot is working in the ground area
    #   Bit 1: 1 - Angle A4 < 0°
    #          0 - Angle A4 >= 0°
    #   Bit 2: 1 - Angle A6 <= 0
    #          0 - Angle A6 > 0
    int32 status
    
    # Turn parameter
    # According to Sunrise handbook this is not used for the iiwa.
    int32 turn
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CartesianPose(null);
    if (msg.poseStamped !== undefined) {
      resolved.poseStamped = geometry_msgs.msg.PoseStamped.Resolve(msg.poseStamped)
    }
    else {
      resolved.poseStamped = new geometry_msgs.msg.PoseStamped()
    }

    if (msg.redundancy !== undefined) {
      resolved.redundancy = RedundancyInformation.Resolve(msg.redundancy)
    }
    else {
      resolved.redundancy = new RedundancyInformation()
    }

    return resolved;
    }
};

module.exports = CartesianPose;
