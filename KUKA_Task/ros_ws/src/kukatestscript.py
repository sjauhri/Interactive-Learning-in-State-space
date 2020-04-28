import rospy
from iiwa_msgs.msg import JointPosition

rospy.init_node('tips_fishing', anonymous=True, disable_signals=True) # disable rospy handling of Ctrl+C

action_pub = rospy.Publisher('/iiwa/command/JointPosition', JointPosition, queue_size=1)

goal = JointPosition()

goal.position.a1 = 0.0
goal.position.a2 = 0.0
goal.position.a3 = 0.0
goal.position.a4 = 0.0
goal.position.a5 = 0.0
goal.position.a6 = 0.0
goal.position.a7 = 0.0

goal.header.stamp = rospy.Duration.from_sec(0.1)
# goal.header.frame_id = 'world'

action_pub.publish(goal)

