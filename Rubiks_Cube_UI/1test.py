import RobotControl_func_chong

import rclpy
from rclpy.node import Node
# sys.path.append(os.path.join(os.path.dirname(__file__), '../../../', 'tm_msgs/msg'))
# print(sys.path)
# from tm_msgs import msg
from tm_msgs.msg import *
from tm_msgs.srv import *
import numpy as np
import time
#import robotiqGripper
import gripper
rclpy.init()
robot = RobotControl_func_chong.RobotControl_Func()