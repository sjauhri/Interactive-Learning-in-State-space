#include "ros/ros.h"
#include "std_msgs/String.h"
#include "iiwa_msgs/JointPosition.h"
#include <iiwa_msgs/ConfigureControlMode.h>

#include "opencv2/opencv.hpp"
#include <opencv2/core/core.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui/highgui.hpp>

#include <sstream>
#include <iostream>
#include <fstream>
#include <vector>
#include <math.h> 
using namespace std;
using namespace cv;

int nDoF = 7;
vector<float> current_joint;

void plot()
{
  int width = 180, height = 100;
  Mat screen = Mat::zeros(height, width, CV_8UC3);
  screen = Scalar::all(255) - screen;
  imshow("target", screen);  
}

void chatterCallback(const iiwa_msgs::JointPosition::ConstPtr& msg)
{
  //ROS_INFO("Joint angle: [%f]", msg->position.a7);
  current_joint[0] = msg->position.a1;
  current_joint[1] = msg->position.a2;
  current_joint[2] = msg->position.a3;
  current_joint[3] = msg->position.a4;
  current_joint[4] = msg->position.a5;
  current_joint[5] = msg->position.a6;
  current_joint[6] = msg->position.a7;
}

void read_trajectory(ifstream &file, vector < vector <float> > &traj)
{
  vector <float> jointpoint,read;
  jointpoint.resize(nDoF);
  string line;
  while(getline(file,line))
  {
    read.push_back(::atof(line.c_str()));
  }
  for(int j=0; j<read.size()/nDoF; j++)
  {
    for(int i=0; i<nDoF; i++)
    {
      jointpoint[i] = read[i+(j*nDoF)];
    }
    traj.push_back(jointpoint);
  }
}

int main(int argc, char **argv)
{

  ros::init(argc, argv, "kine_teach");
  ros::NodeHandle n;
  current_joint.resize(nDoF);
  vector < vector <float> > traj;
  ifstream myFile("trajectory.txt");
  //ros::Publisher chatter_pub = n.advertise<std_msgs::String>("chatter", 1000);
  ros::Publisher jointP_pub = n.advertise<iiwa_msgs::JointPosition>("iiwa/command/JointPosition", 10);
  ros::Subscriber jointP_sub = n.subscribe("iiwa/state/JointPosition", 1, chatterCallback);
  ros::ServiceClient client = n.serviceClient<iiwa_msgs::ConfigureControlMode>("/iiwa/configuration/ConfigureControlMode");

/*  iiwa_msgs::ConfigureControlMode conf_srv;
//position control mode
  conf_srv.request.control_mode = 0;
  if (client.call(conf_srv))
  {
    ROS_INFO("Position control mode");
    ROS_INFO("Success: [%i]", conf_srv.response.success);
  }
  else
  {
    ROS_INFO("Failed to call service  /iiwa/configuration/ConfigureControlMode ");
    ROS_INFO("Success: [%i]", conf_srv.response.success);
    return 1;
  }*/

  ros::Rate loop_rate(0.5);
  ros::Rate loop_rate2(50);
  std_msgs::String msg;
  std::stringstream ss;
  ss << "hello world " ;
  msg.data = ss.str();
  ROS_INFO("%s", msg.data.c_str());
  loop_rate.sleep();

  iiwa_msgs::JointPosition joint;
  joint.position.a1 = 0.0;
  joint.position.a2 = 0.0;
  joint.position.a3 = 0.0;
  joint.position.a4 = 0.0;
  joint.position.a5 = 0.0;
  joint.position.a6 = 0.0;
  joint.position.a7 = 0.0;
    
  jointP_pub.publish(joint);
  ros::spinOnce();
  loop_rate.sleep();

  joint.position.a1 = 0.3; 
  joint.position.a2 = 1.2;
  joint.position.a3 = 0.3;
  joint.position.a4 = 0.8;
  joint.position.a5 = 0.3;
  joint.position.a6 = 0.3;
  joint.position.a7 = 0.0;

  jointP_pub.publish(joint);
  ros::spinOnce();
  loop_rate.sleep();
  loop_rate.sleep();
//impedance control mode
/*  conf_srv.request.control_mode = 1;
  conf_srv.request.joint_impedance.joint_stiffness.a1 = 10.0;
  conf_srv.request.joint_impedance.joint_stiffness.a2 = 50.0; 
  conf_srv.request.joint_impedance.joint_stiffness.a3 = 10.0; 
  conf_srv.request.joint_impedance.joint_stiffness.a4 = 50;//20.0; 
  conf_srv.request.joint_impedance.joint_stiffness.a5 = 10.0; 
  conf_srv.request.joint_impedance.joint_stiffness.a6 = 1.0; 
  conf_srv.request.joint_impedance.joint_stiffness.a7 = 10.0;
  conf_srv.request.joint_impedance.joint_damping.a1 = 0.9;
  conf_srv.request.joint_impedance.joint_damping.a2 = 0.9;
  conf_srv.request.joint_impedance.joint_damping.a3 = 0.9;
  conf_srv.request.joint_impedance.joint_damping.a4 = 0.9;
  conf_srv.request.joint_impedance.joint_damping.a5 = 0.9;
  conf_srv.request.joint_impedance.joint_damping.a6 = 0.9;
  conf_srv.request.joint_impedance.joint_damping.a7 = 0.9;
  if (client.call(conf_srv))
  {
    ROS_INFO("Impedance control mode");
    ROS_INFO("Success: [%i]", conf_srv.response.success);
  }
  else
  {
    ROS_INFO("Failed to call service  /iiwa/configuration/ConfigureControlMode ");
    ROS_INFO("Success: [%i]", conf_srv.response.success);
    return 1;
  }
  loop_rate.sleep();
  ros::spinOnce();
  loop_rate.sleep();
  int record_flag = 0;
  read_trajectory(myFile,traj);
  
  while (ros::ok())
  {
    plot();
    // Press  ESC on keyboard to  exit
    char c = (char)waitKey(1);
    ROS_INFO("key [%d]", c);
    if( c == 27 ) 
    {
      record_flag = 0;
      break; 
    }
    if( c == 115 ) // key "s" start
      record_flag = 1;
    if( c == 102 ) // key "f" finish
    {
      break;
    }
    if (record_flag==1)
    {
      //traj.push_back(current_joint);
      read_trajectory(myFile, traj);
      for(int i=0; i<traj.size(); i++)
      {
        joint.position.a1 = traj[i][0]; 
        joint.position.a2 = traj[i][1];
        joint.position.a3 = traj[i][2];
        joint.position.a4 = traj[i][3];
        joint.position.a5 = traj[i][4];
        joint.position.a6 = traj[i][5];
        joint.position.a7 = traj[i][6];
        jointP_pub.publish(joint);
        ros::spinOnce();
        loop_rate2.sleep();
      }

      break;

    }
    //chatter_pub.publish(joint);
    ros::spinOnce();
    loop_rate2.sleep();

  }
  if (record_flag==1)
    myFile.close();

  ros::spinOnce();
  loop_rate.sleep();
  //destroyAllWindows();
*/
  return 0;
}

