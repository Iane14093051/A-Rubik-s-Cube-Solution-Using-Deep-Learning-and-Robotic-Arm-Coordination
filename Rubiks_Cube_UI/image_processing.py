import cv2 as cv
import numpy as np
import kociemba
import pyrealsense2 as rs
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
from PIL import Image, ImageEnhance
color_white = (255, 255, 255)
color_yellow = (0, 255, 255)
color_red = (0, 0, 255)
color_orange = (0, 162, 255)
color_green = (0, 255, 0)
color_blue = (255, 0, 0)

position_scan = [913.5594482421875, 215.1548461914063, 179.3092346191406, 2.3393406752337786, -0.06966280134672458, -3.082999381182524]

def distance(p1, p2):
    return ((p1[0] - p2[0])**2 + (p1[1] - p2[1])**2)**0.5

def minus(p1, p2):
    return (p1[0] - p2[0], p1[1] - p2[1])

def plus(p1, p2):
    return (p1[0] + p2[0], p1[1] + p2[1])

def times(a, p):
    return (a*p[0], a*p[1])

def length(p):
    return (p[0]**2 + p[1]**2)**0.5

def area(l):
    alan = 0
    for i in range(0, len(l)):
        alan += l[i][0]*l[i-1][1] - l[i-1][0]*l[i][1]
    return abs(alan/2)

def turnHSV(arr):
    tmp = np.zeros((1, len(arr), 3), np.uint8)
    for i in range(len(arr)):
        tmp[0][i] = np.array([arr[i][0], arr[i][1], arr[i][2]])
    tmp = cv.cvtColor(tmp, cv.COLOR_BGR2HSV)
    for i in range(len(arr)):
        arr[i] = [(float(tmp[0][i][0] + 30) % 180), float(tmp[0][i][1]), float(tmp[0][i][2]), i]
    return np.array(arr)

def fill(kup, face, up):#放置該面的顏色
    if face[4] == 0:#白面
        x = 0
        if up == 1:#原本的面保持不動
            kup[x+0] = face[0]
            kup[x+1] = face[1]
            kup[x+2] = face[2]
            kup[x+3] = face[3]
            kup[x+4] = face[4]
            kup[x+5] = face[5]
            kup[x+6] = face[6]
            kup[x+7] = face[7]
            kup[x+8] = face[8]
        elif up == 4:#原本的面順時針轉90度
            kup[x+0] = face[6]
            kup[x+1] = face[3]
            kup[x+2] = face[0]
            kup[x+3] = face[7]
            kup[x+4] = face[4]
            kup[x+5] = face[1]
            kup[x+6] = face[8]
            kup[x+7] = face[5]
            kup[x+8] = face[2]
        elif up == 5:#原本的面逆時針轉90度
            kup[x+0] = face[2]
            kup[x+1] = face[5]
            kup[x+2] = face[8]
            kup[x+3] = face[1]
            kup[x+4] = face[4]
            kup[x+5] = face[7]
            kup[x+6] = face[0]
            kup[x+7] = face[3]
            kup[x+8] = face[6]
        elif up == 2:#原本的面轉180度
            kup[x+0] = face[8]
            kup[x+1] = face[7]
            kup[x+2] = face[6]
            kup[x+3] = face[5]
            kup[x+4] = face[4]
            kup[x+5] = face[3]
            kup[x+6] = face[2]
            kup[x+7] = face[1]
            kup[x+8] = face[0]
        else:
            return False
    elif face[4] == 1:#紅面
        x = 36
        if up == 0:
            kup[x+0] = face[0]
            kup[x+1] = face[1]
            kup[x+2] = face[2]
            kup[x+3] = face[3]
            kup[x+4] = face[4]
            kup[x+5] = face[5]
            kup[x+6] = face[6]
            kup[x+7] = face[7]
            kup[x+8] = face[8]
        elif up == 5:
            kup[x+0] = face[6]
            kup[x+1] = face[3]
            kup[x+2] = face[0]
            kup[x+3] = face[7]
            kup[x+4] = face[4]
            kup[x+5] = face[1]
            kup[x+6] = face[8]
            kup[x+7] = face[5]
            kup[x+8] = face[2]
        elif up == 4:
            kup[x+0] = face[2]
            kup[x+1] = face[5]
            kup[x+2] = face[8]
            kup[x+3] = face[1]
            kup[x+4] = face[4]
            kup[x+5] = face[7]
            kup[x+6] = face[0]
            kup[x+7] = face[3]
            kup[x+8] = face[6]
        elif up == 3:
            kup[x+0] = face[8]
            kup[x+1] = face[7]
            kup[x+2] = face[6]
            kup[x+3] = face[5]
            kup[x+4] = face[4]
            kup[x+5] = face[3]
            kup[x+6] = face[2]
            kup[x+7] = face[1]
            kup[x+8] = face[0]
        else:
            return False
    elif face[4] == 2:#澄面
        x = 18
        if up == 0:
            kup[x+0] = face[0]
            kup[x+1] = face[1]
            kup[x+2] = face[2]
            kup[x+3] = face[3]
            kup[x+4] = face[4]
            kup[x+5] = face[5]
            kup[x+6] = face[6]
            kup[x+7] = face[7]
            kup[x+8] = face[8]
        elif up == 4:
            kup[x+0] = face[6]
            kup[x+1] = face[3]
            kup[x+2] = face[0]
            kup[x+3] = face[7]
            kup[x+4] = face[4]
            kup[x+5] = face[1]
            kup[x+6] = face[8]
            kup[x+7] = face[5]
            kup[x+8] = face[2]
        elif up == 5:
            kup[x+0] = face[2]
            kup[x+1] = face[5]
            kup[x+2] = face[8]
            kup[x+3] = face[1]
            kup[x+4] = face[4]
            kup[x+5] = face[7]
            kup[x+6] = face[0]
            kup[x+7] = face[3]
            kup[x+8] = face[6]
        elif up == 3:
            kup[x+0] = face[8]
            kup[x+1] = face[7]
            kup[x+2] = face[6]
            kup[x+3] = face[5]
            kup[x+4] = face[4]
            kup[x+5] = face[3]
            kup[x+6] = face[2]
            kup[x+7] = face[1]
            kup[x+8] = face[0]
        else:
            return False
    elif face[4] == 3:#黃面
        x = 45
        if up == 2:
            kup[x+0] = face[0]
            kup[x+1] = face[1]
            kup[x+2] = face[2]
            kup[x+3] = face[3]
            kup[x+4] = face[4]
            kup[x+5] = face[5]
            kup[x+6] = face[6]
            kup[x+7] = face[7]
            kup[x+8] = face[8]
        elif up == 4:
            kup[x+0] = face[6]
            kup[x+1] = face[3]
            kup[x+2] = face[0]
            kup[x+3] = face[7]
            kup[x+4] = face[4]
            kup[x+5] = face[1]
            kup[x+6] = face[8]
            kup[x+7] = face[5]
            kup[x+8] = face[2]
        elif up == 5:
            kup[x+0] = face[2]
            kup[x+1] = face[5]
            kup[x+2] = face[8]
            kup[x+3] = face[1]
            kup[x+4] = face[4]
            kup[x+5] = face[7]
            kup[x+6] = face[0]
            kup[x+7] = face[3]
            kup[x+8] = face[6]
        elif up == 1:
            kup[x+0] = face[8]
            kup[x+1] = face[7]
            kup[x+2] = face[6]
            kup[x+3] = face[5]
            kup[x+4] = face[4]
            kup[x+5] = face[3]
            kup[x+6] = face[2]
            kup[x+7] = face[1]
            kup[x+8] = face[0]
        else:
            return False
    elif face[4] == 4:#綠面
        x = 27
        if up == 0:
            kup[x+0] = face[0]
            kup[x+1] = face[1]
            kup[x+2] = face[2]
            kup[x+3] = face[3]
            kup[x+4] = face[4]
            kup[x+5] = face[5]
            kup[x+6] = face[6]
            kup[x+7] = face[7]
            kup[x+8] = face[8]
        elif up == 1:
            kup[x+0] = face[6]
            kup[x+1] = face[3]
            kup[x+2] = face[0]
            kup[x+3] = face[7]
            kup[x+4] = face[4]
            kup[x+5] = face[1]
            kup[x+6] = face[8]
            kup[x+7] = face[5]
            kup[x+8] = face[2]
        elif up == 2:
            kup[x+0] = face[2]
            kup[x+1] = face[5]
            kup[x+2] = face[8]
            kup[x+3] = face[1]
            kup[x+4] = face[4]
            kup[x+5] = face[7]
            kup[x+6] = face[0]
            kup[x+7] = face[3]
            kup[x+8] = face[6]
        elif up == 3:
            kup[x+0] = face[8]
            kup[x+1] = face[7]
            kup[x+2] = face[6]
            kup[x+3] = face[5]
            kup[x+4] = face[4]
            kup[x+5] = face[3]
            kup[x+6] = face[2]
            kup[x+7] = face[1]
            kup[x+8] = face[0]
        else:
            return False
    elif face[4] == 5:#藍面
        x = 9
        if up == 0:
            kup[x+0] = face[0]
            kup[x+1] = face[1]
            kup[x+2] = face[2]
            kup[x+3] = face[3]
            kup[x+4] = face[4]
            kup[x+5] = face[5]
            kup[x+6] = face[6]
            kup[x+7] = face[7]
            kup[x+8] = face[8]
        elif up == 2:
            kup[x+0] = face[6]
            kup[x+1] = face[3]
            kup[x+2] = face[0]
            kup[x+3] = face[7]
            kup[x+4] = face[4]
            kup[x+5] = face[1]
            kup[x+6] = face[8]
            kup[x+7] = face[5]
            kup[x+8] = face[2]
        elif up == 1:
            kup[x+0] = face[2]
            kup[x+1] = face[5]
            kup[x+2] = face[8]
            kup[x+3] = face[1]
            kup[x+4] = face[4]
            kup[x+5] = face[7]
            kup[x+6] = face[0]
            kup[x+7] = face[3]
            kup[x+8] = face[6]
        elif up == 3:
            kup[x+0] = face[8]
            kup[x+1] = face[7]
            kup[x+2] = face[6]
            kup[x+3] = face[5]
            kup[x+4] = face[4]
            kup[x+5] = face[3]
            kup[x+6] = face[2]
            kup[x+7] = face[1]
            kup[x+8] = face[0]
        else:
            return False
    else:
        return False

def getcolor(code):
    if code == 0:
        return color_white
    elif code == 1:
        return color_red
    elif code == 2:
        return color_orange
    elif code == 3:
        return color_yellow
    elif code == 4:
        return color_green
    elif code == 5:
        return color_blue
    else:
        error_im = np.zeros(rm_raw.shape, np.uint8)
        error_im = cv.putText(error_im, 'Unexpected error occured :(', (10, 60), cv.FONT_HERSHEY_SIMPLEX, 2, (255, 255, 255), 3)
        error_im = cv.putText(error_im, 'Press Enter to exit', (10, 180), cv.FONT_HERSHEY_SIMPLEX, 2, (255, 255, 255), 3)
        cv.imshow("Rubik's Cube Solver", error_im)
        cv.waitKey()
        exit(1)

def intersection(x1, y1, x2, y2, x3, y3, x4, y4):#解交點
    ax = (x3*(y4-y3)/(x4-x3) - x1*(y2-y1)/(x2-x1) + y1 - y3)/((y4-y3)/(x4-x3) - (y2-y1)/(x2-x1))
    ay = (ax-x1)*(y2-y1)/(x2-x1) + y1
    return ax, ay

def rm_shad(img_name):
    img = img_name
    # 14.12 使用 LUT 调节饱和度和明度
    ad_img = cv.convertScaleAbs(img,alpha=1.4,beta=0)
    hsv = cv.cvtColor(ad_img, cv.COLOR_BGR2HSV)  # 色彩空间转换, BGR->HSV

    # 调节通道强度
    lutWeaken = np.array([int(0.6*i) for i in range(256)]).astype("uint8")
    lutEqual = np.array([i for i in range(256)]).astype("uint8")
    lutRaisen = np.array([int(102+0.5*i) for i in range(256)]).astype("uint8")
    # 调节饱和度
    lutSWeaken = np.dstack((lutEqual, lutWeaken, lutEqual))  # Saturation weaken
    lutSRaisen = np.dstack((lutEqual, lutRaisen, lutEqual))  # Saturation raisen
    # 调节明度
    lutVWeaken = np.dstack((lutEqual, lutEqual, lutWeaken))  # Value weaken
    lutVRaisen = np.dstack((lutEqual, lutEqual, lutRaisen))  # Value raisen

    blendSWeaken = cv.LUT(hsv, lutSWeaken)  # 饱和度降低
    blendSRaisen = cv.LUT(hsv, lutSRaisen)  # 饱和度增大
    blendVWeaken = cv.LUT(hsv, lutVWeaken)  # 明度降低
    blendVRaisen = cv.LUT(hsv, lutVRaisen)  # 明度升高

    #blendSRaisen = cv.cvtColor(blendSRaisen, cv.COLOR_HSV2BGR)
    blendVRaisen = cv.cvtColor(blendVRaisen, cv.COLOR_HSV2BGR)
    return ad_img
    #return blendVRaisen
def detect_grid(raw,isTrue,cubelist,firstRead,secondRead,firstDone,cubelist_whole,pos):
        res_f=[]
        res_u=[]
        res_l=[]        
        DEBUG = False#黑白拍照模式
        eps = 0.00001
        W, H = 640,480
        #frameraw = raw 
        raw = cv.flip(raw, 1)#照片水平翻轉

        rm_raw= rm_shad(raw)
        pts = np.array([
            [265, 15], 
            [485, 100], 
            [455, 328], 
            [275, 471], 
            [90, 334], 
            [54, 111]
            ], np.int32)
        pts.reshape((-1, 1, 2))#(6,1,2)
        if False:
            raw = cv.polylines(raw, [pts], True, (0, 255, 0), 3)#畫綠色辨識框
            #raw = cv.line(raw, (885, 200), (675, 342), (0, 255, 0), 3)
            #raw = cv.line(raw, (675, 571), (675, 342), (0, 255, 0), 3)
            #raw = cv.line(raw, (454, 211), (675, 342), (0, 255, 0), 3)
            raw = cv.line(raw, (485, 100), (275, 242), (0, 255, 0), 3)
            raw = cv.line(raw, (275, 471), (275, 242), (0, 255, 0), 3)
            raw = cv.line(raw, (54, 111), (275, 242), (0, 255, 0), 3)
            return raw,cubelist,firstRead,secondRead,firstDone,cubelist_whole,res_f,res_u,res_l
        if isTrue == False or not (abs(pos[0]-position_scan[0])<=2 and abs(pos[1]-position_scan[1])<=2 and abs(pos[2]-position_scan[2])<=2 and abs(pos[3]-position_scan[3])<=0.02 and abs(pos[4]-position_scan[4])<=0.02 and abs(pos[5]-position_scan[5])<=0.02) or firstDone:
            return rm_raw,cubelist,firstRead,secondRead,firstDone,cubelist_whole,res_f,res_u,res_l

        if firstDone == False:#第一次進來
            a=1
            #raw = cv.rectangle(raw, (0, H-40), (W, H), (55, 55, 55), -1)#畫底下的矩形在左上座標(0,h-40) 右下座標(W,H) 顏色(55, 55, 55)
            #raw = cv.putText(raw, "Show one corner of the cube to the camera, Q to exit", (10, H-12), cv.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255))
            #raw = cv.putText(raw, "Show one corner.", (10, H-12), cv.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255))
        else:
            rm_raw = cv.circle(rm_raw, (40, H-50), 100, (255, 255, 255), -1)#畫圓圈裡面有綠色的打勾
            rm_raw = cv.line(rm_raw, (40, H-50), (100, H-110), (0, 150, 0), 10)
            rm_raw = cv.line(rm_raw, (10, H-80), (40, H-50), (0, 150, 0), 10)

            raw = cv.circle(raw, (40, H-50), 100, (255, 255, 255), -1)#畫圓圈裡面有綠色的打勾
            raw = cv.line(raw, (40, H-50), (100, H-110), (0, 150, 0), 10)
            raw = cv.line(raw, (10, H-80), (40, H-50), (0, 150, 0), 10)
            #raw = cv.rectangle(raw, (0, H-40), (W, H), (55, 55, 55), -1)#畫底下的矩形在左上座標(0,h-40) 右下座標(W,H) 顏色(55, 55, 55)
            #raw = cv.putText(raw, "Now show the opposite corner to the camera, Q to exit", (10, H-12), cv.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255))
            #raw = cv.putText(raw, "Now show the opposite corner.", (10, H-12), cv.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255))
    

        #* canny edge detection
        blur = cv.medianBlur(rm_raw, 7)
        canny = cv.Canny(blur, 50, 150)#會幫你轉成灰階值
        scanning_areas = canny.copy()
        canny_gray = canny.copy()
        canny = cv.cvtColor(canny, cv.COLOR_GRAY2BGR)

        #* Draw cube skeleton
        #pts = np.array([
    #        [665, 115], 
    #        [885, 200], 
    #        [855, 428], 
    #        [675, 571], 
    #        [490, 434], 
    #        [454, 211]
    #        ], np.int32)
        pts = np.array([
            [265, 15], 
            [485, 100], 
            [455, 328], 
            [275, 471], 
            [90, 334], 
            [54, 111]
            ], np.int32)
        pts.reshape((-1, 1, 2))#(6,1,2)
        if DEBUG:
            canny = cv.polylines(canny, [pts], True, (0, 255, 0), 3)
            canny = cv.circle(canny, (275, 242), 30, (0, 0, 255))
            canny = cv.circle(canny, (275, 242), 50, (0, 0, 255))
        else:
            raw = cv.polylines(raw, [pts], True, (0, 255, 0), 3)#畫綠色辨識框
            #raw = cv.line(raw, (885, 200), (675, 342), (0, 255, 0), 3)
            #raw = cv.line(raw, (675, 571), (675, 342), (0, 255, 0), 3)
            #raw = cv.line(raw, (454, 211), (675, 342), (0, 255, 0), 3)
            raw = cv.line(raw, (485, 100), (275, 242), (0, 255, 0), 3)
            raw = cv.line(raw, (275, 471), (275, 242), (0, 255, 0), 3)
            raw = cv.line(raw, (54, 111), (275, 242), (0, 255, 0), 3)
            
            rm_raw = cv.polylines(rm_raw, [pts], True, (0, 255, 0), 3)#畫綠色辨識框
            rm_raw = cv.line(rm_raw, (485, 100), (275, 242), (0, 255, 0), 3)
            rm_raw = cv.line(rm_raw, (275, 471), (275, 242), (0, 255, 0), 3)
            rm_raw = cv.line(rm_raw, (54, 111), (275, 242), (0, 255, 0), 3)
            
        cube_area = area(pts)#綠色辨識框面積

        #* Draw two circles centered at the corner, find intersection points with edges
        little_circle_points = []
        big_circle_points = []
        points = cv.ellipse2Poly((275, 242), (30, 30), 0, 0, 360, 1)
        for (x, y) in points:#找到大小紅圓圈的三個邊
            if canny_gray[y, x] == 255:
                if len(little_circle_points) == 0 or distance((x, y), little_circle_points[-1]) > 30:
                    little_circle_points.append((x, y))
        points = cv.ellipse2Poly((275, 242), (50, 50), 0, 0, 360, 1)
        for (x, y) in points:
            if canny_gray[y, x] == 255:
                if len(big_circle_points) == 0 or distance((x, y), big_circle_points[-1]) > 30:
                    big_circle_points.append((x, y))

        all_edges_found = False#<22是大小紅圈的外圍間距 誤差取1
        if len(little_circle_points) > 0 and len(big_circle_points) > 0 and distance(little_circle_points[0], big_circle_points[0]) < 22:
            canny = cv.line(canny, little_circle_points[0], big_circle_points[0], (0, 255, 0), 2)
        if len(little_circle_points) > 1 and len(big_circle_points) > 1 and distance(little_circle_points[1], big_circle_points[1]) < 22:
            canny = cv.line(canny, little_circle_points[1], big_circle_points[1], (0, 255, 0), 2)
        if len(little_circle_points) > 2 and len(big_circle_points) > 2 and distance(little_circle_points[2], big_circle_points[2]) < 22:
            canny = cv.line(canny, little_circle_points[2], big_circle_points[2], (0, 255, 0), 2)
            all_edges_found = True

        if all_edges_found:#eps 不確定 也許是誤差
            #* All found points
            x1, y1 = little_circle_points[0][0] + eps, little_circle_points[0][1] + eps
            x2, y2 = big_circle_points[0][0], big_circle_points[0][1]
            x3, y3 = little_circle_points[1][0] + eps, little_circle_points[1][1] + eps
            x4, y4 = big_circle_points[1][0], big_circle_points[1][1]
            x5, y5 = little_circle_points[2][0] + eps, little_circle_points[2][1] + eps
            x6, y6 = big_circle_points[2][0], big_circle_points[2][1]

            #* Find middle corner
            axis1, center_y1 = intersection(x1, y1, x2, y2, x3, y3, x4, y4)
            axis2, center_y2 = intersection(x3, y3, x4, y4, x5, y5, x6, y6)
            center_x3, center_y3 = intersection(x5, y5, x6, y6, x1, y1, x2, y2)
            center_x, center_y = (axis1 + axis2 + center_x3)/3, (center_y1 + center_y2 + center_y3)/3
            center = int(center_x), int(center_y)
            if center_x > 100000 or center_y > 100000:#不會發生
                return rm_raw,cubelist,firstRead,secondRead,firstDone,cubelist_whole,res_f,res_u,res_l
            if DEBUG and 0 < center_x < 1000 and 0 < center_y < 1000:#小藍點
                canny = cv.circle(canny, center, 5, (255, 255, 0), -1)
            
            #* Find corners near middle corner 找出中心corner 延伸出去的三個corners (dx,dy)方向向量 200相素以外開始找直到離開edge的區域 -dx*5 -dy*5為修正向量
            dilated_edges = cv.dilate(canny, np.ones((10, 10), np.uint8))
            dx, dy = big_circle_points[0][0] - little_circle_points[0][0], big_circle_points[0][1] - little_circle_points[0][1]
            dx, dy = dx/length((dx, dy)), dy/length((dx, dy))
            corner1_x, corner1_y = center_x + dx*200, center_y + dy*200
            while 0 < corner1_x < W and 0 < corner1_y < H:
                if dilated_edges[int(corner1_y), int(corner1_x)].all() == 0:
                    break
                corner1_x += dx
                corner1_y += dy
            corner1_x -= 5*dx
            corner1_y -= 5*dy

            dx, dy = big_circle_points[1][0] - little_circle_points[1][0], big_circle_points[1][1] - little_circle_points[1][1]
            dx, dy = dx/length((dx, dy)), dy/length((dx, dy))
            corner2_x, corner2_y = center_x + dx*200, center_y + dy*200
            canny = cv.circle(canny, (int(corner2_x), int(corner2_y)), 10, (0, 0, 255))
            while 0 < corner2_x < W and 0 < corner2_y < H:
                if dilated_edges[int(corner2_y), int(corner2_x)].all() == 0:
                    break
                corner2_x += dx
                corner2_y += dy
            corner2_x -= 5*dx
            corner2_y -= 5*dy

            dx, dy = big_circle_points[2][0] - little_circle_points[2][0], big_circle_points[2][1] - little_circle_points[2][1]
            dx, dy = dx/length((dx, dy)), dy/length((dx, dy))
            corner3_x, corner3_y = center_x + dx*200, center_y + dy*200
            while 0 < corner3_x < W and 0 < corner3_y < H:
                if dilated_edges[int(corner3_y), int(corner3_x)].all() == 0:
                    break
                corner3_x += dx
                corner3_y += dy
            corner3_x -= 5*dx
            corner3_y -= 5*dy

            corner1 = (int(corner1_x), int(corner1_y))
            corner2 = (int(corner2_x), int(corner2_y))
            corner3 = (int(corner3_x), int(corner3_y))

            if DEBUG:
                canny = cv.circle(canny, corner1, 10, (0, 0, 255))
                canny = cv.circle(canny, corner2, 10, (0, 0, 255))
                canny = cv.circle(canny, corner3, 10, (0, 0, 255))

            #* Estimate other corners (A-B)+(C-B) = 向量AD 在加A 即為點D(corner)
            far_corner1 = plus(minus(corner1, center), corner2)
            far_corner2 = plus(minus(corner2, center), corner3)
            far_corner3 = plus(minus(corner3, center), corner1)
            #估计的位置往中心点 center 的方向微调了一小部分（13%的方向向量）
            far_corner1 = minus(far_corner1, times(0.13, minus(far_corner1, center)))
            far_corner2 = minus(far_corner2, times(0.13, minus(far_corner2, center)))
            far_corner3 = minus(far_corner3, times(0.13, minus(far_corner3, center)))
            far_corner1 = (int(far_corner1[0]), int(far_corner1[1]))
            far_corner2 = (int(far_corner2[0]), int(far_corner2[1]))
            far_corner3 = (int(far_corner3[0]), int(far_corner3[1]))
            
            #* Check if calculated area and skeleton area matches
            unsuccessful = False
            calculated_area = area([corner1, far_corner1, corner2, far_corner2, corner3, far_corner3])
            error = abs(calculated_area - cube_area)/cube_area
            if error < 0.1:
                if DEBUG:
                    canny = cv.circle(canny, far_corner1, 10, (0, 0, 255))
                    canny = cv.circle(canny, far_corner2, 10, (0, 0, 255))
                    canny = cv.circle(canny, far_corner3, 10, (0, 0, 255))

                    scanning_areas = cv.circle(scanning_areas, corner1, 10, (255, 255, 255))
                    scanning_areas = cv.circle(scanning_areas, corner2, 10, (255, 255, 255))
                    scanning_areas = cv.circle(scanning_areas, corner3, 10, (255, 255, 255))
                    scanning_areas = cv.circle(scanning_areas, far_corner1, 10, (255, 255, 255))
                    scanning_areas = cv.circle(scanning_areas, far_corner2, 10, (255, 255, 255))
                    scanning_areas = cv.circle(scanning_areas, far_corner3, 10, (255, 255, 255))

                #* Divide faces and extract colors
                read = []
                for faces in range(3):
                    if faces == 0:
                        axis1 = minus(corner1, center)
                        axis2 = minus(corner2, center)
                    elif faces == 1:
                        axis1 = minus(corner2, center)
                        axis2 = minus(corner3, center)
                    else:
                        axis1 = minus(corner3, center)
                        axis2 = minus(corner1, center)

                    for i in range(3):#找出每塊方格的頂點，在減去0.13以防止誤差
                        for j in range(3):
                            piece_corner1 = plus(center, plus(times( i   /3, axis1), times( j   /3, axis2)))
                            piece_corner2 = plus(center, plus(times((i+1)/3, axis1), times( j   /3, axis2)))
                            piece_corner3 = plus(center, plus(times( i   /3, axis1), times((j+1)/3, axis2)))
                            piece_corner4 = plus(center, plus(times((i+1)/3, axis1), times((j+1)/3, axis2)))

                            piece_corner1 = minus(piece_corner1, times(0.13*min(i  , j  )/3, minus(piece_corner1, center)))
                            piece_corner2 = minus(piece_corner2, times(0.13*min(i+1, j  )/3, minus(piece_corner2, center)))
                            piece_corner3 = minus(piece_corner3, times(0.13*min(i  , j+1)/3, minus(piece_corner3, center)))
                            piece_corner4 = minus(piece_corner4, times(0.13*min(i+1, j+1)/3, minus(piece_corner4, center)))

                            piece_mask = np.zeros((canny.shape[0], canny.shape[1]), np.uint8)#獲取照片大小再製定成mask大小
                            pts = np.array([
                                [piece_corner1[0], piece_corner1[1]], 
                                [piece_corner2[0], piece_corner2[1]], 
                                [piece_corner4[0], piece_corner4[1]],
                                [piece_corner3[0], piece_corner3[1]]
                                ], np.int32)
                            pts.reshape((-1, 1, 2))#(4,1,2)
                            piece_mask = cv.fillPoly(piece_mask, [pts], (255, 255, 255))
                            piece_mask = cv.erode(piece_mask, np.ones((35,35), np.uint8)) # erode to prevent little misplacements

                            scanning_areas = cv.bitwise_or(scanning_areas, piece_mask)

                            # uncomment for higher accuracy but hard match
                            # edge_check = cv.mean(canny, piece_mask)
                            # if edge_check[0] > 0:
                            #     olmadi = True

                            #* If color picking area is so small, retreat
                            cube_area = cv.mean(piece_mask)
                            if cube_area[0] < 0.005:
                                unsuccessful = True

                            read_color = cv.mean(rm_raw, piece_mask)
                            
                            if DEBUG:
                                canny = cv.fillPoly(canny, [pts], (int(read_color[0]), int(read_color[1]), int(read_color[2])))
                            read.append((read_color[0], read_color[1], read_color[2]))#read -> (1,54,3) [[a,b,c],[d,e,f],[g,h,i]...]

                                
                if DEBUG:
                    cv.imshow('scanning_areas', scanning_areas)

                if unsuccessful:
                    return rm_raw,cubelist,firstRead,secondRead,firstDone,cubelist_whole,res_f,res_u,res_l

                if not firstRead:#把顏色寫進去firstread
                    firstRead = read
                    firstDone = True
                    firstraw = rm_raw
                    #if DEBUG:
                        #cv.imshow('first read', canny)
                        #cv.imshow('first read raw', raw)
                else:
                    difference = 0
                    for i in range(len(read)):
                        for j in range(3):
                            difference += (firstRead[i][j] - read[i][j])**2
                    if difference > 270000:
                        secondRead = read
                        reads = firstRead + secondRead
                        #color_bgr

                        #if DEBUG:
                            #cv.imshow('ikinci okuma', canny)
                            #cv.imshow('ikinci okuma raw', raw)
                            #print(reads)

                        #* Determine which color which
                        color_groups = [[], [], [], [], [], []]
                        reads = turnHSV(reads)
                        #print(reads)
                        # First 9 least saturated color is white
                        reads = reads[reads[:,1].argsort()]#讓reads以HSV中的saturation 進行升序排列

                        for i in range(9):#前9個最小的pieces被歸類為白色(總共54pieces)
                            color_groups[0].append(int(reads[i][3]))
                        reads = reads[9:]

                        # Other colors are determined according to their hue value
                        reads = reads[reads[:,0].argsort()]#讓reads以HSV中的Hue 進行升序排列
                        for j in range(1, 6):#紅>澄>黃>綠>藍
                            for i in range(9):
                                color_groups[j].append(int(reads[(j-1)*9 + i][3]))

                        where = []
                        for i in range(54):
                            where.append(-1)
                        for i in range(6):#（小塊的顏色）所對應的索引設置為i，即小塊屬於第i個魔方的面
                            for j in range(9):
                                where[color_groups[i][j]] = i

                        for i in range(54):
                            cubelist.append(-1)
                            cubelist_whole.append(-1)

                        #* Find places of pieces and fill 13,22,4 40,49,31固定好的順序 跟最後出來的結果有關
                        fill(cubelist, where[0:9], where[13])
                        fill(cubelist_whole, where[0:9], where[13])
                        fill(cubelist, where[9:18], where[22])
                        fill(cubelist_whole, where[9:18], where[22])
                        fill(cubelist, where[18:27], where[4])
                        fill(cubelist_whole, where[18:27], where[4])
                        
                        fill(cubelist, where[27:36], where[40])
                        fill(cubelist_whole, where[27:36], where[40])
                        fill(cubelist, where[36:45], where[49])
                        fill(cubelist_whole, where[36:45], where[49])
                        fill(cubelist, where[45:54], where[31])
                        fill(cubelist_whole, where[45:54], where[31])

                        if where[40] == 0:
                                res_u ="white"
                        elif where[40] ==1:
                                res_u ="red"
                        elif where[40] ==2:
                                res_u ="orange"
                        elif where[40] ==3:
                                res_u ="yellow"
                        elif where[40] ==4:
                                res_u ="green"
                        elif where[40] ==5:
                                res_u ="blue"

                        if where[49] == 0:
                                res_l ="white"
                        elif where[49] ==1:
                                res_l ="red"
                        elif where[49] ==2:
                                res_l ="orange"
                        elif where[49] ==3:
                                res_l ="yellow"
                        elif where[49] ==4:
                                res_l ="green"
                        elif where[49] ==5:
                                res_l ="blue"

                        if where[31] == 0:
                                res_f ="white"
                        elif where[31] ==1:
                                res_f ="red"
                        elif where[31] ==2:
                                res_f ="orange"
                        elif where[31] ==3:
                                res_f ="yellow"
                        elif where[31] ==4:
                                res_f ="green"
                        elif where[31] ==5:
                                res_f ="blue"

                        #照出來的魔方結果存在cube_list
                        for i in range(len(cubelist)):
                            if cubelist[i]==0:
                                cubelist[i]=1
                                cubelist_whole[i]=1
                            elif cubelist[i]==1:
                                cubelist[i]=2
                                cubelist_whole[i]=2
                            elif cubelist[i]==2:
                                cubelist[i]=3
                                cubelist_whole[i]=3
                            elif cubelist[i]==3:
                                cubelist[i]=5
                                cubelist_whole[i]=5
                            elif cubelist[i]==4:
                                cubelist[i]=0
                                cubelist_whole[i]=0
                            elif cubelist[i]==5:
                                cubelist[i]=4
                                cubelist_whole[i]=4



        return rm_raw,cubelist,firstRead,secondRead,firstDone,cubelist_whole,res_f,res_u,res_l

