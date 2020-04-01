// Auto-generated. Do not edit!

// (in-package iiwa_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let CartesianPose = require('./CartesianPose.js');

//-----------------------------------------------------------

class SplineSegment {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.type = null;
      this.point = null;
      this.point_aux = null;
    }
    else {
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = 0;
      }
      if (initObj.hasOwnProperty('point')) {
        this.point = initObj.point
      }
      else {
        this.point = new CartesianPose();
      }
      if (initObj.hasOwnProperty('point_aux')) {
        this.point_aux = initObj.point_aux
      }
      else {
        this.point_aux = new CartesianPose();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SplineSegment
    // Serialize message field [type]
    bufferOffset = _serializer.int32(obj.type, buffer, bufferOffset);
    // Serialize message field [point]
    bufferOffset = CartesianPose.serialize(obj.point, buffer, bufferOffset);
    // Serialize message field [point_aux]
    bufferOffset = CartesianPose.serialize(obj.point_aux, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SplineSegment
    let len;
    let data = new SplineSegment(null);
    // Deserialize message field [type]
    data.type = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [point]
    data.point = CartesianPose.deserialize(buffer, bufferOffset);
    // Deserialize message field [point_aux]
    data.point_aux = CartesianPose.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += CartesianPose.getMessageSize(object.point);
    length += CartesianPose.getMessageSize(object.point_aux);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'iiwa_msgs/SplineSegment';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ac36e232cb478b25636a98607933811b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message describes a segment of a spline path
    
    int32 SPL = 0
    int32 LIN =  1
    int32 CIRC = 2
    
    # The type of the spline segment
    int32 type
    
    # The endpoint of the current segment
    CartesianPose point
    
    # Auxiliary point. Only used for circular segments
    CartesianPose point_aux
    ================================================================================
    MSG: iiwa_msgs/CartesianPose
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
    const resolved = new SplineSegment(null);
    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = 0
    }

    if (msg.point !== undefined) {
      resolved.point = CartesianPose.Resolve(msg.point)
    }
    else {
      resolved.point = new CartesianPose()
    }

    if (msg.point_aux !== undefined) {
      resolved.point_aux = CartesianPose.Resolve(msg.point_aux)
    }
    else {
      resolved.point_aux = new CartesianPose()
    }

    return resolved;
    }
};

// Constants for message
SplineSegment.Constants = {
  SPL: 0,
  LIN: 1,
  CIRC: 2,
}

module.exports = SplineSegment;
