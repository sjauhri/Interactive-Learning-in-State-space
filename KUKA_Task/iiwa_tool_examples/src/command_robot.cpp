#include <iiwa_ros.h>
#include <cmath>

// getTimeToDestination() can also return negative values and the info from the cabinet take some milliseconds to update once the motion is started.
// That means that if you call getTimeToDestination() right after you set a target pose, you might get the wrong info (e.g. a negative number).
// This function tried to call getTimeToDestination() until something meaningful is obtained or until a maximum amount of time passed.
void sleepForMotion(iiwa_ros::iiwaRos& iiwa, const double maxSleepTime) {
  double ttd = iiwa.getTimeToDestinationService().getTimeToDestination();
  ros::Time start_wait = ros::Time::now();
  while (ttd < 0.0 && (ros::Time::now() - start_wait) < ros::Duration(maxSleepTime)) {
    ros::Duration(0.5).sleep();
    ttd = iiwa.getTimeToDestinationService().getTimeToDestination();
  }
  if (ttd > 0.0) {
    ROS_INFO_STREAM("Sleeping for " << ttd << " seconds.");
    ros::Duration(ttd).sleep();
  } 
}

int main (int argc, char **argv) {
	
	// Initialize ROS
	ros::init(argc, argv, "CommandRobot");
	ros::NodeHandle nh("~");
	
	// ROS spinner.
	ros::AsyncSpinner spinner(1);
	spinner.start();
  
  iiwa_ros::iiwaRos my_iiwa;
  my_iiwa.init();
	
	// Dynamic parameters. Last arg is the default value. You can assign these from a launch file.
  bool use_cartesian_command;
	nh.param("use_cartesian_command", use_cartesian_command, true);
	
	// Dynamic parameter to choose the rate at wich this node should run
  double ros_rate;
	nh.param("ros_rate", ros_rate, 0.1); // 0.1 Hz = 10 seconds
	ros::Rate* loop_rate_ = new ros::Rate(ros_rate);
  
  geometry_msgs::PoseStamped command_cartesian_position;
  iiwa_msgs::JointPosition command_joint_position;
  bool new_pose = false, motion_done = false;
  
	int direction = 1;
	
	while (ros::ok()) {
    if (my_iiwa.getRobotIsConnected()) {
			
			if (use_cartesian_command) {
        while (!my_iiwa.getCartesianPose(command_cartesian_position)) {}
				// Here we set the new commanded cartesian position, we just move the tool TCP 10 centemeters down and back up, every 10 seconds.
				command_cartesian_position.pose.position.z -= direction * 0.10;
				my_iiwa.setCartesianPose(command_cartesian_position);				
			} else {
        while (!my_iiwa.getJointPosition(command_joint_position)) {}
        command_joint_position.position.a4 -= direction * 5 * M_PI / 180; // 0.0872665 // Adding/Subtracting 5 degrees (in radians) to the 4th joint
				my_iiwa.setJointPosition(command_joint_position);
			}
			
			sleepForMotion(my_iiwa, 2.0);
			
			direction *= -1; // In the next iteration the motion will be on the opposite direction
			
			loop_rate_->sleep(); // Sleep for some millisecond. The while loop will run every 10 seconds in this example.
		}
		else {
			ROS_WARN_STREAM("Robot is not connected...");
			ros::Duration(5.0).sleep(); // 5 seconds
		}
	}	
}; 