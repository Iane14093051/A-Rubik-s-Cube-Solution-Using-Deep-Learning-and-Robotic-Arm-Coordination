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

robot = RobotControl_func_ros1.RobotControl_Func()
g = gripper.Gripper(1)
g.gripper_reset()

global x,y,z,rx,ry,rz


class MoveItDemo:
    def __init__(self):
        rospy.init_node('tm_grasp', anonymous=True)
        self.grasp_config=GraspConfig()
        self.tf_listener = tf.TransformListener()   
        self.callback_done=False
        rospy.Subscriber('/detect_grasps/clustered_grasps', GraspConfigList, self.Callback,queue_size=1)

    def Callback(self,data):

        g.gripper_soft_off()
        g.gripper_on()
        g.gripper_soft_off()
        
if __name__ == "__main__":
    try:
        MoveItDemo()
        rospy.spin()
    except rospy.ROSInterruptException:
        rospy.loginfo("Arm tracker node terminated.")

    
    
