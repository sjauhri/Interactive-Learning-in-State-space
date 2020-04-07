#include <iiwa_ros.h>
#include <iiwa_ros/conversions.h>

int main (int argc, char **argv) {
  
  // Initialize ROS
  ros::init(argc, argv, "ControlMode");
  ros::NodeHandle nh("~");
  
  // ROS spinner.
  ros::AsyncSpinner spinner(1);
  spinner.start();
  
  iiwa_ros::iiwaRos my_iiwa;
  my_iiwa.init();
   
  // Dynamic parameter to choose the rate at wich this node should run
  double ros_rate = 0.1;
  nh.param("ros_rate", ros_rate, 0.1); // 0.1 Hz = 10 seconds
  ros::Rate* loop_rate_ = new ros::Rate(ros_rate);  
  
  bool job_done = true;
  
  while (job_done && ros::ok()) {
    if (my_iiwa.getRobotIsConnected()) {
      
      ROS_INFO_STREAM("The robot will be now set in Cartesian Impedance Mode");
      // Low stiffness only along Z.
      my_iiwa.getSmartServoService().setCartesianImpedanceMode(iiwa_ros::cartesianQuantityFromDouble(1500,1500,350,300,300,300), iiwa_ros::cartesianQuantityFromDouble(0.7));
      ROS_INFO_STREAM("In 20 seconds the robot will go back to Position Control Mode");
      ros::Duration(20.0).sleep();
      
      my_iiwa.getSmartServoService().setPositionControlMode();
      ROS_INFO_STREAM("In 20 seconds the robot will be set in Joint Impedance Mode");
      ros::Duration(20.0).sleep();
      
      // Low stiffness only for the 6th joint.
      my_iiwa.getSmartServoService().setJointImpedanceMode(iiwa_ros::jointQuantityFromDouble(1500,1500,1500,1500,1500,0,1500), iiwa_ros::jointQuantityFromDouble(0.7));
      ROS_INFO_STREAM("In 20 seconds the robot will go back to Position Control Mode");
      ros::Duration(20.0).sleep();
      
      my_iiwa.getSmartServoService().setPositionControlMode();
      
      ROS_INFO_STREAM("Job done! Shutting down...");
      job_done = false;
    }
    else {
      ROS_ERROR_STREAM("Robot is not connected...");
      ros::Duration(5.0).sleep(); // 5 seconds
    }
  }
  
}; 