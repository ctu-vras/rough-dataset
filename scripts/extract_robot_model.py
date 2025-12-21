#!/usr/bin/env python3

import rospy

rospy.init_node('extract_robot_model')

print(rospy.get_param('robot_description'))
