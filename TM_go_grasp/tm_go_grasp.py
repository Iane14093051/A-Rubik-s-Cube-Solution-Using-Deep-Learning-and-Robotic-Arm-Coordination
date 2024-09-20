#!/usr/bin/env python
#coding=utf-8

import rospy, sys
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
import numpy as np
import cv2
import sys
import glob
import math
import numpy as np
import math
import matplotlib.pyplot as plt
from pytransform3d import rotations as pr
from pytransform3d import transformations as pt
from pytransform3d.transform_manager import TransformManager
import os
import sys
import matplotlib.pyplot as plt
from PyQt5.QtWidgets import *
from PyQt5.QtCore import *
from PyQt5.QtGui import *
from ui.mainwindow import Ui_MainWindow
import pyrealsense2 as rs
import numpy as np
import cv2
# from robot.controller import Controller
# from robot.gripper import Gripper
import time
import EIHCali
from gripper import Gripper     
import rospy
import RobotControl_func_ros1 as RobotControl_func
import shutil


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

global x, y, z, rx, ry, rz,num
num = 0

home=[1124.0206298828126, 359.75280761718753, 390.2466735839844, 3.140000615890144, 5.5831633548148135e-06, 2.3562192575904826]
position_scan = [919.5576171875001, 225.14340209960937, 192.30389404296877, 2.259346676515989, -0.009674840839256443, -3.103007614029428]
position_scan_grip =[883.03125, 170.74363708496093, 140.25216674804689, 3.141582267261542, 9.232782804685557e-06, 2.356193957560127]
position_scan_grip_up =[874.0298461914062, 169.73402404785157, 340.24604797363283, 3.141590256744812, 0, 2.3561803754385675]
class MoveItDemo:
    px = 0
    py = 0
    pz = 0
    def __init__(self):

        rospy.init_node('tm_grasp', anonymous=True)
        rospy.loginfo("Robot  initializing")

        #构建tf发布器
        self.tf_broadcaster=tf.TransformBroadcaster()

        self.grasp_config=GraspConfig()

        #创建多用途的TF监听器
        self.tf_listener = tf.TransformListener()
        rospy.Subscriber('/detect_grasps/clustered_grasps', GraspConfigList, self.Callback,queue_size=1)        

        self.callback_done=False
            

    def isRotationMatrix(self,R):
        Rt = np.transpose(R)
        shouldBeIdentity = np.dot(Rt, R)
        I = np.identity(3, dtype=R.dtype)
        n = np.linalg.norm(I - shouldBeIdentity)
        return n < 1e-6


    def RotationTrans(self,v):
        #目前是使用弧度
        # print("----------VVVVVV------")
        # print("v:",v)
        #pi = np.pi / 180 #轉成弧度
        # tmp_v = v[0]
        # v[0] = v[2]
        # v[2] = tmp_v
        # pi =   1
        r1_mat = np.zeros((3, 3), np.float32)
        r2_mat = np.zeros((3, 3), np.float32)
        r3_mat = np.zeros((3, 3), np.float32)

        r = np.zeros((3, 1), np.float32)
        r[0] = 0
        r[1] = 0
        #r[2] = float(v[2]) * pi # 如果是角度轉成弧度
        r[2] = float(v[2]) 
        r3_mat, jacobian = cv2.Rodrigues(r)
        # print("r3_mat:",r3_mat)
        r[0] = 0
        r[1] = float(v[1])
        r[2] = 0
        # print('ys ', math.sin(v[1]))
        # print('yc ', math.cos(v[1]))
        r2_mat, jacobian = cv2.Rodrigues(r)
        # print("r2_mat:",r2_mat)
        r[0] = float(v[0])
        r[1] = 0
        r[2] = 0
        r1_mat, jacobian = cv2.Rodrigues(r)
        # print("r1_mat:",r1_mat)

        #result = np.dot(np.dot(r1_mat, r3_mat), r2_mat)
        result = np.dot(np.dot(r3_mat, r2_mat), r1_mat)#正確的但是yz相反
        #result = np.dot(np.dot(r1_mat, r2_mat), r3_mat)#正確的但是軸錯亂
        #result = np.dot(np.dot(r2_mat, r1_mat), r3_mat)
        #result = np.dot(np.dot(r2_mat, r3_mat), r1_mat)
        #result = np.dot(np.dot(r3_mat, r1_mat), r2_mat)#
        return result
        
    def rotationMatrixToEulerAngles(self,R):
        assert (self.isRotationMatrix(R))

        sy = math.sqrt(R[0, 0] * R[0, 0] + R[1, 0] * R[1, 0])
        singular = sy < 1e-6
        if not singular:
            x = math.atan2(R[2, 1], R[2, 2])
            y = math.atan2(-R[2, 0], sy)
            z = math.atan2(R[1, 0], R[0, 0])
        else:
            x = math.atan2(-R[1, 2], R[1, 1])
            y = math.atan2(-R[2, 0], sy)
            z = 0
        # print([x,y,z])
        return np.array([x, y, z])


    def Callback(self,data):

         #变换关系正确读取的标志位
        get_transform=False
        #等待并获取正确的tf变换关系
        [a,b,c,d,e,f]=robot.get_TMPos()
        if not (abs(a-home[0])<=10 and abs(b-home[1])<=10 and abs(c-home[2])<=10 and abs(d-home[3])<=10 and abs(e-home[4])<=10 and abs(f-home[5])<=10):
           return
        while not get_transform:
            try:
                if 0:
                    get_transform = True
                    rospy.loginfo("Test mode")
                else:
                    #相机坐标系相对于base坐标系的位姿
                    self.artc_trans, self.artc_quater = self.tf_listener.lookupTransform('/ar_marker_6', 'camera_depth_optical_frame', rospy.Time(0))
                    #self.artc_trans, self.artc_quater = self.tf_listener.lookupTransform('camera_depth_optical_frame', '/ar_marker_6', rospy.Time(0))             
                    #将trans转换成为ndarry
                    self.artc_trans=np.array(self.artc_trans)
                    self.artc_quater= np.array(self.artc_quater)
                    self.artc=quaternion_matrix(self.artc_quater)
                    self.artc[0][3] = self.artc_trans[0]
                    self.artc[1][3] = self.artc_trans[1]
                    self.artc[2][3] = self.artc_trans[2]
                    self.artc_rot=self.artc[:3, :3]
                    get_transform = True
                    rospy.loginfo("got transform complete")
            except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
                raise SystemError("got transform failed")       
        #data是GraspConfigList,data.grasps是GraspConfig[]类型,
        #data.grasps[0]是list中第一个GraspConfig类型的数据，代表的最优的那个抓取配置
        self.grasp_config=data.grasps[0]

        #以下是读取grasp的pose，需要注意的是，此时pose的参考系是谁？是桌面标签参考坐标系，并不是panda_link0
        #读取grasp pose的三个方向向量，转换为ndarray形式
        approach=np.array([self.grasp_config.approach.x,\
            self.grasp_config.approach.y,self.grasp_config.approach.z])#接近轴
        binormal=np.array([self.grasp_config.binormal.x,\
            self.grasp_config.binormal.y,self.grasp_config.binormal.z])#合并轴
        axis=np.array([self.grasp_config.axis.x,\
            self.grasp_config.axis.y,self.grasp_config.axis.z])#
        #进行方向向量归一化
        approach=approach/np.linalg.norm(approach)
        binormal=binormal/np.linalg.norm(binormal)
        axis=axis/np.linalg.norm(axis)
        #读取典范抓取坐标系原点在参考系中的坐标（默认参考系为marker坐标系）
        #ctg_trans=np.array([self.grasp_config.top.x,self.grasp_config.top.y,self.grasp_config.top.z])#[3,]
        #ctg_rot=np.hstack([approach,binormal,axis]).reshape(3,3).T #[3,3]
        sgtar=np.hstack([binormal,axis,approach]).reshape(3,3).T
        point = np.zeros((4, 1), dtype=np.float64)
        point[0, 0]  = self.grasp_config.top.x
        point[1, 0]  = self.grasp_config.top.y
        point[2, 0] = self.grasp_config.top.z
        point[3, 0] = 1.0
        sys.path.append(os.path.dirname(__file__) + os.sep) 
        Camera2Gripper=np.load('/home/robotic/calibration/Camera2Gripper_chong.npy')
        Camera2Gripper_rotation_mat= Camera2Gripper[:3, :3]
        [x,y,z,u,v,w]=robot.get_TMPos()
        G2B_translation = np.matrix([x,y,z]).T
        G2B_rotation_mat= self.RotationTrans([u,v,w])
        print(G2B_translation)
        print(G2B_rotation_mat)
        Gripper2Base = np.r_[np.c_[G2B_rotation_mat, G2B_translation], [[0, 0, 0, 1]]]



        mtomm= np.array([
            [1000, 0, 0, 0],
            [0, 1000, 0, 0],
            [0, 0, 1000, 0],
            [0, 0, 0, 1]
        ])

        print("貼紙座標")  
        print(point)  
        
        print("_____")
        #tm = TransformManager()
        #tm.add_transform("ar", "Camera", np.array( self.artc))
        #tm.add_transform("Camera", "Gripper", np.array(Camera2Gripper))
        #tm.add_transform("Gripper", "Base", np.array(Gripper2Base))
        #ax = tm.plot_frames_in("Base", s=50)
        #ax.set_xlim((-500, 500))
        #ax.set_ylim((-500, 500))
        #ax.set_zlim((-500, 500))
        #plt.show()
        Base_point=self.artc @ point
        print("相機座標")  
        print(Base_point)
        print("夾爪座標")
        Base_point = Camera2Gripper @ mtomm @ Base_point
        print(Base_point)
        print("基底座標_")
        Base_point =  Gripper2Base @ Base_point
        print(Base_point)
        
        
      
        Base_coor = G2B_rotation_mat @ Camera2Gripper_rotation_mat @ self.artc_rot @ sgtar
        Base_coor_euler=self.rotationMatrixToEulerAngles(Base_coor)
        rx, ry, rz = Base_coor_euler
        x=Base_point[0, 0]
        y=Base_point[1, 0]
        rx=Base_coor_euler[0]
        ry=Base_coor_euler[1]
        rz=Base_coor_euler[2]

        if rz<0:
           rz = rz+3.1415927*2
        if self.pz ==0:
           self.pz = rz
        elif abs(self.pz-rz) <=1 :
           return
        else:
           self.pz = rz

        robot.set_TMPos([x,y,z,rx, ry,rz])
        g.gripper_soft_off() 
        robot.set_TMPos(position_scan_grip_up)
        robot.set_TMPos(position_scan_grip)
        g.gripper_on() 
        robot.set_TMPos(position_scan)
        
        # place robot.set_TMPos(x,y,z,rx,ry,rz)

    def lookupTransform(self,tf_listener, target, source):
        tf_listener.waitForTransform(target, source, rospy.Time(), rospy.Duration(4.0)) #等待时间为4秒

        trans, rot = tf_listener.lookupTransform(target, source, rospy.Time())
        euler = tf.transformations.euler_from_quaternion(rot)

        source_target = tf.transformations.compose_matrix(translate = trans, angles = euler)
        return source_target
    def getTfFromMatrix(self,matrix):
        scale, shear, angles, trans, persp = tf.transformations.decompose_matrix(matrix)
        return trans, tf.transformations.quaternion_from_euler(*angles), angles


    def quater_multi_vec(self,quater,vec):
        quater_=tf.transformations.quaternion_inverse(quater)
        vec_quater=np.c_[vec,[0]]
        temp=quaternion_multiply(quater,vec_quater)
        temp=quaternion_multiply(temp,quater_)
        return temp[:3]

    def move_to_joints(self,group,joints,tag="initial pose"):
        #先从Initial 移动到HOME
        case,plan  = self.planJointGoal(group,joints)#返回真  就是找到轨迹    
        if case==2:
            rospy.loginfo("Move to {}".format(tag))
            group.execute(plan,wait=True)
        elif case==1:
            rospy.loginfo("Already at {}".format(tag))

        else:
            raise SystemError("Home pose  trajectory  not found")

    def planJointGoal(self,movegroup,joint_goal,lable='Next'):
        current_joint = movegroup.get_current_joint_values()
        dis_pose =np.linalg.norm(np.array(joint_goal)-np.array(current_joint))
        #print(current_joint)
        #print(joint_goal)
        if dis_pose<0.008:
            return 1,None #已经到位
        else:
            movegroup.set_joint_value_target(joint_goal)
            plan = movegroup.plan()
            if not plan.joint_trajectory.points:
                return 0,plan
            else:#执行规划
                return 2,plan
       

if __name__ == "__main__":
    try:
        MoveItDemo()
        rospy.spin()
    except rospy.ROSInterruptException:
        rospy.loginfo("Arm tracker node terminated.")

    
    

 


