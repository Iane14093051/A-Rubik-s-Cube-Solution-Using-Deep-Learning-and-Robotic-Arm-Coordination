#!/usr/bin/env python
#coding=utf-8

import rospy, sys
import tf
import argparse
import math
from math import pi
import copy
from trajectory_msgs.msg import JointTrajectoryPoint
from geometry_msgs.msg import PoseStamped, Pose
from tf.transformations import euler_from_quaternion, quaternion_from_euler,quaternion_multiply,quaternion_from_matrix,quaternion_matrix
from autolab_core import RigidTransform,transformations
from pyquaternion import Quaternion
try:
    from gpd_grasp_msgs.msg import GraspConfig,GraspConfigList
except ImportError:
    print("Please install grasp msgs from https://github.com/TAMS-Group/gpd_grasp_msgs in your ROS workspace")
    exit()
import RobotControl_func_ros1
import rospy
#from rclpy.node import Node
# print(sys.path)
# from tm_msgs import msg
from tm_msgs.msg import *
from tm_msgs.srv import *
import numpy as np
import time
#import robotiqGripper
import gripper
INS = np.load("INS.npy")
RC2G = np.load("RC2G.npy")
TC2G = np.load("TC2G.npy")
home=[1124.0206298828126, 359.75280761718753, 390.2466735839844, 3.140000615890144, 5.5831633548148135e-06, 2.3562192575904826]
robot = RobotControl_func_ros1.RobotControl_Func()


if __name__ == '__main__':
    
    rospy.init_node('home_state_checker', anonymous=True)
    rate = rospy.Rate(10)
    while not rospy.is_shutdown():
        #获取机械臂当前状态
        pos=robot.get_TMPos()
        if (abs(pos[0]-home[0])<=10 and abs(pos[1]-home[1])<=10 and abs(pos[2]-home[2])<=10 and abs(pos[3]-home[3])<=10 and abs(pos[4]-home[4])<=10 and abs(pos[5]-home[5])<=10):
            rospy.set_param("/robot_at_home", "true")
            rospy.loginfo("robot at home")
        else:
            rospy.set_param("/robot_at_home", "false")
            rospy.loginfo("robot is moving")
        rate.sleep()
