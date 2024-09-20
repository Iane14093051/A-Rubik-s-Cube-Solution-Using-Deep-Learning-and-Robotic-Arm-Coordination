from tkinter import *
from tkinter import ttk
from turtle import update
import cv2 
import rospy
from sensor_msgs.msg import Image as Image_ros
from cv_bridge import CvBridge, CvBridgeError
import numpy as np
from PIL import ImageTk, Image
from image_processing import *
import kociemba
import tkinter as tk
import time
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
import threading

up =0
front =1
back =2
right =3
left =4
down =5

position_init = [829.0267333984376, 428.75689697265623, 140.24778747558594, 3.141585729370959, 0, 2.3561870333412926]
position_init_up = [818.0234985351563, 431.73663330078127, 340.24778747558594, 3.141585196738741, -0.0, 2.3561830385996574]

position_90_r_init = [829.0267333984376, 428.75689697265623, 140.24778747558594, 3.141585729370959, 0, 0.78539816]
position_180_r_init = [829.0267333984376, 428.75689697265623, 140.24778747558594, 3.141585729370959, 0, 5.4977871]
position_n90_r_init = [820.0267333984376, 438.75689697265623, 140.24778747558594, 3.141585729370959, 0, 3.9269908]

position_place  = [874.0298461914062, 169.73402404785157, 340.24604797363283, 3.141590256744812, 0, 2.3561803754385675]
position_place_90  = [874.0298461914062, 169.73402404785157, 340.24604797363283, 3.141590256744812, 0, 0.78539816]
position_place_180  = [874.0298461914062, 169.73402404785157, 340.24604797363283, 3.141590256744812,  0, 5.4977871]
position_place_n90  = [874.0298461914062, 169.73402404785157, 340.24604797363283, 3.141590256744812, 0, 3.9269908]


position_down = [883.03125, 170.74363708496093, 140.25216674804689, 3.141590256744812, 0, 2.3561803754385675]
position_down_90 = [886.03125, 173.74363708496093, 140.25216674804689, 3.141590256744812, 0, 0.78539816]
position_down_180 = [883.03125, 170.74363708496093, 140.25216674804689, 3.141590256744812,  0, 5.4977871]
position_down_n90 = [886.03125, 173.74363708496093, 140.25216674804689, 3.141590256744812, 0, 3.9269908]

position_up_flip = [874.0298461914062, 169.73402404785157, 340.24604797363283, 1.5707963, 0, 2.35619]
position_down_flip = [871.01953125, 166.7354431152344, 122.2597351074219, 1.5707907341566074, 0, 2.3561843701802028]
position_flip = [874.0298461914062, 169.73402404785157, 340.24604797363283, 1.5707963, 0, 2.35619]

position_scan = [913.5594482421875, 215.1548461914063, 179.3092346191406, 2.3393406752337786, -0.06966280134672458, -3.082999381182524]
position_scan_grip =[883.03125, 170.74363708496093, 140.25216674804689, 3.141582267261542, 9.232782804685557e-06, 2.356193957560127]
position_scan_grip_up =[874.0298461914062, 169.73402404785157, 340.24604797363283, 3.141590256744812, 0, 2.3561803754385675]
home=[1124.0206298828126, 359.75280761718753, 390.2466735839844, 3.140000615890144, 5.5831633548148135e-06, 2.3562192575904826]
home_place =[1124.0166015625, 359.76434326171874, 10.24365234375, 3.14000700747676, 3.3220278996058494e-06, 2.356229643918734]

W = 700
H = 650
str_copy_blue = ""
str_copy_red = ""
str_copy_yellow = ""
str_copy_green = ""
str_copy_orange = ""
str_copy_white = ""
class gui:
    count = 0
    images=[]
    rospy.init_node('talker', anonymous=True)
    ans ="0"
    out =False
    go =False
    grid = []
    face = []
    sollution = ["U'","U","U2","R"]
    green_str = "FFFFFFFFF"
    white_str = "UUUUUUUUU"
    red_str =   "RRRRRRRRR"
    orange_str = "LLLLLLLLL"
    blue_str = "BBBBBBBBB"
    yellow_str="DDDDDDDDD"
    green_side = [0,0,0,0,0,0,0,0,0]
    yellow_side = [5,5,5,5,5,5,5,5,5]
    blue_side = [4,4,4,4,4,4,4,4,4]
    orange_side = [3,3,3,3,3,3,3,3,3]
    white_side = [1,1,1,1,1,1,1,1,1]
    red_side = [2,2,2,2,2,2,2,2,2]
    solve_status = True
    sollution_whole = ["U'","U","U2","R"]
    sollution_arm = ["U'","U","U2","R"]
    green_side_whole = [0,0,0,0,0,0,0,0,0]
    yellow_side_whole = [5,5,5,5,5,5,5,5,5]
    blue_side_whole = [4,4,4,4,4,4,4,4,4]
    orange_side_whole = [3,3,3,3,3,3,3,3,3]
    white_side_whole = [1,1,1,1,1,1,1,1,1]
    red_side_whole = [2,2,2,2,2,2,2,2,2]
    solve_status_whole = True
    iter_x = 0
    iter_y = 0
    firstRead = []
    secondRead = []
    firstDone = False
    firstDone_check = False
    cube_list = []
    cube_list_whole = []    
    color_white = (255, 255, 255)
    color_yellow = (0, 255, 255)
    color_red = (0, 0, 255)
    color_orange = (0, 162, 255)
    color_green = (0, 255, 0)
    color_blue = (255, 0, 0)
    DEBUG = False
    firstraw =[]
    secondraw =[]
    first =True
    position =["white","green","blue","red","orange","yellow"]
    u =[]
    f =[]
    r =[]
    b =[]
    l =[]
    d =[]
    pos =[]
    move_arm = 0
    yellow_history =[[-1] * 9] * 30
    white_history =[[-1] * 9] * 30
    blue_history =[[-1] * 9] * 30
    red_history =[[-1] * 9] * 30
    green_history =[[-1] * 9] * 30
    orange_history =[[-1] * 9] * 30
    onprocess = False
    now_state =-1
    past_state =-1
    INS = np.load("INS.npy")
    RC2G = np.load("RC2G.npy")
    TC2G = np.load("TC2G.npy")
    #rclpy.init()
    robot = RobotControl_func_ros1.RobotControl_Func()
    g = gripper.Gripper(1)
    g.gripper_reset()
    g.gripper_on()
    robot.set_TMPos(home)
    #robot.set_TMPos(position_scan)
    def get_face_rep_with_arrow_whole(self,face_stat,clockwise = True,Double = False):


        image =  np.zeros((75,75,3), np.uint8)

        for i in range(1,10):
            pos = []
            if i == 1:
                pos = [[3,3],[24,24]] 
            elif i == 4:
                pos = [[3,27],[24,48]]
            elif i == 7:
                pos = [[3,51],[24,72]]
            elif i == 2:
                pos = [[27,3],[48,24]]
            elif i == 5:
                pos = [[27,27],[48,48]]
            elif i == 8:
                pos = [[27,51],[48,72]]
            elif i == 3:
                pos = [[51,3],[72,24]]
            elif i == 6:
                pos = [[51,27],[72,48]]
            elif i == 9:
                pos = [[51,51],[72,72]]

            if(face_stat[i-1] == 0):
                image = cv2.rectangle(image,tuple(pos[0]),tuple(pos[1]),(0,200,0),-1)
            elif(face_stat[i-1] == 1):
                image = cv2.rectangle(image,tuple(pos[0]),tuple(pos[1]),(255,255,255),-1)
            elif(face_stat[i-1] == 2):
                image = cv2.rectangle(image,tuple(pos[0]),tuple(pos[1]),(204,0,0),-1)
            elif(face_stat[i-1] == 3):
                image = cv2.rectangle(image,tuple(pos[0]),tuple(pos[1]),(255,153,51),-1)
            elif(face_stat[i-1] == 4):
                image = cv2.rectangle(image,tuple(pos[0]),tuple(pos[1]),(90,90,255),-1)
            elif(face_stat[i-1] == 5):
                image = cv2.rectangle(image,tuple(pos[0]),tuple(pos[1]),(255,255,51),-1)
        img = np.ones((105,105,3), np.uint8)
        img[:,:,0] = img[:,:,0]*220
        img[:,:,1] = img[:,:,1]*216
        img[:,:,2] = img[:,:,2]*218

        img[14:89,14:89] = image
        if not clockwise:
            img = cv2.arrowedLine(img,(95,9),(5,9),(0,0,0),4)
            if Double:
                img = cv2.arrowedLine(img,(10,95),(100,95),(0,0,0),4)
        elif clockwise:
            img = cv2.arrowedLine(img,(10,9),(100,9),(0,0,0),3)
            if Double:
                img = cv2.arrowedLine(img,(95,95),(5,95),(0,0,0),3)  
            
        img =  Image.fromarray(img)
        img =  ImageTk.PhotoImage(img)
        return img


    def get_face_rep_with_arrow(self,face_stat,clockwise = True,Double = False):


        image =  np.zeros((150,150,3), np.uint8)

        for i in range(1,10):
            pos = []
            if i == 1:
                pos = [[6,6],[48,48]] 
            elif i == 4:
                pos = [[6,54],[48,96]]
            elif i == 7:
                pos = [[6,102],[48,144]]
            elif i == 2:
                pos = [[54,6],[96,48]]
            elif i == 5:
                pos = [[54,54],[96,96]]
            elif i == 8:
                pos = [[54,102],[96,144]]
            elif i == 3:
                pos = [[102,6],[144,48]]
            elif i == 6:
                pos = [[102,54],[144,96]]
            elif i == 9:
                pos = [[102,102],[144,144]]

            if(face_stat[i-1] == 0):
                image = cv2.rectangle(image,tuple(pos[0]),tuple(pos[1]),(0,200,0),-1)
            elif(face_stat[i-1] == 1):
                image = cv2.rectangle(image,tuple(pos[0]),tuple(pos[1]),(255,255,255),-1)
            elif(face_stat[i-1] == 2):
                image = cv2.rectangle(image,tuple(pos[0]),tuple(pos[1]),(204,0,0),-1)
            elif(face_stat[i-1] == 3):
                image = cv2.rectangle(image,tuple(pos[0]),tuple(pos[1]),(255,153,51),-1)
            elif(face_stat[i-1] == 4):
                image = cv2.rectangle(image,tuple(pos[0]),tuple(pos[1]),(90,90,255),-1)
            elif(face_stat[i-1] == 5):
                image = cv2.rectangle(image,tuple(pos[0]),tuple(pos[1]),(255,255,51),-1)
        img = np.ones((210,210,3), np.uint8)
        img[:,:,0] = img[:,:,0]*220
        img[:,:,1] = img[:,:,1]*216
        img[:,:,2] = img[:,:,2]*218

        img[29:179,29:179] = image
        if not clockwise:
            img = cv2.arrowedLine(img,(190,17),(10,17),(0,0,0),4)
            if Double:
                img = cv2.arrowedLine(img,(20,190),(200,190),(0,0,0),4)
        elif clockwise:
            img = cv2.arrowedLine(img,(20,17),(200,17),(0,0,0),3)
            if Double:
                img = cv2.arrowedLine(img,(190,190),(10,190),(0,0,0),3)  
            
        img =  Image.fromarray(img)
        img =  ImageTk.PhotoImage(img)
        return img

    def get_face_rep(self,face_stat):

        #*4/3
        image =  np.zeros((200,200,3), np.uint8)

        for i in range(1,10):
            pos = []
            if i == 1:
                pos = [[8,8],[64,64]] 
            elif i == 4:
                pos = [[8,72],[64,128]]
            elif i == 7:
                pos = [[8,136],[64,192]]
            elif i == 2:
                pos = [[72,8],[128,64]]
            elif i == 5:
                pos = [[72,72],[128,128]]
            elif i == 8:
                pos = [[72,136],[128,192]]
            elif i == 3:
                pos = [[136,8],[192,64]]
            elif i == 6:
                pos = [[136,72],[192,128]]
            elif i == 9:
                pos = [[136,136],[192,192]]

            if(face_stat[i-1] == 0):
                image = cv2.rectangle(image,tuple(pos[0]),tuple(pos[1]),(0,200,0),-1)
            elif(face_stat[i-1] == 1):
                image = cv2.rectangle(image,tuple(pos[0]),tuple(pos[1]),(255,255,255),-1)
            elif(face_stat[i-1] == 2):
                image = cv2.rectangle(image,tuple(pos[0]),tuple(pos[1]),(204,0,0),-1)
            elif(face_stat[i-1] == 3):
                image = cv2.rectangle(image,tuple(pos[0]),tuple(pos[1]),(255,153,51),-1)
            elif(face_stat[i-1] == 4):
                image = cv2.rectangle(image,tuple(pos[0]),tuple(pos[1]),(90,90,255),-1)
            elif(face_stat[i-1] == 5):
                image = cv2.rectangle(image,tuple(pos[0]),tuple(pos[1]),(255,255,51),-1)
            
        image =  Image.fromarray(image)
        image =  ImageTk.PhotoImage(image)
        return image
    def reset_face(self):


        image =  np.ones((105,105,3), np.uint8)

        image[:,:,0] = image[:,:,0]*220
        image[:,:,1] = image[:,:,1]*216
        image[:,:,2] = image[:,:,2]*218
        

            
        image =  Image.fromarray(image)
        image =  ImageTk.PhotoImage(image)
        return image
    

    def update_grid_status(self):

        img0 = self.get_face_rep(self.green_side)
        self.panel0 = Label(self.root, image=img0)
        self.panel0.image = img0
        self.panel0.place(x=470,y=240,in_=self.root)

        img1 = self.get_face_rep(self.white_side)
        self.panel1 = Label(self.root, image=img1)
        self.panel1.image = img1
        self.panel1.place(x=470,y=40,in_=self.root)

        img2 = self.get_face_rep(self.red_side)
        self.panel2 = Label(self.root, image=img2)
        self.panel2.image = img2
        self.panel2.place(x=670,y=240,in_=self.root)#370+200

        img3 = self.get_face_rep(self.orange_side)
        self.panel3 = Label(self.root, image=img3)
        self.panel3.image = img3
        self.panel3.place(x=270,y=240,in_=self.root)#370-200

        img4 = self.get_face_rep(self.blue_side)
        self.panel4 = Label(self.root, image=img4)
        self.panel4.image = img4
        self.panel4.place(x=70,y=240,in_=self.root)#

        img5 = self.get_face_rep(self.yellow_side)
        self.panel5 = Label(self.root, image=img5)
        self.panel5.image = img5
        self.panel5.place(x=470,y=440,in_=self.root)
        

    def update_grid_status_whole(self):

        img0 = self.get_face_rep(self.green_side)
        self.panel0 = Label(self.root, image=img0)
        self.panel0.image = img0
        self.panel0.place(x=470,y=240,in_=self.root)

        img1 = self.get_face_rep(self.white_side)
        self.panel1 = Label(self.root, image=img1)
        self.panel1.image = img1
        self.panel1.place(x=470,y=40,in_=self.root)

        img2 = self.get_face_rep(self.red_side)
        self.panel2 = Label(self.root, image=img2)
        self.panel2.image = img2
        self.panel2.place(x=670,y=240,in_=self.root)#370+200

        img3 = self.get_face_rep(self.orange_side)
        self.panel3 = Label(self.root, image=img3)
        self.panel3.image = img3
        self.panel3.place(x=270,y=240,in_=self.root)#370-200

        img4 = self.get_face_rep(self.blue_side)
        self.panel4 = Label(self.root, image=img4)
        self.panel4.image = img4
        self.panel4.place(x=70,y=240,in_=self.root)#

        img5 = self.get_face_rep(self.yellow_side)
        self.panel5 = Label(self.root, image=img5)
        self.panel5.image = img5
        self.panel5.place(x=470,y=440,in_=self.root)


    def solve_reset(self):
        self.count = 0
        self.out =False
        self.go =False
        self.grid = []
        self.face = []
        self.sollution = ["U'","U","U2","R"]
        self.green_str = "FFFFFFFFF"
        self.white_str = "UUUUUUUUU"
        self.red_str =   "RRRRRRRRR"
        self.orange_str = "LLLLLLLLL"
        self.blue_str = "BBBBBBBBB"
        self.yellow_str="DDDDDDDDD"
        self.green_side = [0,0,0,0,0,0,0,0,0]
        self.yellow_side = [5,5,5,5,5,5,5,5,5]
        self.blue_side = [4,4,4,4,4,4,4,4,4]
        self.orange_side = [3,3,3,3,3,3,3,3,3]
        self.white_side = [1,1,1,1,1,1,1,1,1]
        self.red_side = [2,2,2,2,2,2,2,2,2]
        self.solve_status = True
        self.sollution_whole = ["U'","U","U2","R"]
        self.sollution_arm = ["U'","U","U2","R"]
        self.green_side_whole = [0,0,0,0,0,0,0,0,0]
        self.yellow_side_whole = [5,5,5,5,5,5,5,5,5]
        self.blue_side_whole = [4,4,4,4,4,4,4,4,4]
        self.orange_side_whole = [3,3,3,3,3,3,3,3,3]
        self.white_side_whole = [1,1,1,1,1,1,1,1,1]
        self.red_side_whole = [2,2,2,2,2,2,2,2,2]
        self.solve_status_whole = True
        self.iter_x = 0
        self.iter_y = 0
        self.firstRead = []
        self.secondRead = []
        self.firstDone = False
        self.firstDone_check = False
        self.cube_list = []
        self.cube_list_whole = []    
        self.color_white = (255, 255, 255)
        self.color_yellow = (0, 255, 255)
        self.color_red = (0, 0, 255)
        self.color_orange = (0, 162, 255)
        self.color_green = (0, 255, 0)
        self.color_blue = (255, 0, 0)
        self.DEBUG = False
        self.firstraw =[]
        self.secondraw =[]
        self.first =True
        self.position =["white","green","blue","red","orange","yellow"]
        self.yellow_history =[[-1] * 9] * 30
        self.white_history =[[-1] * 9] * 30
        self.blue_history =[[-1] * 9] * 30
        self.red_history =[[-1] * 9] * 30
        self.green_history =[[-1] * 9] * 30
        self.orange_history =[[-1] * 9] * 30
        self.onprocess = False
        self.move_arm =0
        self.now_state =-1
        self.past_state =-1
        self.u =[]
        self.f =[]
        self.r =[]
        self.b =[]
        self.l =[]
        self.d =[]
        self.ans ="0"
        self.update_grid_status()
        #try:
            #self.panel6.destroy()
            #self.panel7.destroy()
        #except:
           # pass
        try:
            self.mylabel1.destroy()
            self.mylabel2.destroy()
            self.panel.destroy()
            self.panel_whole.destroy()
        except:
            pass
        self.iter_x = 0
        self.iter_y = 0
        j=0
        for i in range(22):
            img = self.reset_face()
            self.panel_reset = Label(self.root, image=img)
            self.panel_reset.image = img
            if i == 10:
               j+=1
            i=i%10
            self.panel_reset.place(x=i*150,y=700+j*100,in_=self.root)        
            
    def update_solve_whole(self):
        sum =0
        while self.solve_status_whole and self.sollution_whole != []:

            if self.sollution_whole[0] == "U":
                self.white_history[sum] = self.white_side_whole
                self.red_history[sum] = self.red_side_whole
                self.orange_history[sum] = self.orange_side_whole
                self.blue_history[sum] = self.blue_side_whole
                self.green_history[sum] = self.green_side_whole
                self.yellow_history[sum] = self.yellow_side_whole

                img = self.get_face_rep_with_arrow_whole(self.white_side_whole,True,False)
                self.panel_whole = Label(self.root, image=img)
                self.panel_whole.image = img
                self.panel_whole.place(x=self.iter_x*150,y=700+self.iter_y*100,in_=self.root)

                temp1 = [self.green_side_whole[0],self.green_side_whole[1],self.green_side_whole[2]]
                self.green_side_whole[0],self.green_side_whole[1],self.green_side_whole[2] = self.red_side_whole[0],self.red_side_whole[1],self.red_side_whole[2]
                self.red_side_whole[0],self.red_side_whole[1],self.red_side_whole[2] =self.blue_side_whole[0],self.blue_side_whole[1],self.blue_side_whole[2]
                self.blue_side_whole[0],self.blue_side_whole[1],self.blue_side_whole[2] = self.orange_side_whole[0],self.orange_side_whole[1],self.orange_side_whole[2]
                self.orange_side_whole[0],self.orange_side_whole[1],self.orange_side_whole[2] = temp1[0],temp1[1],temp1[2]
                temp2 = self.white_side_whole
                self.white_side_whole = [temp2[6],temp2[3],temp2[0],temp2[7],temp2[4],temp2[1],temp2[8],temp2[5],temp2[2]]
                #self.update_grid_status_whole()
                self.iter_x+=1
            
            elif self.sollution_whole[0] == "U2":
                self.white_history[sum] = self.white_side_whole
                self.red_history[sum] = self.red_side_whole
                self.orange_history[sum] = self.orange_side_whole
                self.blue_history[sum] = self.blue_side_whole
                self.green_history[sum] = self.green_side_whole
                self.yellow_history[sum] = self.yellow_side_whole

                img = self.get_face_rep_with_arrow_whole(self.white_side_whole,True,True)
                self.panel_whole = Label(self.root, image=img)
                self.panel_whole.image = img
                self.panel_whole.place(x=self.iter_x*150,y=700+self.iter_y*100,in_=self.root)

                temp1 = [self.green_side_whole[0],self.green_side_whole[1],self.green_side_whole[2]]
                temp2 = [self.red_side_whole[0],self.red_side_whole[1],self.red_side_whole[2]]
                self.green_side_whole[0],self.green_side_whole[1],self.green_side_whole[2] = self.blue_side_whole[0],self.blue_side_whole[1],self.blue_side_whole[2]
                self.red_side_whole[0],self.red_side_whole[1],self.red_side_whole[2] = self.orange_side_whole[0],self.orange_side_whole[1],self.orange_side_whole[2]
                self.blue_side_whole[0],self.blue_side_whole[1],self.blue_side_whole[2] = temp1[0],temp1[1],temp1[2]
                self.orange_side_whole[0],self.orange_side_whole[1],self.orange_side_whole[2] = temp2[0],temp2[1],temp2[2]
                temp3 = self.white_side_whole
                self.white_side_whole = [temp3[8],temp3[7],temp3[6],temp3[5],temp3[4],temp3[3],temp3[2],temp3[1],temp3[0]]
                #self.update_grid_status_whole()
                self.iter_x+=1
            
            elif self.sollution_whole[0] == "U'":
                self.white_history[sum] = self.white_side_whole
                self.red_history[sum] = self.red_side_whole
                self.orange_history[sum] = self.orange_side_whole
                self.blue_history[sum] = self.blue_side_whole
                self.green_history[sum] = self.green_side_whole
                self.yellow_history[sum] = self.yellow_side_whole

                img = self.get_face_rep_with_arrow_whole(self.white_side_whole,False,False)
                self.panel_whole = Label(self.root, image=img)
                self.panel_whole.image = img
                self.panel_whole.place(x=self.iter_x*150,y=700+self.iter_y*100,in_=self.root)            
                temp1 = [self.green_side_whole[0],self.green_side_whole[1],self.green_side_whole[2]]
                self.green_side_whole[0],self.green_side_whole[1],self.green_side_whole[2] = self.orange_side_whole[0],self.orange_side_whole[1],self.orange_side_whole[2]
                self.orange_side_whole[0],self.orange_side_whole[1],self.orange_side_whole[2] =self.blue_side_whole[0],self.blue_side_whole[1],self.blue_side_whole[2]
                self.blue_side_whole[0],self.blue_side_whole[1],self.blue_side_whole[2] = self.red_side_whole[0],self.red_side_whole[1],self.red_side_whole[2]
                self.red_side_whole[0],self.red_side_whole[1],self.red_side_whole[2] = temp1[0],temp1[1],temp1[2]
                temp2 = self.white_side_whole
                self.white_side_whole = [temp2[2],temp2[5],temp2[8],temp2[1],temp2[4],temp2[7],temp2[0],temp2[3],temp2[6]]
                #self.update_grid_status_whole()
                self.iter_x+=1
            




            elif self.sollution_whole[0] == "R":
                self.white_history[sum] = self.white_side_whole
                self.red_history[sum] = self.red_side_whole
                self.orange_history[sum] = self.orange_side_whole
                self.blue_history[sum] = self.blue_side_whole
                self.green_history[sum] = self.green_side_whole
                self.yellow_history[sum] = self.yellow_side_whole
                img = self.get_face_rep_with_arrow_whole(self.red_side_whole,True,False)
                self.panel_whole = Label(self.root, image=img)
                self.panel_whole.image = img
                self.panel_whole.place(x=self.iter_x*150,y=700+self.iter_y*100,in_=self.root)

                temp1 = [self.green_side_whole[2],self.green_side_whole[5],self.green_side_whole[8]]
                self.green_side_whole[2],self.green_side_whole[5],self.green_side_whole[8] = self.yellow_side_whole[2],self.yellow_side_whole[5],self.yellow_side_whole[8]
                self.yellow_side_whole[2],self.yellow_side_whole[5],self.yellow_side_whole[8] = self.blue_side_whole[6],self.blue_side_whole[3],self.blue_side_whole[0]
                self.blue_side_whole[6],self.blue_side_whole[3],self.blue_side_whole[0] = self.white_side_whole[2],self.white_side_whole[5],self.white_side_whole[8]
                self.white_side_whole[2],self.white_side_whole[5],self.white_side_whole[8] = temp1[0],temp1[1],temp1[2]
                temp2 = self.red_side_whole
                self.red_side_whole = [temp2[6],temp2[3],temp2[0],temp2[7],temp2[4],temp2[1],temp2[8],temp2[5],temp2[2]]
                #self.update_grid_status_whole()
                self.iter_x+=1

            elif self.sollution_whole[0] == "R2":
                self.white_history[sum] = self.white_side_whole
                self.red_history[sum] = self.red_side_whole
                self.orange_history[sum] = self.orange_side_whole
                self.blue_history[sum] = self.blue_side_whole
                self.green_history[sum] = self.green_side_whole
                self.yellow_history[sum] = self.yellow_side_whole
                img = self.get_face_rep_with_arrow_whole(self.red_side_whole,True,True)
                self.panel_whole = Label(self.root, image=img)
                self.panel_whole.image = img
                self.panel_whole.place(x=self.iter_x*150,y=700+self.iter_y*100,in_=self.root)

                temp1 = [self.green_side_whole[2],self.green_side_whole[5],self.green_side_whole[8]]
                temp2 = [self.white_side_whole[2],self.white_side_whole[5],self.white_side_whole[8]]
                self.green_side_whole[2],self.green_side_whole[5],self.green_side_whole[8] = self.blue_side_whole[6],self.blue_side_whole[3],self.blue_side_whole[0]
                self.white_side_whole[2],self.white_side_whole[5],self.white_side_whole[8] = self.yellow_side_whole[2],self.yellow_side_whole[5],self.yellow_side_whole[8]
                self.blue_side_whole[6],self.blue_side_whole[3],self.blue_side_whole[0] = temp1[0],temp1[1],temp1[2]
                self.yellow_side_whole[2],self.yellow_side_whole[5],self.yellow_side_whole[8] = temp2[0],temp2[1],temp2[2]
                temp3 = self.red_side_whole
                self.red_side_whole = [temp3[8],temp3[7],temp3[6],temp3[5],temp3[4],temp3[3],temp3[2],temp3[1],temp3[0]]
                #self.update_grid_status_whole()
                self.iter_x+=1

            elif self.sollution_whole[0] == "R'":
                self.white_history[sum] = self.white_side_whole
                self.red_history[sum] = self.red_side_whole
                self.orange_history[sum] = self.orange_side_whole
                self.blue_history[sum] = self.blue_side_whole
                self.green_history[sum] = self.green_side_whole
                self.yellow_history[sum] = self.yellow_side_whole
                img = self.get_face_rep_with_arrow_whole(self.red_side_whole,False,False)
                self.panel_whole = Label(self.root, image=img)
                self.panel_whole.image = img
                self.panel_whole.place(x=self.iter_x*150,y=700+self.iter_y*100,in_=self.root) 

                temp1 = [self.green_side_whole[2],self.green_side_whole[5],self.green_side_whole[8]]
                self.green_side_whole[2],self.green_side_whole[5],self.green_side_whole[8] = self.white_side_whole[2],self.white_side_whole[5],self.white_side_whole[8]
                self.white_side_whole[2],self.white_side_whole[5],self.white_side_whole[8] = self.blue_side_whole[6],self.blue_side_whole[3],self.blue_side_whole[0]
                self.blue_side_whole[6],self.blue_side_whole[3],self.blue_side_whole[0] = self.yellow_side_whole[2],self.yellow_side_whole[5],self.yellow_side_whole[8]
                self.yellow_side_whole[2],self.yellow_side_whole[5],self.yellow_side_whole[8] = temp1[0],temp1[1],temp1[2]
                temp2 = self.red_side_whole
                self.red_side_whole = [temp2[2],temp2[5],temp2[8],temp2[1],temp2[4],temp2[7],temp2[0],temp2[3],temp2[6]]
                #self.update_grid_status_whole()
                self.iter_x+=1




            elif self.sollution_whole[0] == "L":
                self.white_history[sum] = self.white_side_whole
                self.red_history[sum] = self.red_side_whole
                self.orange_history[sum] = self.orange_side_whole
                self.blue_history[sum] = self.blue_side_whole
                self.green_history[sum] = self.green_side_whole
                self.yellow_history[sum] = self.yellow_side_whole
                img = self.get_face_rep_with_arrow_whole(self.orange_side_whole,True,False)
                self.panel_whole = Label(self.root, image=img)
                self.panel_whole.image = img
                self.panel_whole.place(x=self.iter_x*150,y=700+self.iter_y*100,in_=self.root)

                temp1 = [self.green_side_whole[0],self.green_side_whole[3],self.green_side_whole[6]]
                self.green_side_whole[0],self.green_side_whole[3],self.green_side_whole[6] = self.white_side_whole[0],self.white_side_whole[3],self.white_side_whole[6]
                self.white_side_whole[0],self.white_side_whole[3],self.white_side_whole[6] = self.blue_side_whole[8],self.blue_side_whole[5],self.blue_side_whole[2]
                self.blue_side_whole[8],self.blue_side_whole[5],self.blue_side_whole[2] = self.yellow_side_whole[0],self.yellow_side_whole[3],self.yellow_side_whole[6]
                self.yellow_side_whole[0],self.yellow_side_whole[3],self.yellow_side_whole[6] = temp1[0],temp1[1],temp1[2]
                temp2 = self.orange_side_whole
                self.orange_side_whole = [temp2[6],temp2[3],temp2[0],temp2[7],temp2[4],temp2[1],temp2[8],temp2[5],temp2[2]]
                #self.update_grid_status_whole()
                self.iter_x+=1

            elif self.sollution_whole[0] == "L2":
                self.white_history[sum] = self.white_side_whole
                self.red_history[sum] = self.red_side_whole
                self.orange_history[sum] = self.orange_side_whole
                self.blue_history[sum] = self.blue_side_whole
                self.green_history[sum] = self.green_side_whole
                self.yellow_history[sum] = self.yellow_side_whole
                img = self.get_face_rep_with_arrow_whole(self.orange_side_whole,True,True)
                self.panel_whole = Label(self.root, image=img)
                self.panel_whole.image = img
                self.panel_whole.place(x=self.iter_x*150,y=700+self.iter_y*100,in_=self.root)

                temp1 = [self.green_side_whole[0],self.green_side_whole[3],self.green_side_whole[6]]
                temp2 = [self.white_side_whole[0],self.white_side_whole[3],self.white_side_whole[6]]
                self.green_side_whole[0],self.green_side_whole[3],self.green_side_whole[6] = self.blue_side_whole[8],self.blue_side_whole[5],self.blue_side_whole[2]
                self.white_side_whole[0],self.white_side_whole[3],self.white_side_whole[6] =  self.yellow_side_whole[0],self.yellow_side_whole[3],self.yellow_side_whole[6]
                self.blue_side_whole[8],self.blue_side_whole[5],self.blue_side_whole[2] = temp1[0],temp1[1],temp1[2]
                self.yellow_side_whole[0],self.yellow_side_whole[3],self.yellow_side_whole[6] = temp2[0],temp2[1],temp2[2]
                temp3 = self.orange_side_whole
                self.orange_side_whole = [temp3[8],temp3[7],temp3[6],temp3[5],temp3[4],temp3[3],temp3[2],temp3[1],temp3[0]]
                #self.update_grid_status_whole()
                self.iter_x+=1

            elif self.sollution_whole[0] == "L'":
                self.white_history[sum] = self.white_side_whole
                self.red_history[sum] = self.red_side_whole
                self.orange_history[sum] = self.orange_side_whole
                self.blue_history[sum] = self.blue_side_whole
                self.green_history[sum] = self.green_side_whole
                self.yellow_history[sum] = self.yellow_side_whole
                img = self.get_face_rep_with_arrow_whole(self.orange_side_whole,False,False)
                self.panel_whole = Label(self.root, image=img)
                self.panel_whole.image = img
                self.panel_whole.place(x=self.iter_x*150,y=700+self.iter_y*100,in_=self.root)

                temp1 = [self.green_side_whole[0],self.green_side_whole[3],self.green_side_whole[6]]
                self.green_side_whole[0],self.green_side_whole[3],self.green_side_whole[6] = self.yellow_side_whole[0],self.yellow_side_whole[3],self.yellow_side_whole[6]
                self.yellow_side_whole[0],self.yellow_side_whole[3],self.yellow_side_whole[6] = self.blue_side_whole[8],self.blue_side_whole[5],self.blue_side_whole[2]
                self.blue_side_whole[8],self.blue_side_whole[5],self.blue_side_whole[2] = self.white_side_whole[0],self.white_side_whole[3],self.white_side_whole[6]
                self.white_side_whole[0],self.white_side_whole[3],self.white_side_whole[6] = temp1[0],temp1[1],temp1[2]
                temp2 = self.orange_side_whole
                self.orange_side_whole =  [temp2[2],temp2[5],temp2[8],temp2[1],temp2[4],temp2[7],temp2[0],temp2[3],temp2[6]]
                #self.update_grid_status_whole()
                self.iter_x+=1




            elif self.sollution_whole[0] == "B":
                self.white_history[sum] = self.white_side_whole
                self.red_history[sum] = self.red_side_whole
                self.orange_history[sum] = self.orange_side_whole
                self.blue_history[sum] = self.blue_side_whole
                self.green_history[sum] = self.green_side_whole
                self.yellow_history[sum] = self.yellow_side_whole
                img = self.get_face_rep_with_arrow_whole(self.blue_side_whole,True,False)
                self.panel_whole = Label(self.root, image=img)
                self.panel_whole.image = img
                self.panel_whole.place(x=self.iter_x*150,y=700+self.iter_y*100,in_=self.root)

                temp1 = [self.white_side_whole[2],self.white_side_whole[1],self.white_side_whole[0]]
                self.white_side_whole[2],self.white_side_whole[1],self.white_side_whole[0] = self.red_side_whole[8],self.red_side_whole[5],self.red_side_whole[2]
                self.red_side_whole[8],self.red_side_whole[5],self.red_side_whole[2] = self.yellow_side_whole[6],self.yellow_side_whole[7],self.yellow_side_whole[8]
                self.yellow_side_whole[6],self.yellow_side_whole[7],self.yellow_side_whole[8] = self.orange_side_whole[0],self.orange_side_whole[3],self.orange_side_whole[6]
                self.orange_side_whole[0],self.orange_side_whole[3],self.orange_side_whole[6] = temp1[0],temp1[1],temp1[2]
                temp2 = self.blue_side_whole
                self.blue_side_whole = [temp2[6],temp2[3],temp2[0],temp2[7],temp2[4],temp2[1],temp2[8],temp2[5],temp2[2]]
                #self.update_grid_status_whole()
                self.iter_x+=1
                
            elif self.sollution_whole[0] == "B2":
                self.white_history[sum] = self.white_side_whole
                self.red_history[sum] = self.red_side_whole
                self.orange_history[sum] = self.orange_side_whole
                self.blue_history[sum] = self.blue_side_whole
                self.green_history[sum] = self.green_side_whole
                self.yellow_history[sum] = self.yellow_side_whole
                img = self.get_face_rep_with_arrow_whole(self.blue_side_whole,True,True)
                self.panel_whole = Label(self.root, image=img)
                self.panel_whole.image = img
                self.panel_whole.place(x=self.iter_x*150,y=700+self.iter_y*100,in_=self.root)

                temp1 = [self.white_side_whole[2],self.white_side_whole[1],self.white_side_whole[0]]
                temp2 = [self.red_side_whole[8],self.red_side_whole[5],self.red_side_whole[2]]
                self.white_side_whole[2],self.white_side_whole[1],self.white_side_whole[0] = self.yellow_side_whole[6],self.yellow_side_whole[7],self.yellow_side_whole[8]
                self.red_side_whole[8],self.red_side_whole[5],self.red_side_whole[2] =  self.orange_side_whole[0],self.orange_side_whole[3],self.orange_side_whole[6]
                self.yellow_side_whole[6],self.yellow_side_whole[7],self.yellow_side_whole[8] = temp1[0],temp1[1],temp1[2]
                self.orange_side_whole[0],self.orange_side_whole[3],self.orange_side_whole[6] = temp2[0],temp2[1],temp2[2]
                temp3 = self.blue_side_whole
                self.blue_side_whole = [temp3[8],temp3[7],temp3[6],temp3[5],temp3[4],temp3[3],temp3[2],temp3[1],temp3[0]]
                #self.update_grid_status_whole()
                self.iter_x+=1

            elif self.sollution_whole[0] == "B'":
                self.white_history[sum] = self.white_side_whole
                self.red_history[sum] = self.red_side_whole
                self.orange_history[sum] = self.orange_side_whole
                self.blue_history[sum] = self.blue_side_whole
                self.green_history[sum] = self.green_side_whole
                self.yellow_history[sum] = self.yellow_side_whole
                img = self.get_face_rep_with_arrow_whole(self.blue_side_whole,False,False)
                self.panel_whole = Label(self.root, image=img)
                self.panel_whole.image = img
                self.panel_whole.place(x=self.iter_x*150,y=700+self.iter_y*100,in_=self.root)                

                temp1 = [self.white_side_whole[2],self.white_side_whole[1],self.white_side_whole[0]]
                self.white_side_whole[2],self.white_side_whole[1],self.white_side_whole[0] = self.orange_side_whole[0],self.orange_side_whole[3],self.orange_side_whole[6]
                self.orange_side_whole[0],self.orange_side_whole[3],self.orange_side_whole[6] = self.yellow_side_whole[6],self.yellow_side_whole[7],self.yellow_side_whole[8]
                self.yellow_side_whole[6],self.yellow_side_whole[7],self.yellow_side_whole[8] = self.red_side_whole[8],self.red_side_whole[5],self.red_side_whole[2]
                self.red_side_whole[8],self.red_side_whole[5],self.red_side_whole[2] = temp1[0],temp1[1],temp1[2]
                temp2 = self.blue_side_whole
                self.blue_side_whole =  [temp2[2],temp2[5],temp2[8],temp2[1],temp2[4],temp2[7],temp2[0],temp2[3],temp2[6]]
                #self.update_grid_status_whole()
                self.iter_x+=1



            elif self.sollution_whole[0] == "F":
                self.white_history[sum] = self.white_side_whole
                self.red_history[sum] = self.red_side_whole
                self.orange_history[sum] = self.orange_side_whole
                self.blue_history[sum] = self.blue_side_whole
                self.green_history[sum] = self.green_side_whole
                self.yellow_history[sum] = self.yellow_side_whole
                img = self.get_face_rep_with_arrow_whole(self.green_side_whole,True,False)
                self.panel_whole = Label(self.root, image=img)
                self.panel_whole.image = img
                self.panel_whole.place(x=self.iter_x*150,y=700+self.iter_y*100,in_=self.root)

                temp1 = [self.white_side_whole[6],self.white_side_whole[7],self.white_side_whole[8]]
                self.white_side_whole[6],self.white_side_whole[7],self.white_side_whole[8] = self.orange_side_whole[8],self.orange_side_whole[5],self.orange_side_whole[2]
                self.orange_side_whole[8],self.orange_side_whole[5],self.orange_side_whole[2] = self.yellow_side_whole[2],self.yellow_side_whole[1],self.yellow_side_whole[0]
                self.yellow_side_whole[2],self.yellow_side_whole[1],self.yellow_side_whole[0] = self.red_side_whole[0],self.red_side_whole[3],self.red_side_whole[6]
                self.red_side_whole[0],self.red_side_whole[3],self.red_side_whole[6] = temp1[0],temp1[1],temp1[2]
                temp2 = self.green_side_whole
                self.green_side_whole = [temp2[6],temp2[3],temp2[0],temp2[7],temp2[4],temp2[1],temp2[8],temp2[5],temp2[2]]
                #self.update_grid_status_whole()
                self.iter_x+=1

            elif self.sollution_whole[0] == "F2":
                self.white_history[sum] = self.white_side_whole
                self.red_history[sum] = self.red_side_whole
                self.orange_history[sum] = self.orange_side_whole
                self.blue_history[sum] = self.blue_side_whole
                self.green_history[sum] = self.green_side_whole
                self.yellow_history[sum] = self.yellow_side_whole
                img = self.get_face_rep_with_arrow_whole(self.green_side_whole,True,True)
                self.panel_whole = Label(self.root, image=img)
                self.panel_whole.image = img
                self.panel_whole.place(x=self.iter_x*150,y=700+self.iter_y*100,in_=self.root)

                temp1 = [self.white_side_whole[6],self.white_side_whole[7],self.white_side_whole[8]]
                temp2 = [self.red_side_whole[0],self.red_side_whole[3],self.red_side_whole[6]]
                self.white_side_whole[6],self.white_side_whole[7],self.white_side_whole[8] = self.yellow_side_whole[2],self.yellow_side_whole[1],self.yellow_side_whole[0]
                self.red_side_whole[0],self.red_side_whole[3],self.red_side_whole[6] =  self.orange_side_whole[8],self.orange_side_whole[5],self.orange_side_whole[2]
                self.yellow_side_whole[2],self.yellow_side_whole[1],self.yellow_side_whole[0] = temp1[0],temp1[1],temp1[2]
                self.orange_side_whole[8],self.orange_side_whole[5],self.orange_side_whole[2] = temp2[0],temp2[1],temp2[2]
                temp3 = self.green_side_whole
                self.green_side_whole = [temp3[8],temp3[7],temp3[6],temp3[5],temp3[4],temp3[3],temp3[2],temp3[1],temp3[0]]
                #self.update_grid_status_whole()
                self.iter_x+=1

            elif self.sollution_whole[0] == "F'":
                self.white_history[sum] = self.white_side_whole
                self.red_history[sum] = self.red_side_whole
                self.orange_history[sum] = self.orange_side_whole
                self.blue_history[sum] = self.blue_side_whole
                self.green_history[sum] = self.green_side_whole
                self.yellow_history[sum] = self.yellow_side_whole
                img = self.get_face_rep_with_arrow_whole(self.green_side_whole,False,False)
                self.panel_whole = Label(self.root, image=img)
                self.panel_whole.image = img
                self.panel_whole.place(x=self.iter_x*150,y=700+self.iter_y*100,in_=self.root)

                temp1 = [self.white_side_whole[6],self.white_side_whole[7],self.white_side_whole[8]]
                self.white_side_whole[6],self.white_side_whole[7],self.white_side_whole[8] = self.red_side_whole[0],self.red_side_whole[3],self.red_side_whole[6]
                self.red_side_whole[0],self.red_side_whole[3],self.red_side_whole[6] = self.yellow_side_whole[2],self.yellow_side_whole[1],self.yellow_side_whole[0]
                self.yellow_side_whole[2],self.yellow_side_whole[1],self.yellow_side_whole[0] = self.orange_side_whole[8],self.orange_side_whole[5],self.orange_side_whole[2]
                self.orange_side_whole[8],self.orange_side_whole[5],self.orange_side_whole[2] = temp1[0],temp1[1],temp1[2]
                temp2 = self.green_side_whole
                self.green_side_whole =  [temp2[2],temp2[5],temp2[8],temp2[1],temp2[4],temp2[7],temp2[0],temp2[3],temp2[6]]
                #self.update_grid_status_whole()
                self.iter_x+=1





            elif self.sollution_whole[0] == "D":
                self.white_history[sum] = self.white_side_whole
                self.red_history[sum] = self.red_side_whole
                self.orange_history[sum] = self.orange_side_whole
                self.blue_history[sum] = self.blue_side_whole
                self.green_history[sum] = self.green_side_whole
                self.yellow_history[sum] = self.yellow_side_whole
                img = self.get_face_rep_with_arrow_whole(self.yellow_side_whole,True,False)
                self.panel_whole = Label(self.root, image=img)
                self.panel_whole.image = img
                self.panel_whole.place(x=self.iter_x*150,y=700+self.iter_y*100,in_=self.root)

                temp1 = [self.green_side_whole[6],self.green_side_whole[7],self.green_side_whole[8]]
                self.green_side_whole[6],self.green_side_whole[7],self.green_side_whole[8] = self.orange_side_whole[6],self.orange_side_whole[7],self.orange_side_whole[8]
                self.orange_side_whole[6],self.orange_side_whole[7],self.orange_side_whole[8] = self.blue_side_whole[6],self.blue_side_whole[7],self.blue_side_whole[8]
                self.blue_side_whole[6],self.blue_side_whole[7],self.blue_side_whole[8] = self.red_side_whole[6],self.red_side_whole[7],self.red_side_whole[8]
                self.red_side_whole[6],self.red_side_whole[7],self.red_side_whole[8] = temp1[0],temp1[1],temp1[2]
                temp2 = self.yellow_side_whole
                self.yellow_side_whole = [temp2[6],temp2[3],temp2[0],temp2[7],temp2[4],temp2[1],temp2[8],temp2[5],temp2[2]]
                #self.update_grid_status_whole()
                self.iter_x+=1

            elif self.sollution_whole[0] == "D2":
                self.white_history[sum] = self.white_side_whole
                self.red_history[sum] = self.red_side_whole
                self.orange_history[sum] = self.orange_side_whole
                self.blue_history[sum] = self.blue_side_whole
                self.green_history[sum] = self.green_side_whole
                self.yellow_history[sum] = self.yellow_side_whole
                img = self.get_face_rep_with_arrow_whole(self.yellow_side_whole,True,True)
                self.panel_whole = Label(self.root, image=img)
                self.panel_whole.image = img
                self.panel_whole.place(x=self.iter_x*150,y=700+self.iter_y*100,in_=self.root)

                temp1 = [self.green_side_whole[6],self.green_side_whole[7],self.green_side_whole[8]]
                temp2 = [self.red_side_whole[6],self.red_side_whole[7],self.red_side_whole[8]]
                self.green_side_whole[6],self.green_side_whole[7],self.green_side_whole[8] = self.blue_side_whole[6],self.blue_side_whole[7],self.blue_side_whole[8]
                self.red_side_whole[6],self.red_side_whole[7],self.red_side_whole[8] = self.orange_side_whole[6],self.orange_side_whole[7],self.orange_side_whole[8]
                self.blue_side_whole[6],self.blue_side_whole[7],self.blue_side_whole[8] = temp1[0],temp1[1],temp1[2]
                self.orange_side_whole[6],self.orange_side_whole[7],self.orange_side_whole[8] = temp2[0],temp2[1],temp2[2]
                temp3 = self.yellow_side_whole
                self.yellow_side_whole = [temp3[8],temp3[7],temp3[6],temp3[5],temp3[4],temp3[3],temp3[2],temp3[1],temp3[0]]
                #self.update_grid_status_whole()
                self.iter_x+=1
                
            elif self.sollution_whole[0] == "D'":
                self.white_history[sum] = self.white_side_whole
                self.red_history[sum] = self.red_side_whole
                self.orange_history[sum] = self.orange_side_whole
                self.blue_history[sum] = self.blue_side_whole
                self.green_history[sum] = self.green_side_whole
                self.yellow_history[sum] = self.yellow_side_whole
                img = self.get_face_rep_with_arrow_whole(self.yellow_side_whole,False,False)
                self.panel_whole = Label(self.root, image=img)
                self.panel_whole.image = img
                self.panel_whole.place(x=self.iter_x*150,y=700+self.iter_y*100,in_=self.root)

                temp1 = [self.green_side_whole[6],self.green_side_whole[7],self.green_side_whole[8]]
                self.green_side_whole[6],self.green_side_whole[7],self.green_side_whole[8] = self.red_side_whole[6],self.red_side_whole[7],self.red_side_whole[8]
                self.red_side_whole[6],self.red_side_whole[7],self.red_side_whole[8] = self.blue_side_whole[6],self.blue_side_whole[7],self.blue_side_whole[8]
                self.blue_side_whole[6],self.blue_side_whole[7],self.blue_side_whole[8] = self.orange_side_whole[6],self.orange_side_whole[7],self.orange_side_whole[8]
                self.orange_side_whole[6],self.orange_side_whole[7],self.orange_side_whole[8] = temp1[0],temp1[1],temp1[2]
                temp2 = self.yellow_side_whole
                self.yellow_side_whole = [temp2[2],temp2[5],temp2[8],temp2[1],temp2[4],temp2[7],temp2[0],temp2[3],temp2[6]]
                #self.update_grid_status_whole()
                self.iter_x+=1
                
            if self.iter_x == 10:
                self.iter_x = 0
                self.iter_y += 1
            sum+=1
            self.sollution_whole.pop(0)
        #self.update_grid_status()

    def step(self):
        self.update_solve()
        alpha = 1

        # 将图像的alpha通道设置为所需的透明度
        image_with_alpha = cv2.addWeighted(image, alpha, image, 0, 0)
        try:
            self.sollution.pop(0)
        except:
            pass
        #if self.sollution == [] or self.solve_status == False:
            #self.solve_reset()
            
    def update_solve(self):
        try:
            self.panel.destroy()
        except:
            pass
        if self.solve_status and self.sollution != []:
            
            if self.sollution[0] == "U":
                img = self.get_face_rep_with_arrow(self.white_side,True,False)
                self.panel = Label(self.root, image=img)
                self.panel.image = img
                self.panel.place(x=1600,y=270,in_=self.root)

                temp1 = [self.green_side[0],self.green_side[1],self.green_side[2]]
                self.green_side[0],self.green_side[1],self.green_side[2] = self.red_side[0],self.red_side[1],self.red_side[2]
                self.red_side[0],self.red_side[1],self.red_side[2] =self.blue_side[0],self.blue_side[1],self.blue_side[2]
                self.blue_side[0],self.blue_side[1],self.blue_side[2] = self.orange_side[0],self.orange_side[1],self.orange_side[2]
                self.orange_side[0],self.orange_side[1],self.orange_side[2] = temp1[0],temp1[1],temp1[2]
                temp2 = self.white_side
                self.white_side = [temp2[6],temp2[3],temp2[0],temp2[7],temp2[4],temp2[1],temp2[8],temp2[5],temp2[2]]
                self.update_grid_status()
            
            elif self.sollution[0] == "U2":
                img = self.get_face_rep_with_arrow(self.white_side,True,True)
                self.panel = Label(self.root, image=img)
                self.panel.image = img
                self.panel.place(x=1600,y=270,in_=self.root)

                temp1 = [self.green_side[0],self.green_side[1],self.green_side[2]]
                temp2 = [self.red_side[0],self.red_side[1],self.red_side[2]]
                self.green_side[0],self.green_side[1],self.green_side[2] = self.blue_side[0],self.blue_side[1],self.blue_side[2]
                self.red_side[0],self.red_side[1],self.red_side[2] = self.orange_side[0],self.orange_side[1],self.orange_side[2]
                self.blue_side[0],self.blue_side[1],self.blue_side[2] = temp1[0],temp1[1],temp1[2]
                self.orange_side[0],self.orange_side[1],self.orange_side[2] = temp2[0],temp2[1],temp2[2]
                temp3 = self.white_side
                self.white_side = [temp3[8],temp3[7],temp3[6],temp3[5],temp3[4],temp3[3],temp3[2],temp3[1],temp3[0]]
                self.update_grid_status()
            
            elif self.sollution[0] == "U'":
                img = self.get_face_rep_with_arrow(self.white_side,False,False)
                self.panel = Label(self.root, image=img)
                self.panel.image = img
                self.panel.place(x=1600,y=270,in_=self.root)            
                temp1 = [self.green_side[0],self.green_side[1],self.green_side[2]]
                self.green_side[0],self.green_side[1],self.green_side[2] = self.orange_side[0],self.orange_side[1],self.orange_side[2]
                self.orange_side[0],self.orange_side[1],self.orange_side[2] =self.blue_side[0],self.blue_side[1],self.blue_side[2]
                self.blue_side[0],self.blue_side[1],self.blue_side[2] = self.red_side[0],self.red_side[1],self.red_side[2]
                self.red_side[0],self.red_side[1],self.red_side[2] = temp1[0],temp1[1],temp1[2]
                temp2 = self.white_side
                self.white_side = [temp2[2],temp2[5],temp2[8],temp2[1],temp2[4],temp2[7],temp2[0],temp2[3],temp2[6]]
                self.update_grid_status()
            




            elif self.sollution[0] == "R":
                img = self.get_face_rep_with_arrow(self.red_side,True,False)
                self.panel = Label(self.root, image=img)
                self.panel.image = img
                self.panel.place(x=1600,y=270,in_=self.root)

                temp1 = [self.green_side[2],self.green_side[5],self.green_side[8]]
                self.green_side[2],self.green_side[5],self.green_side[8] = self.yellow_side[2],self.yellow_side[5],self.yellow_side[8]
                self.yellow_side[2],self.yellow_side[5],self.yellow_side[8] = self.blue_side[6],self.blue_side[3],self.blue_side[0]
                self.blue_side[6],self.blue_side[3],self.blue_side[0] = self.white_side[2],self.white_side[5],self.white_side[8]
                self.white_side[2],self.white_side[5],self.white_side[8] = temp1[0],temp1[1],temp1[2]
                temp2 = self.red_side
                self.red_side = [temp2[6],temp2[3],temp2[0],temp2[7],temp2[4],temp2[1],temp2[8],temp2[5],temp2[2]]
                self.update_grid_status()

            elif self.sollution[0] == "R2":
                img = self.get_face_rep_with_arrow(self.red_side,True,True)
                self.panel = Label(self.root, image=img)
                self.panel.image = img
                self.panel.place(x=1600,y=270,in_=self.root)

                temp1 = [self.green_side[2],self.green_side[5],self.green_side[8]]
                temp2 = [self.white_side[2],self.white_side[5],self.white_side[8]]
                self.green_side[2],self.green_side[5],self.green_side[8] = self.blue_side[6],self.blue_side[3],self.blue_side[0]
                self.white_side[2],self.white_side[5],self.white_side[8] = self.yellow_side[2],self.yellow_side[5],self.yellow_side[8]
                self.blue_side[6],self.blue_side[3],self.blue_side[0] = temp1[0],temp1[1],temp1[2]
                self.yellow_side[2],self.yellow_side[5],self.yellow_side[8] = temp2[0],temp2[1],temp2[2]
                temp3 = self.red_side
                self.red_side = [temp3[8],temp3[7],temp3[6],temp3[5],temp3[4],temp3[3],temp3[2],temp3[1],temp3[0]]
                self.update_grid_status()

            elif self.sollution[0] == "R'":
                img = self.get_face_rep_with_arrow(self.red_side,False,False)
                self.panel = Label(self.root, image=img)
                self.panel.image = img
                self.panel.place(x=1600,y=270,in_=self.root) 

                temp1 = [self.green_side[2],self.green_side[5],self.green_side[8]]
                self.green_side[2],self.green_side[5],self.green_side[8] = self.white_side[2],self.white_side[5],self.white_side[8]
                self.white_side[2],self.white_side[5],self.white_side[8] = self.blue_side[6],self.blue_side[3],self.blue_side[0]
                self.blue_side[6],self.blue_side[3],self.blue_side[0] = self.yellow_side[2],self.yellow_side[5],self.yellow_side[8]
                self.yellow_side[2],self.yellow_side[5],self.yellow_side[8] = temp1[0],temp1[1],temp1[2]
                temp2 = self.red_side
                self.red_side = [temp2[2],temp2[5],temp2[8],temp2[1],temp2[4],temp2[7],temp2[0],temp2[3],temp2[6]]
                self.update_grid_status()




            elif self.sollution[0] == "L":
                img = self.get_face_rep_with_arrow(self.orange_side,True,False)
                self.panel = Label(self.root, image=img)
                self.panel.image = img
                self.panel.place(x=1600,y=270,in_=self.root)

                temp1 = [self.green_side[0],self.green_side[3],self.green_side[6]]
                self.green_side[0],self.green_side[3],self.green_side[6] = self.white_side[0],self.white_side[3],self.white_side[6]
                self.white_side[0],self.white_side[3],self.white_side[6] = self.blue_side[8],self.blue_side[5],self.blue_side[2]
                self.blue_side[8],self.blue_side[5],self.blue_side[2] = self.yellow_side[0],self.yellow_side[3],self.yellow_side[6]
                self.yellow_side[0],self.yellow_side[3],self.yellow_side[6] = temp1[0],temp1[1],temp1[2]
                temp2 = self.orange_side
                self.orange_side = [temp2[6],temp2[3],temp2[0],temp2[7],temp2[4],temp2[1],temp2[8],temp2[5],temp2[2]]
                self.update_grid_status()

            elif self.sollution[0] == "L2":
                img = self.get_face_rep_with_arrow(self.orange_side,True,True)
                self.panel = Label(self.root, image=img)
                self.panel.image = img
                self.panel.place(x=1600,y=270,in_=self.root)

                temp1 = [self.green_side[0],self.green_side[3],self.green_side[6]]
                temp2 = [self.white_side[0],self.white_side[3],self.white_side[6]]
                self.green_side[0],self.green_side[3],self.green_side[6] = self.blue_side[8],self.blue_side[5],self.blue_side[2]
                self.white_side[0],self.white_side[3],self.white_side[6] =  self.yellow_side[0],self.yellow_side[3],self.yellow_side[6]
                self.blue_side[8],self.blue_side[5],self.blue_side[2] = temp1[0],temp1[1],temp1[2]
                self.yellow_side[0],self.yellow_side[3],self.yellow_side[6] = temp2[0],temp2[1],temp2[2]
                temp3 = self.orange_side
                self.orange_side = [temp3[8],temp3[7],temp3[6],temp3[5],temp3[4],temp3[3],temp3[2],temp3[1],temp3[0]]
                self.update_grid_status()

            elif self.sollution[0] == "L'":
                img = self.get_face_rep_with_arrow(self.orange_side,False,False)
                self.panel = Label(self.root, image=img)
                self.panel.image = img
                self.panel.place(x=1600,y=270,in_=self.root)

                temp1 = [self.green_side[0],self.green_side[3],self.green_side[6]]
                self.green_side[0],self.green_side[3],self.green_side[6] = self.yellow_side[0],self.yellow_side[3],self.yellow_side[6]
                self.yellow_side[0],self.yellow_side[3],self.yellow_side[6] = self.blue_side[8],self.blue_side[5],self.blue_side[2]
                self.blue_side[8],self.blue_side[5],self.blue_side[2] = self.white_side[0],self.white_side[3],self.white_side[6]
                self.white_side[0],self.white_side[3],self.white_side[6] = temp1[0],temp1[1],temp1[2]
                temp2 = self.orange_side
                self.orange_side =  [temp2[2],temp2[5],temp2[8],temp2[1],temp2[4],temp2[7],temp2[0],temp2[3],temp2[6]]
                self.update_grid_status()




            elif self.sollution[0] == "B":
                img = self.get_face_rep_with_arrow(self.blue_side,True,False)
                self.panel = Label(self.root, image=img)
                self.panel.image = img
                self.panel.place(x=1600,y=270,in_=self.root)

                temp1 = [self.white_side[2],self.white_side[1],self.white_side[0]]
                self.white_side[2],self.white_side[1],self.white_side[0] = self.red_side[8],self.red_side[5],self.red_side[2]
                self.red_side[8],self.red_side[5],self.red_side[2] = self.yellow_side[6],self.yellow_side[7],self.yellow_side[8]
                self.yellow_side[6],self.yellow_side[7],self.yellow_side[8] = self.orange_side[0],self.orange_side[3],self.orange_side[6]
                self.orange_side[0],self.orange_side[3],self.orange_side[6] = temp1[0],temp1[1],temp1[2]
                temp2 = self.blue_side
                self.blue_side = [temp2[6],temp2[3],temp2[0],temp2[7],temp2[4],temp2[1],temp2[8],temp2[5],temp2[2]]
                self.update_grid_status()
            elif self.sollution[0] == "B2":
                img = self.get_face_rep_with_arrow(self.blue_side,True,True)
                self.panel = Label(self.root, image=img)
                self.panel.image = img
                self.panel.place(x=1600,y=270,in_=self.root)

                temp1 = [self.white_side[2],self.white_side[1],self.white_side[0]]
                temp2 = [self.red_side[8],self.red_side[5],self.red_side[2]]
                self.white_side[2],self.white_side[1],self.white_side[0] = self.yellow_side[6],self.yellow_side[7],self.yellow_side[8]
                self.red_side[8],self.red_side[5],self.red_side[2] =  self.orange_side[0],self.orange_side[3],self.orange_side[6]
                self.yellow_side[6],self.yellow_side[7],self.yellow_side[8] = temp1[0],temp1[1],temp1[2]
                self.orange_side[0],self.orange_side[3],self.orange_side[6] = temp2[0],temp2[1],temp2[2]
                temp3 = self.blue_side
                self.blue_side = [temp3[8],temp3[7],temp3[6],temp3[5],temp3[4],temp3[3],temp3[2],temp3[1],temp3[0]]
                self.update_grid_status()

            elif self.sollution[0] == "B'":
                img = self.get_face_rep_with_arrow(self.blue_side,False,False)
                self.panel = Label(self.root, image=img)
                self.panel.image = img
                self.panel.place(x=1600,y=270,in_=self.root)                

                temp1 = [self.white_side[2],self.white_side[1],self.white_side[0]]
                self.white_side[2],self.white_side[1],self.white_side[0] = self.orange_side[0],self.orange_side[3],self.orange_side[6]
                self.orange_side[0],self.orange_side[3],self.orange_side[6] = self.yellow_side[6],self.yellow_side[7],self.yellow_side[8]
                self.yellow_side[6],self.yellow_side[7],self.yellow_side[8] = self.red_side[8],self.red_side[5],self.red_side[2]
                self.red_side[8],self.red_side[5],self.red_side[2] = temp1[0],temp1[1],temp1[2]
                temp2 = self.blue_side
                self.blue_side =  [temp2[2],temp2[5],temp2[8],temp2[1],temp2[4],temp2[7],temp2[0],temp2[3],temp2[6]]
                self.update_grid_status()




            elif self.sollution[0] == "F":
                img = self.get_face_rep_with_arrow(self.green_side,True,False)
                self.panel = Label(self.root, image=img)
                self.panel.image = img
                self.panel.place(x=1600,y=270,in_=self.root)

                temp1 = [self.white_side[6],self.white_side[7],self.white_side[8]]
                self.white_side[6],self.white_side[7],self.white_side[8] = self.orange_side[8],self.orange_side[5],self.orange_side[2]
                self.orange_side[8],self.orange_side[5],self.orange_side[2] = self.yellow_side[2],self.yellow_side[1],self.yellow_side[0]
                self.yellow_side[2],self.yellow_side[1],self.yellow_side[0] = self.red_side[0],self.red_side[3],self.red_side[6]
                self.red_side[0],self.red_side[3],self.red_side[6] = temp1[0],temp1[1],temp1[2]
                temp2 = self.green_side
                self.green_side = [temp2[6],temp2[3],temp2[0],temp2[7],temp2[4],temp2[1],temp2[8],temp2[5],temp2[2]]
                self.update_grid_status()

            elif self.sollution[0] == "F2":
                img = self.get_face_rep_with_arrow(self.green_side,True,True)
                self.panel = Label(self.root, image=img)
                self.panel.image = img
                self.panel.place(x=1600,y=270,in_=self.root)

                temp1 = [self.white_side[6],self.white_side[7],self.white_side[8]]
                temp2 = [self.red_side[0],self.red_side[3],self.red_side[6]]
                self.white_side[6],self.white_side[7],self.white_side[8] = self.yellow_side[2],self.yellow_side[1],self.yellow_side[0]
                self.red_side[0],self.red_side[3],self.red_side[6] =  self.orange_side[8],self.orange_side[5],self.orange_side[2]
                self.yellow_side[2],self.yellow_side[1],self.yellow_side[0] = temp1[0],temp1[1],temp1[2]
                self.orange_side[8],self.orange_side[5],self.orange_side[2] = temp2[0],temp2[1],temp2[2]
                temp3 = self.green_side
                self.green_side = [temp3[8],temp3[7],temp3[6],temp3[5],temp3[4],temp3[3],temp3[2],temp3[1],temp3[0]]
                self.update_grid_status()

            elif self.sollution[0] == "F'":
                img = self.get_face_rep_with_arrow(self.green_side,False,False)
                self.panel = Label(self.root, image=img)
                self.panel.image = img
                self.panel.place(x=1600,y=270,in_=self.root)

                temp1 = [self.white_side[6],self.white_side[7],self.white_side[8]]
                self.white_side[6],self.white_side[7],self.white_side[8] = self.red_side[0],self.red_side[3],self.red_side[6]
                self.red_side[0],self.red_side[3],self.red_side[6] = self.yellow_side[2],self.yellow_side[1],self.yellow_side[0]
                self.yellow_side[2],self.yellow_side[1],self.yellow_side[0] = self.orange_side[8],self.orange_side[5],self.orange_side[2]
                self.orange_side[8],self.orange_side[5],self.orange_side[2] = temp1[0],temp1[1],temp1[2]
                temp2 = self.green_side
                self.green_side =  [temp2[2],temp2[5],temp2[8],temp2[1],temp2[4],temp2[7],temp2[0],temp2[3],temp2[6]]
                self.update_grid_status()





            elif self.sollution[0] == "D":
                img = self.get_face_rep_with_arrow(self.yellow_side,True,False)
                self.panel = Label(self.root, image=img)
                self.panel.image = img
                self.panel.place(x=1600,y=270,in_=self.root)

                temp1 = [self.green_side[6],self.green_side[7],self.green_side[8]]
                self.green_side[6],self.green_side[7],self.green_side[8] = self.orange_side[6],self.orange_side[7],self.orange_side[8]
                self.orange_side[6],self.orange_side[7],self.orange_side[8] = self.blue_side[6],self.blue_side[7],self.blue_side[8]
                self.blue_side[6],self.blue_side[7],self.blue_side[8] = self.red_side[6],self.red_side[7],self.red_side[8]
                self.red_side[6],self.red_side[7],self.red_side[8] = temp1[0],temp1[1],temp1[2]
                temp2 = self.yellow_side
                self.yellow_side = [temp2[6],temp2[3],temp2[0],temp2[7],temp2[4],temp2[1],temp2[8],temp2[5],temp2[2]]
                self.update_grid_status()

            elif self.sollution[0] == "D2":
                img = self.get_face_rep_with_arrow(self.yellow_side,True,True)
                self.panel = Label(self.root, image=img)
                self.panel.image = img
                self.panel.place(x=1600,y=270,in_=self.root)

                temp1 = [self.green_side[6],self.green_side[7],self.green_side[8]]
                temp2 = [self.red_side[6],self.red_side[7],self.red_side[8]]
                self.green_side[6],self.green_side[7],self.green_side[8] = self.blue_side[6],self.blue_side[7],self.blue_side[8]
                self.red_side[6],self.red_side[7],self.red_side[8] = self.orange_side[6],self.orange_side[7],self.orange_side[8]
                self.blue_side[6],self.blue_side[7],self.blue_side[8] = temp1[0],temp1[1],temp1[2]
                self.orange_side[6],self.orange_side[7],self.orange_side[8] = temp2[0],temp2[1],temp2[2]
                temp3 = self.yellow_side
                self.yellow_side = [temp3[8],temp3[7],temp3[6],temp3[5],temp3[4],temp3[3],temp3[2],temp3[1],temp3[0]]
                self.update_grid_status()

            elif self.sollution[0] == "D'":
                img = self.get_face_rep_with_arrow(self.yellow_side,False,False)
                self.panel = Label(self.root, image=img)
                self.panel.image = img
                self.panel.place(x=1600,y=270,in_=self.root)

                temp1 = [self.green_side[6],self.green_side[7],self.green_side[8]]
                self.green_side[6],self.green_side[7],self.green_side[8] = self.red_side[6],self.red_side[7],self.red_side[8]
                self.red_side[6],self.red_side[7],self.red_side[8] = self.blue_side[6],self.blue_side[7],self.blue_side[8]
                self.blue_side[6],self.blue_side[7],self.blue_side[8] = self.orange_side[6],self.orange_side[7],self.orange_side[8]
                self.orange_side[6],self.orange_side[7],self.orange_side[8] = temp1[0],temp1[1],temp1[2]
                temp2 = self.yellow_side
                self.yellow_side = [temp2[2],temp2[5],temp2[8],temp2[1],temp2[4],temp2[7],temp2[0],temp2[3],temp2[6]]
                self.update_grid_status()
        else:
            try:
                self.panel.destroy()
            except:
                pass

    def solve_cube(self):
        str0 = self.white_str +  self.red_str + self.green_str + self.yellow_str + self.orange_str  + self.blue_str 
        print(str0)
        str1 =[]
        str2 =[]
        str3 =[]
        try:
            str1 = kociemba.solve(str0)
        except:
            pass
        if len(str1)==0:
            self.solve_reset()
        else:
            str2 = str1
            str3 = str1
            self.sollution = str1
            self.sollution = self.sollution.split(" ")
            self.ans =str(len(self.sollution))
        
            self.sollution_whole = str2
            self.sollution_whole = self.sollution_whole.split(" ")

            self.sollution_arm =str3
            self.sollution_arm = self.sollution_arm.split(" ")

            self.solve_status = True
            self.solve_status_whole = True

            print(self.sollution)

            self.update_solve_whole()
            self.go =True

            self.mylabel1 = tk.Label(self.root, text="Total step : ",width=15,height=1) 
            self.mylabel1.place(x=100,y=600,in_=self.root)


            self.mylabel2 = tk.Label(self.root, text=self.ans,width=15,height=1) 
            self.mylabel2.place(x=200,y=600,in_=self.root)

    def __init__(self):
        self.root = Tk()
        self.root.title("Rubik's Cube Solver")
        self.root.geometry("1960x1280")
        self.bridge = CvBridge()
        rospy.Subscriber('/camera/color/image_raw', Image_ros, self.callback)



        self.root.resizable(True, True)
        self.root.protocol("WM_DELETE_WINDOW",self.on_closing)
        
        #self.cap = cv.VideoCapture(2)

        #self.config = rs.config()
        #self.config.enable_stream(rs.stream.depth, 640, 480, rs.format.z16, 30)
        #self.config.enable_stream(rs.stream.color, 640, 480, rs.format.bgr8, 30)
        #self.pipeline = rs.pipeline()
        #self.pipeline.start(self.config)

        self.app = Frame(self.root, bg="blue")
        self.app.place(height=480,width=640,x=900,y=10,in_=self.root)
        
        
        #INS = np.load("INS.npy")
        #RC2G = np.load("RC2G.npy")
        #TC2G = np.load("TC2G.npy")
        #rclpy.init()
        #robot = RobotControl_func_chong.RobotControl_Func()
        #g = gripper.Gripper(1)
        #g.gripper_reset()
        
        self.lmain = Label(self.app)
        self.lmain.grid()

        self.zone1 = LabelFrame(self.root,text="Cube Status")
        self.zone1.config(font=("Arial", 13))
        self.zone1.place(height=650,width=860,x = 20,y = 0)

        self.update_grid_status()

        solve = Button(self.root, text ="Solve",width=15,height=1, command = self.solve_cube,bg="#79FF6B")
        solve.place(x=100,y=480,in_=self.root)

        reset = Button(self.root, text ="Reset",width=15,height=1, command = self.solve_reset,bg="#FF0000")
        reset.place(x=100,y=540,in_=self.root)





        a = tk.StringVar()
        b = tk.StringVar()
        a.set('')

        def show():
            self.move_arm = int(b.get())         # 顯示輸入的文字

        def clear():
            b.set('')               # 設定變數 b 為空字串
            entry.delete(0,'end')   # 清空輸入欄位內容


        entry = tk.Entry(self.root, textvariable=b)   # 放入輸入欄位 ( 變數為 b )
        entry.place(x=300,y=480,in_=self.root)
        btn1 = tk.Button(self.root, text='Enter', command=show)   # 放入顯示按鈕，點擊後執行 show 函式
        btn1.place(x=300,y=520,in_=self.root)
        #btn2 = tk.Button(self.root, text='清除', command=clear)  # 放入清空按鈕，點擊後執行 clear 函式
        #btn2.place(x=100,y=660,in_=self.root)

        #mybutton = QPushButton('完成', self)
        #gridlayout.addWidget(mybutton, 1, 0, 1, 2)
        #mybutton.clicked.connect(self.onButtonClick)
        # self.next = Button(self.root, text ="step",width=15,height=1, command = self.step,bg="#DCDCDC")
        # self.next.place(x=100,y=460,in_=self.root)
 
    #def displayWebcam(self):
 
        # make a video_object and init the video object
        #self.bridge = CvBridge()
        #rospy.Subscriber('/camera/color/image_raw', Image_ros, self.video_stream)
    def callback(self,data):
        self.images = self.bridge.imgmsg_to_cv2(data, "bgr8")
    def get_frame(self):
        return self.images 

    def video_stream(self):
        #isTrue, self.frame1 = self.cap.read()
        #frames = self.pipeline.wait_for_frames()
        #color_frame = frames.get_color_frame()
        #color_image = np.asanyarray(color_frame.get_data())
        #self.images = color_image

        #if not self.firstDone:
            #self.robot.set_TMPos(position_scan)
        if False or self.firstDone_check :
            self.firstDone_check=False
            self.firstDone=False
        if  False or not self.firstDone :
            self.pos = self.robot.get_TMPos()
        #frame,self.cube_list,self.firstRead,self.secondRead,self.firstDone,self.cube_list_whole = detect_grid(self.frame1,isTrue,self.cube_list,self.firstRead,self.secondRead,self.firstDone,self.cube_list_whole)
        frame,self.cube_list,self.firstRead,self.secondRead,self.firstDone,self.cube_list_whole,self.f,self.u,self.l= detect_grid(self.get_frame(),True,self.cube_list,self.firstRead,self.secondRead,self.firstDone,self.cube_list_whole,self.pos)
        
        if  False or self.go :
            self.go =False
            second_thread = threading.Thread(target = self.arm_solve)
            second_thread.start()
        if   False or self.firstDone and (self.first):
            cv2image = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
            img = Image.fromarray(cv2image)
            img = img.resize((200,150))
            self.firstraw = ImageTk.PhotoImage(img)
            self.first =False
            first_thread = threading.Thread(target = self.scan)
            first_thread.start()
            #first_thread.join()
            #self.firstDone = False
        if   self.out :
            self.out =False
            self.first =True
        cv2image = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        img = Image.fromarray(cv2image)
        imgtk = ImageTk.PhotoImage(img)
        self.lmain.imgtk = imgtk
        self.lmain.configure(image=imgtk)
        self.lmain.after(30,self.video_stream)
        
        if  len(self.cube_list)!=0:
                cv2image = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
                img = Image.fromarray(cv2image)
                img = img.resize((200,150))
                self.secondraw = ImageTk.PhotoImage(img)
                j=0
                self.yellow_side_whole[0] = self.cube_list_whole[47]
                self.yellow_side[0] = self.cube_list[47]
                self.yellow_side_whole[1] = self.cube_list_whole[50]
                self.yellow_side[1] = self.cube_list[50]
                self.yellow_side_whole[2] = self.cube_list_whole[53]
                self.yellow_side[2] = self.cube_list[53]
                self.yellow_side_whole[3] = self.cube_list_whole[46]
                self.yellow_side[3] = self.cube_list[46]
                self.yellow_side_whole[4] = self.cube_list_whole[49]
                self.yellow_side[4] = self.cube_list[49]
                self.yellow_side_whole[5] = self.cube_list_whole[52]
                self.yellow_side[5] = self.cube_list[52]
                self.yellow_side_whole[6] = self.cube_list_whole[45]
                self.yellow_side[6] = self.cube_list[45]
                self.yellow_side_whole[7] = self.cube_list_whole[48]
                self.yellow_side[7] = self.cube_list[48]
                self.yellow_side_whole[8] = self.cube_list_whole[51]
                self.yellow_side[8] = self.cube_list[51]

                self.white_side_whole[0] = self.cube_list_whole[6]
                self.white_side[0] = self.cube_list[6] 
                self.white_side_whole[1] = self.cube_list_whole[3]
                self.white_side[1] = self.cube_list[3]
                self.white_side_whole[2] = self.cube_list_whole[0]
                self.white_side[2] = self.cube_list[0]
                self.white_side_whole[3] = self.cube_list_whole[7]
                self.white_side[3] = self.cube_list[7]
                self.white_side_whole[4] = self.cube_list_whole[4]
                self.white_side[4] = self.cube_list[4]
                self.white_side_whole[5] = self.cube_list_whole[1]
                self.white_side[5] = self.cube_list[1]
                self.white_side_whole[6] = self.cube_list_whole[8]
                self.white_side[6] = self.cube_list[8]
                self.white_side_whole[7] = self.cube_list_whole[5]
                self.white_side[7] = self.cube_list[5]
                self.white_side_whole[8] = self.cube_list_whole[2]
                self.white_side[8] = self.cube_list[2]
                for i in range(len(self.cube_list)):
                    if i<18 and i>=9:
                       self.blue_side_whole[j] = self.cube_list_whole[i]
                       self.blue_side[j] = self.cube_list[i]
                    elif i<27:
                       self.orange_side_whole[j] = self.cube_list_whole[i]
                       self.orange_side[j] = self.cube_list[i]
                    elif i<36:
                       self.green_side_whole[j] = self.cube_list_whole[i]
                       self.green_side[j] = self.cube_list[i]
                    elif i<45:
                       self.red_side_whole[j] = self.cube_list_whole[i]
                       self.red_side[j] = self.cube_list[i]


                    j+=1
                    j%=9
                str_copy_white = ""
                for i in range(len(self.white_side)):
                          if self.white_side[i] == 0:
                           str_copy_white+="F"
                          elif self.white_side[i] == 1:
                           str_copy_white+="U"
                          elif self.white_side[i] == 2:
                           str_copy_white+="R"
                          elif self.white_side[i] == 3:
                           str_copy_white+="L"
                          elif self.white_side[i] == 4:
                           str_copy_white+="B"
                          elif self.white_side[i] == 5:
                           str_copy_white+="D"
                self.white_str=str_copy_white
                str_copy_yellow = ""
                for i in range(len(self.yellow_side)):
                          if self.yellow_side[i] == 0:
                           str_copy_yellow+="F"
                          elif self.yellow_side[i] == 1:
                           str_copy_yellow+="U"
                          elif self.yellow_side[i] == 2:
                           str_copy_yellow+="R"
                          elif self.yellow_side[i] == 3:
                           str_copy_yellow+="L"
                          elif self.yellow_side[i] == 4:
                           str_copy_yellow+="B"
                          elif self.yellow_side[i] == 5:
                           str_copy_yellow+="D"
                self.yellow_str=str_copy_yellow
                str_copy_red = ""
                for i in range(len(self.red_side)):
                          if self.red_side[i] == 0:
                           str_copy_red+="F"
                          elif self.red_side[i] == 1:
                           str_copy_red+="U"
                          elif self.red_side[i] == 2:
                           str_copy_red+="R"
                          elif self.red_side[i] == 3:
                           str_copy_red+="L"
                          elif self.red_side[i] == 4:
                           str_copy_red+="B"
                          elif self.red_side[i] == 5:
                           str_copy_red+="D"
                self.red_str=str_copy_red
                str_copy_green = ""
                for i in range(len(self.green_side)):
                          if self.green_side[i] == 0:
                           str_copy_green+="F"
                          elif self.green_side[i] == 1:
                           str_copy_green+="U"
                          elif self.green_side[i] == 2:
                           str_copy_green+="R"
                          elif self.green_side[i] == 3:
                           str_copy_green+="L"
                          elif self.green_side[i] == 4:
                           str_copy_green+="B"
                          elif self.green_side[i] == 5:
                           str_copy_green+="D"
                self.green_str=str_copy_green
                str_copy_orange = ""
                for i in range(len(self.orange_side)):
                          if self.orange_side[i] == 0:
                           str_copy_orange+="F"
                          elif self.orange_side[i] == 1:
                           str_copy_orange+="U"
                          elif self.orange_side[i] == 2:
                           str_copy_orange+="R"
                          elif self.orange_side[i] == 3:
                           str_copy_orange+="L"
                          elif self.orange_side[i] == 4:
                           str_copy_orange+="B"
                          elif self.orange_side[i] == 5:
                           str_copy_orange+="D"
                self.orange_str=str_copy_orange
                str_copy_blue = ""
                for i in range(len(self.blue_side)):
                          if self.blue_side[i] == 0:
                           str_copy_blue+="F"
                          elif self.blue_side[i] == 1:
                           str_copy_blue+="U"
                          elif self.blue_side[i] == 2:
                           str_copy_blue+="R"
                          elif self.blue_side[i] == 3:
                           str_copy_blue+="L"
                          elif self.blue_side[i] == 4:
                           str_copy_blue+="B"
                          elif self.blue_side[i] == 5:
                           str_copy_blue+="D"
                self.blue_str=str_copy_blue
                self.cube_list = []
                self.firstDone = True
                self.firstDone_check = False
                self.firstRead = []
                self.secondRead = []
                self.first = False
                if self.onprocess == True:
                    str0 = self.white_str +  self.red_str + self.green_str + self.yellow_str + self.orange_str  + self.blue_str
                    str1 =[]
                    try:
                        str1 = kociemba.solve(str0)
                    except:
                        pass
                    if len(str1)==0:
                        self.onprocess=True
                        self.firstDone =False
                        self.first =True
                        self.now_state =-1
                    else:
                        res = 0
                        for i in range(30):
                            for j in range (9):

                                if self.blue_side[j] ==self.blue_history[i][j]:
                                    res+=1
                                if self.yellow_side[j] ==self.yellow_history[i][j]:
                                    res+=1
                                if self.orange_side[j] ==self.orange_history[i][j]:
                                    res+=1
                                if self.red_side[j] ==self.red_history[i][j]:
                                    res+=1
                                if self.green_side[j] ==self.green_history[i][j]:
                                    res+=1
                                if self.white_side[j] ==self.white_history[i][j]:
                                    res+=1
                            print(res)
                            if res==54:
                                self.now_state =i
                                break
                            else:
                                self.now_state =-1
                            res = 0
                        self.onprocess=False
                        self.go =True
                        if self.now_state ==-1:
                            self.past_state =-1
                            j = 0
                            i = 0
                            for k in range(22):
                                img = self.reset_face()
                                self.panel_reset = Label(self.root, image=img)
                                self.panel_reset.image = img
                                if i == 10:
                                    j+=1
                                i=i%10
                                self.panel_reset.place(x=i*150,y=700+j*100,in_=self.root)
                                i+=1
                            
                            self.yellow_history =[[-1] * 9] * 30
                            self.white_history =[[-1] * 9] * 30
                            self.blue_history =[[-1] * 9] * 30
                            self.red_history =[[-1] * 9] * 30
                            self.green_history =[[-1] * 9] * 30
                            self.orange_history =[[-1] * 9] * 30
                            self.solve_cube()
                    


                img0 = self.get_face_rep(self.green_side)
                self.panel0 = Label(self.root, image=img0)
                self.panel0.image = img0
                self.panel0.place(x=470,y=240,in_=self.root)

                img1 = self.get_face_rep(self.white_side)
                self.panel1 = Label(self.root, image=img1)
                self.panel1.image = img1
                self.panel1.place(x=470,y=40,in_=self.root)

                img2 = self.get_face_rep(self.red_side)
                self.panel2 = Label(self.root, image=img2)
                self.panel2.image = img2
                self.panel2.place(x=670,y=240,in_=self.root)#370+200

                img3 = self.get_face_rep(self.orange_side)
                self.panel3 = Label(self.root, image=img3)
                self.panel3.image = img3
                self.panel3.place(x=270,y=240,in_=self.root)#370-200

                img4 = self.get_face_rep(self.blue_side)
                self.panel4 = Label(self.root, image=img4)
                self.panel4.image = img4
                self.panel4.place(x=70,y=240,in_=self.root)#

                img5 = self.get_face_rep(self.yellow_side)
                self.panel5 = Label(self.root, image=img5)
                self.panel5.image = img5
                self.panel5.place(x=470,y=440,in_=self.root)

                #img6 = self.firstraw
                #self.panel6 = Label(self.root, image=img6)
                #self.panel6.image = img6
                #self.panel6.place(x=250,y=50,in_=self.root)

                #img7 = self.secondraw
                #self.panel7 = Label(self.root, image=img7)
                #self.panel7.image = img7
                #self.panel7.place(x=50,y=50,in_=self.root)
                if self.f == "yellow":
                    self.b = "white"
                elif self.f =="green":
                    self.b = "blue"
                elif self.f =="orange":
                    self.b = "red"
                elif self.f =="white":
                    self.b = "yellow"
                elif self.f =="blue":
                    self.b = "green"
                elif self.f =="red":
                    self.b = "orange"

                if self.u == "yellow":
                    self.d = "white"
                elif self.u =="green":
                    self.d = "blue"
                elif self.u =="orange":
                    self.d = "red"
                elif self.u =="white":
                    self.d = "yellow"
                elif self.u =="blue":
                    self.d = "green"
                elif self.u =="red":
                    self.d = "orange"


                if self.l == "yellow":
                    self.r = "white"
                elif self.l =="green":
                    self.r = "blue"
                elif self.l =="orange":
                    self.r = "red"
                elif self.l =="white":
                    self.r = "yellow"
                elif self.l =="blue":
                    self.r = "green"
                elif self.l =="red":
                    self.r = "orange"
                self.position=[self.u,self.l,self.r,self.f,self.b,self.d]
                print(self.position)
                time.sleep(2)



    
    def arm_solve(self):
        self.robot.set_TMPos(position_scan_grip_up)
        self.robot.set_TMPos(position_scan_grip)
        self.g.gripper_soft_off()
        print(self.now_state)
        if self.now_state > self.past_state:
            i = self.now_state - self.past_state+1
            for j in range(i):
                self.sollution.pop(0)
                self.sollution_arm.pop(0)
        move=self.move_arm
        while self.sollution_arm != []:
            move =move-1
            third_thread = threading.Thread(target = self.step)
            third_thread.start()
            third_thread.join()
            if self.sollution_arm[0] == "F" or self.sollution_arm[0] == "F'" or self.sollution_arm[0] == "F2":
                if self.position[up] == "green":
                    print(self.position)
                    self.arm_turn()
                elif self.position[front] == "green":#front->right->back->left->front *2 back->up->front->down->back
                    #do arm flip and update position
                    #180rotate +90flip
                    self.place180()
                    self.flip90()

                    temp = self.position[right] 
                    self.position[right] =self.position[front] 
                    temp2 = self.position[back]
                    self.position[back] =temp
                    temp3 = self.position[left]
                    self.position[left] =temp2
                    self.position[front] = temp3 

                    temp = self.position[right] 
                    self.position[right] =self.position[front] 
                    temp2 = self.position[back]
                    self.position[back] =temp
                    temp3 = self.position[left]
                    self.position[left] =temp2
                    self.position[front] = temp3 


                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 


                    print(self.position)
                    self.arm_turn()
                elif self.position[back] == "green":#back->up->front->down->back
                    #do arm flip and update position
                    #90flip
                    self.flip90()
                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    print(self.position)
                    self.arm_turn()
                elif self.position[right] == "green":#front->right->back->left->front back->up->front->down->back
                    #do arm flip and update position
                    #n90rotate + 90flip
                    self.placen90()
                    self.flip90()
                    temp = self.position[right] 
                    self.position[right] =self.position[front] 
                    temp2 = self.position[back]
                    self.position[back] =temp
                    temp3 = self.position[left]
                    self.position[left] =temp2
                    self.position[front] = temp3 

                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 

                    print(self.position)
                    self.arm_turn()
                elif self.position[left] == "green":#front->left->back->right->front back->up->front->down->back
                    #do arm flip and update position
                    #90rotate + 90flip
                    self.place90()
                    self.flip90()

                    temp = self.position[left] 
                    self.position[left] =self.position[front] 
                    temp2 = self.position[back]
                    self.position[back] =temp
                    temp3 = self.position[right]
                    self.position[right] =temp2
                    self.position[front] = temp3 

                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 

                    print(self.position)
                    self.arm_turn()
                elif self.position[down] == "green":#back->up->front->down->back *2
                    #do arm flip and update position
                    #180flip
                    self.flip90()
                    self.flip90()
                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    print(self.position)
                    self.arm_turn()
            


            elif self.sollution_arm[0] == "B" or self.sollution_arm[0] == "B'" or self.sollution_arm[0] == "B2":
                if self.position[up] == "blue":
                    print(self.position)
                    self.arm_turn()
                elif self.position[front] == "blue":
                    #do arm flip and update position
                    self.place180()
                    self.flip90()
                    temp = self.position[right] 
                    self.position[right] =self.position[front] 
                    temp2 = self.position[back]
                    self.position[back] =temp
                    temp3 = self.position[left]
                    self.position[left] =temp2
                    self.position[front] = temp3 

                    temp = self.position[right] 
                    self.position[right] =self.position[front] 
                    temp2 = self.position[back]
                    self.position[back] =temp
                    temp3 = self.position[left]
                    self.position[left] =temp2
                    self.position[front] = temp3 


                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    print(self.position)
                    self.arm_turn()
                elif self.position[back] == "blue":
                    #do arm flip and update position
                    self.flip90()
                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    print(self.position)
                    self.arm_turn()
                elif self.position[right] == "blue":
                    #do arm flip and update position
                    self.placen90()
                    self.flip90()
                    temp = self.position[right] 
                    self.position[right] =self.position[front] 
                    temp2 = self.position[back]
                    self.position[back] =temp
                    temp3 = self.position[left]
                    self.position[left] =temp2
                    self.position[front] = temp3 

                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    print(self.position)
                    self.arm_turn()
                elif self.position[left] == "blue":
                    #do arm flip and update position
                    self.place90()
                    self.flip90()
                    temp = self.position[left] 
                    self.position[left] =self.position[front] 
                    temp2 = self.position[back]
                    self.position[back] =temp
                    temp3 = self.position[right]
                    self.position[right] =temp2
                    self.position[front] = temp3 

                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    print(self.position)
                    self.arm_turn()
                elif self.position[down] == "blue":
                    #do arm flip and update position
                    self.flip90()
                    self.flip90()
                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    print(self.position)
                    self.arm_turn()

            elif self.sollution_arm[0] == "R" or self.sollution_arm[0] == "R'" or self.sollution_arm[0] == "R2":
                if self.position[up] == "red":
                    print(self.position)
                    self.arm_turn()
                elif self.position[front] == "red":
                    #do arm flip and update position
                    self.place180()
                    self.flip90()
                    temp = self.position[right] 
                    self.position[right] =self.position[front] 
                    temp2 = self.position[back]
                    self.position[back] =temp
                    temp3 = self.position[left]
                    self.position[left] =temp2
                    self.position[front] = temp3 

                    temp = self.position[right] 
                    self.position[right] =self.position[front] 
                    temp2 = self.position[back]
                    self.position[back] =temp
                    temp3 = self.position[left]
                    self.position[left] =temp2
                    self.position[front] = temp3 


                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    print(self.position)
                    self.arm_turn()
                elif self.position[back] == "red":
                    #do arm flip and update position
                    self.flip90()
                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    print(self.position)
                    self.arm_turn()
                elif self.position[right] == "red":
                    #do arm flip and update position
                    self.placen90()
                    self.flip90()
                    temp = self.position[right] 
                    self.position[right] =self.position[front] 
                    temp2 = self.position[back]
                    self.position[back] =temp
                    temp3 = self.position[left]
                    self.position[left] =temp2
                    self.position[front] = temp3 

                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    print(self.position)
                    self.arm_turn()
                elif self.position[left] == "red":
                    #do arm flip and update position
                    self.place90()
                    self.flip90()
                    temp = self.position[left] 
                    self.position[left] =self.position[front] 
                    temp2 = self.position[back]
                    self.position[back] =temp
                    temp3 = self.position[right]
                    self.position[right] =temp2
                    self.position[front] = temp3 

                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    print(self.position)
                    self.arm_turn()
                elif self.position[down] == "red":
                    #do arm flip and update position
                    self.flip90()
                    self.flip90()
                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    print(self.position)
                    self.arm_turn()

            elif self.sollution_arm[0] == "L" or self.sollution_arm[0] == "L'" or self.sollution_arm[0] == "L2":
                if self.position[up] == "orange":
                    print(self.position)
                    self.arm_turn()
                elif self.position[front] == "orange":
                    #do arm flip and update position
                    self.place180()
                    self.flip90()
                    temp = self.position[right] 
                    self.position[right] =self.position[front] 
                    temp2 = self.position[back]
                    self.position[back] =temp
                    temp3 = self.position[left]
                    self.position[left] =temp2
                    self.position[front] = temp3 

                    temp = self.position[right] 
                    self.position[right] =self.position[front] 
                    temp2 = self.position[back]
                    self.position[back] =temp
                    temp3 = self.position[left]
                    self.position[left] =temp2
                    self.position[front] = temp3 


                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    print(self.position)
                    self.arm_turn()
                elif self.position[back] == "orange":
                    #do arm flip and update position
                    self.flip90()
                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    print(self.position)
                    self.arm_turn()
                elif self.position[right] == "orange":
                    #do arm flip and update position
                    self.placen90()
                    self.flip90()
                    temp = self.position[right] 
                    self.position[right] =self.position[front] 
                    temp2 = self.position[back]
                    self.position[back] =temp
                    temp3 = self.position[left]
                    self.position[left] =temp2
                    self.position[front] = temp3 

                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    print(self.position)
                    self.arm_turn()
                elif self.position[left] == "orange":
                    #do arm flip and update position
                    self.place90()
                    self.flip90()
                    temp = self.position[left] 
                    self.position[left] =self.position[front] 
                    temp2 = self.position[back]
                    self.position[back] =temp
                    temp3 = self.position[right]
                    self.position[right] =temp2
                    self.position[front] = temp3 

                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    print(self.position)
                    self.arm_turn()
                elif self.position[down] == "orange":
                    #do arm flip and update position
                    self.flip90()
                    self.flip90()
                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    print(self.position)
                    self.arm_turn()

            elif self.sollution_arm[0] == "D" or self.sollution_arm[0] == "D'" or self.sollution_arm[0] == "D2":
                if self.position[up] == "yellow":
                    print(self.position)
                    self.arm_turn()
                elif self.position[front] == "yellow":
                    #do arm flip and update position
                    self.place180()
                    self.flip90()
                    temp = self.position[right] 
                    self.position[right] =self.position[front] 
                    temp2 = self.position[back]
                    self.position[back] =temp
                    temp3 = self.position[left]
                    self.position[left] =temp2
                    self.position[front] = temp3 

                    temp = self.position[right] 
                    self.position[right] =self.position[front] 
                    temp2 = self.position[back]
                    self.position[back] =temp
                    temp3 = self.position[left]
                    self.position[left] =temp2
                    self.position[front] = temp3 


                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    print(self.position)
                    self.arm_turn()
                elif self.position[back] == "yellow":
                    #do arm flip and update position
                    self.flip90()
                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    print(self.position)
                    self.arm_turn()
                elif self.position[right] == "yellow":
                    #do arm flip and update position
                    self.placen90()
                    self.flip90()
                    temp = self.position[right] 
                    self.position[right] =self.position[front] 
                    temp2 = self.position[back]
                    self.position[back] =temp
                    temp3 = self.position[left]
                    self.position[left] =temp2
                    self.position[front] = temp3 

                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    print(self.position)
                    self.arm_turn()
                elif self.position[left] == "yellow":
                    #do arm flip and update position
                    self.place90()
                    self.flip90()
                    temp = self.position[left] 
                    self.position[left] =self.position[front] 
                    temp2 = self.position[back]
                    self.position[back] =temp
                    temp3 = self.position[right]
                    self.position[right] =temp2
                    self.position[front] = temp3 

                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    print(self.position)
                    self.arm_turn()
                elif self.position[down] == "yellow":
                    #do arm flip and update position
                    self.flip90()
                    self.flip90()
                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    print(self.position)
                    self.arm_turn()
            elif self.sollution_arm[0] == "U" or self.sollution_arm[0] == "U'" or self.sollution_arm[0] == "U2":
                if self.position[up] == "white":
                    print(self.position)
                    self.arm_turn()
                elif self.position[front] == "white":
                    #do arm flip and update position
                    self.place180()
                    self.flip90()
                    temp = self.position[right] 
                    self.position[right] =self.position[front] 
                    temp2 = self.position[back]
                    self.position[back] =temp
                    temp3 = self.position[left]
                    self.position[left] =temp2
                    self.position[front] = temp3 

                    temp = self.position[right] 
                    self.position[right] =self.position[front] 
                    temp2 = self.position[back]
                    self.position[back] =temp
                    temp3 = self.position[left]
                    self.position[left] =temp2
                    self.position[front] = temp3 


                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    print(self.position)
                    self.arm_turn()
                elif self.position[back] == "white":
                    #do arm flip and update position
                    self.flip90()
                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    print(self.position)
                    self.arm_turn()
                elif self.position[right] == "white":
                    #do arm flip and update position
                    self.placen90()
                    self.flip90()
                    temp = self.position[right] 
                    self.position[right] =self.position[front] 
                    temp2 = self.position[back]
                    self.position[back] =temp
                    temp3 = self.position[left]
                    self.position[left] =temp2
                    self.position[front] = temp3 

                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    print(self.position)
                    self.arm_turn()
                elif self.position[left] == "white":
                    #do arm flip and update position
                    self.place90()
                    self.flip90()
                    temp = self.position[left] 
                    self.position[left] =self.position[front] 
                    temp2 = self.position[back]
                    self.position[back] =temp
                    temp3 = self.position[right]
                    self.position[right] =temp2
                    self.position[front] = temp3 

                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    print(self.position)
                    self.arm_turn()
                elif self.position[down] == "white":
                    #do arm flip and update position
                    self.flip90()
                    self.flip90()
                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    temp = self.position[up] 
                    self.position[up] =self.position[back] 
                    temp2 = self.position[front]
                    self.position[front] =temp
                    temp3 = self.position[down]
                    self.position[down] =temp2
                    self.position[back] = temp3 
                    print(self.position)
                    self.arm_turn()
            self.past_state+=1
            self.sollution_arm.pop(0)

            if move == 0 and self.sollution_arm != []:
                self.robot.set_TMPos(home)
                self.robot.set_TMPos(home_place)
                self.g.gripper_on()
                self.robot.set_TMPos(home)
                self.firstDone =False
                self.firstDone =False
                self.firstDone =False
                self.firstDone =False
                self.onprocess=True
                self.onprocess=True
                self.onprocess=True
                self.onprocess=True
                self.onprocess=True
                self.onprocess=True
                self.out =True
                self.out =True
                self.out =True
                self.out =True
                self.out =True
                self.out =True
                break
            elif self.sollution_arm == []:
                self.robot.set_TMPos(home)
                self.robot.set_TMPos(home_place)
                self.g.gripper_on()
                self.robot.set_TMPos(home)
    def arm_turn(self):
            if self.sollution_arm[0] == "F" or self.sollution_arm[0]== "B" or self.sollution_arm[0] == "U" or self.sollution_arm[0] == "D" or self.sollution_arm[0] == "R" or self.sollution_arm[0] == "L":
                #do arm spin  90 degree clockwise and update position # front -> right -> back -> left -> front
                    self.rotate90()


            elif self.sollution_arm[0] == "F'" or self.sollution_arm[0] == "B'" or self.sollution_arm[0] == "U'" or self.sollution_arm[0] == "D'" or self.sollution_arm[0] == "R'" or self.sollution_arm[0] == "L'":
                #do arm spin  90 degree counterclockwise and update position # front -> left -> back -> right -> front
                    self.rotaten90()

            elif self.sollution_arm[0] == "F2" or self.sollution_arm[0] == "B2" or self.sollution_arm[0] == "U2" or self.sollution_arm[0] == "D2" or self.sollution_arm[0] == "R2" or self.sollution_arm[0] == "L2":
                #do arm spin  180 degree and update position # front -> right -> back -> left -> front *2
                    self.rotate180()


    def rotate90(self):
        self.robot.set_TMPos(position_init_up)
        self.robot.set_TMPos(position_init)
        self.robot.set_TMPos(position_90_r_init)
        time.sleep(5)
        self.g.gripper_on()
        self.robot.set_TMPos(position_init)
        time.sleep(5)
        self.g.gripper_soft_off()
        self.robot.set_TMPos(position_init_up)

    def rotate180(self):
        self.robot.set_TMPos(position_init_up)
        self.robot.set_TMPos(position_init)
        self.robot.set_TMPos(position_180_r_init)
        time.sleep(10)
        self.g.gripper_on()
        self.robot.set_TMPos(position_init)
        time.sleep(10)
        self.g.gripper_soft_off()
        self.robot.set_TMPos(position_init_up)

    def rotaten90(self):
        self.robot.set_TMPos(position_init_up)
        self.robot.set_TMPos(position_init)
        self.robot.set_TMPos(position_n90_r_init)
        time.sleep(5)
        self.g.gripper_on()
        self.robot.set_TMPos(position_init)
        time.sleep(5)
        self.g.gripper_soft_off()
        self.robot.set_TMPos(position_init_up)

    def flip90(self):
        self.robot.set_TMPos(position_place)
        self.robot.set_TMPos(position_flip)
        self.robot.set_TMPos(position_down_flip)
        self.g.gripper_on()
        self.robot.set_TMPos(position_up_flip)
        self.robot.set_TMPos(position_place)
        self.robot.set_TMPos(position_down)
        self.g.gripper_soft_off()

    def place90(self):
        self.robot.set_TMPos(position_place_90)
        self.robot.set_TMPos(position_down_90)
        self.g.gripper_on()
        self.robot.set_TMPos(position_down)
        time.sleep(5)
        self.g.gripper_soft_off()
        self.robot.set_TMPos(position_place)

    def place180(self):
        self.robot.set_TMPos(position_place_180)
        self.robot.set_TMPos(position_down_180)
        self.g.gripper_on()
        self.robot.set_TMPos(position_down)
        time.sleep(10)
        self.g.gripper_soft_off()
        self.robot.set_TMPos(position_place)

    def placen90(self):
        self.robot.set_TMPos(position_place_n90)
        self.robot.set_TMPos(position_down_n90)
        self.g.gripper_on()
        self.robot.set_TMPos(position_down)
        time.sleep(5)
        self.g.gripper_soft_off()
        self.robot.set_TMPos(position_place)

    def scan(self):
        self.robot.set_TMPos(position_scan_grip_up)
        self.robot.set_TMPos(position_scan_grip)
        self.g.gripper_soft_off()
        #flip90
        self.robot.set_TMPos(position_place)
        self.robot.set_TMPos(position_flip)
        self.robot.set_TMPos(position_down_flip)
        self.g.gripper_on()
        self.robot.set_TMPos(position_up_flip)
        self.robot.set_TMPos(position_place)
        self.robot.set_TMPos(position_down)
        self.g.gripper_soft_off()
        #place180
        self.robot.set_TMPos(position_place_180)
        self.robot.set_TMPos(position_down_180)
        self.g.gripper_on()
        self.robot.set_TMPos(position_down_90)
        time.sleep(3)
        self.g.gripper_soft_off()
        self.g.gripper_on()
        self.robot.set_TMPos(position_down)
        self.g.gripper_soft_off()
        self.g.gripper_on()
        self.robot.set_TMPos(position_scan_grip_up)
        self.robot.set_TMPos(position_scan)
        self.firstDone_check =True 
        self.firstDone = False
        self.firstDone = False
        self.firstDone = False
        self.firstDone = False
        self.firstDone = False
        self.firstDone = False

    def on_closing(self):
        #self.pipeline.stop()
        #self.cap.release()
        self.root.destroy()
   
    def run(self):
        self.video_stream()
        self.root.mainloop()

      
x = gui()
x.run()