
"use strict";

let SetPTPCartesianSpeedLimits = require('./SetPTPCartesianSpeedLimits.js')
let SetSpeedOverride = require('./SetSpeedOverride.js')
let SetWorkpiece = require('./SetWorkpiece.js')
let SetPTPJointSpeedLimits = require('./SetPTPJointSpeedLimits.js')
let SetSmartServoJointSpeedLimits = require('./SetSmartServoJointSpeedLimits.js')
let ConfigureControlMode = require('./ConfigureControlMode.js')
let SetEndpointFrame = require('./SetEndpointFrame.js')
let TimeToDestination = require('./TimeToDestination.js')
let SetSmartServoLinSpeedLimits = require('./SetSmartServoLinSpeedLimits.js')

module.exports = {
  SetPTPCartesianSpeedLimits: SetPTPCartesianSpeedLimits,
  SetSpeedOverride: SetSpeedOverride,
  SetWorkpiece: SetWorkpiece,
  SetPTPJointSpeedLimits: SetPTPJointSpeedLimits,
  SetSmartServoJointSpeedLimits: SetSmartServoJointSpeedLimits,
  ConfigureControlMode: ConfigureControlMode,
  SetEndpointFrame: SetEndpointFrame,
  TimeToDestination: TimeToDestination,
  SetSmartServoLinSpeedLimits: SetSmartServoLinSpeedLimits,
};
