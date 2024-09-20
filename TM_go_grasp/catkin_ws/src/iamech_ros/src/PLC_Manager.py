#!/usr/bin/env python3
# Version 3.0 by shang
#Python package
import signal
import pyads
import threading
import math
import multiprocessing as mp

# ROS 
import rospy
import tf

# ROS msg
from nav_msgs.msg import Odometry
from geometry_msgs.msg import Point, Pose, Quaternion, Twist, Vector3

# user-define msg
from iamech_ros.srv import WPLC, WPLCResponse
from iamech_ros.msg import PLCStatus

PLC_DATA_TYPE = {
    ".bSLAM_ServeON": pyads.PLCTYPE_BOOL,
    ".SLAM_R[2]": pyads.PLCTYPE_DINT,
    ".SLAM_R[11]": pyads.PLCTYPE_DINT,
    ".SLAM_R[12]": pyads.PLCTYPE_DINT,
    ".SLAM_R[13]": pyads.PLCTYPE_DINT,
    ".SLAM_R[14]": pyads.PLCTYPE_DINT,
    ".SLAM_R[15]": pyads.PLCTYPE_DINT,
    ".SLAM_R[16]": pyads.PLCTYPE_DINT,
    ".SLAM_R[17]": pyads.PLCTYPE_DINT,
    ".SLAM_R[18]": pyads.PLCTYPE_DINT,
    ".SLAM_L[2]": pyads.PLCTYPE_DINT,
    ".SLAM_L[11]": pyads.PLCTYPE_DINT,
    ".SLAM_L[12]": pyads.PLCTYPE_DINT,
    ".SLAM_L[13]": pyads.PLCTYPE_DINT,
    ".SLAM_L[14]": pyads.PLCTYPE_DINT,
    ".SLAM_L[15]": pyads.PLCTYPE_DINT,
    ".SLAM_L[16]": pyads.PLCTYPE_DINT,
    ".SLAM_L[17]": pyads.PLCTYPE_DINT,
    ".SLAM_L[18]": pyads.PLCTYPE_DINT
}

class PyADS:
    def __init__(self, plc):
        self.parameters_list =[
            ".bSLAM_ServeON",
            ".SLAM_R[11]",
            ".SLAM_R[12]",
            ".SLAM_R[13]",
            ".SLAM_R[14]",
            ".SLAM_R[15]",
            ".SLAM_R[16]",
            ".SLAM_R[17]",
            ".SLAM_R[18]",
            ".SLAM_L[11]",
            ".SLAM_L[12]",
            ".SLAM_L[13]",
            ".SLAM_L[14]",
            ".SLAM_L[15]",
            ".SLAM_L[16]",
            ".SLAM_L[17]",
            ".SLAM_L[18]"
        ]

        self._plc = plc
    
    def __del__(self):
        self._plc.close()

    def _read_by_name(self, name):
        '''
        name: String. The name of the memory.
        return the value of the memory or none for read error.
        '''
        global PLC_DATA_TYPE
        try:
            result = self._plc.read_by_name(name, PLC_DATA_TYPE[name])
        except:
            result = None
            rospy.logerr("beckoff PLC read error.")
        return result

    def _write_by_name(self, name, value):
        '''
        name: String. The name of the memory.
        value: Int. The value of the memory.
        '''
        global PLC_DATA_TYPE
        try:
            self._plc.write_by_name(name, value, PLC_DATA_TYPE[name])
        except:
            rospy.logerr("beckoff PLC write error.")

    def read(self, names):
        '''
        names: String list.
        return a int list which is the values of names.
        '''
        result = []
        if type(names) == type([]) or type(names) == type(()): # Input type is list or tuple.
            for name in names:
                result.append(self._read_by_name(name))
        else:
            result = self._read_by_name(names)
        return result

    def write(self, names, values):
        '''
        names: String list or tuple.
        values: Int list or tuple.
        '''
        if type(names) == type([]) or type(names) == type(()): # Input type is list or tuple.
            for name, value in zip(names, values):
                self._write_by_name(name, value)
        else:
            self._write_by_name(names, values)

    def get_status(self):
        parameters = self.read(self.parameters_list)
        status = PLCStatus()

        status.ServeON = parameters[0]
        status.right.bReady = parameters[1]
        status.right.bMoving = parameters[2]
        status.right.bError = parameters[3]
        status.right.pos = parameters[4]
        status.right.velocity = parameters[5]
        status.right.ErrorCode = parameters[6]
        status.right.temperature = parameters[7]
        status.right.volt = parameters[8]

        status.left.bReady = parameters[9]
        status.left.bMoving = parameters[10]
        status.left.bError = parameters[11]
        status.left.pos = parameters[12]
        status.left.velocity = parameters[13]
        status.left.ErrorCode = parameters[14]
        status.left.temperature = parameters[15]
        status.left.volt = parameters[16]
        return status

class VPyADS:
    def __init__(self):
        # Virtual PLC memory.
        self.memory = {
            ".bSLAM_ServeON": 0,
            ".SLAM_R[11]": 0,
            ".SLAM_R[12]": 0,
            ".SLAM_R[13]": 0,
            ".SLAM_R[14]": 0,
            ".SLAM_R[15]": 0,
            ".SLAM_R[16]": 0,
            ".SLAM_R[17]": 0,
            ".SLAM_R[18]": 0,
            ".SLAM_L[11]": 0,
            ".SLAM_L[12]": 0,
            ".SLAM_L[13]": 0,
            ".SLAM_L[14]": 0,
            ".SLAM_L[15]": 0,
            ".SLAM_L[16]": 0,
            ".SLAM_L[17]": 0,
            ".SLAM_L[18]": 0
        }

        self.parameters_list =[
            ".bSLAM_ServeON",
            ".SLAM_R[11]",
            ".SLAM_R[12]",
            ".SLAM_R[13]",
            ".SLAM_R[14]",
            ".SLAM_R[15]",
            ".SLAM_R[16]",
            ".SLAM_R[17]",
            ".SLAM_R[18]",
            ".SLAM_L[11]",
            ".SLAM_L[12]",
            ".SLAM_L[13]",
            ".SLAM_L[14]",
            ".SLAM_L[15]",
            ".SLAM_L[16]",
            ".SLAM_L[17]",
            ".SLAM_L[18]"
        ]

        self.mutex = threading.Lock() # Lock for read and write
        self.threads = [threading.Thread(target=self._virtual_move_thread)]
        for thread in self.threads:
            thread.start()
    
    def __del__(self):
        # Wait all thread stop.
        for thread in self.threads:
            try:
                if thread.is_alive():
                    thread.join()
            except:
                pass

    def write_by_name(self, name, value, dtype=None):
        self.mutex.acquire()
        if name.__eq__(".SLAM_L[2]"):
            self.memory[".SLAM_L[15]"] = value
        elif name.__eq__(".SLAM_R[2]"):
            self.memory[".SLAM_R[15]"] = value
        else:
            self.memory[name] = value
        self.mutex.release()

    def read_by_name(self, name, dtype=None):
        self.mutex.acquire()
        if name == ".SLAM_L[2]":
            result =  self.memory[".SLAM_L[15]"]
        elif name == ".SLAM_R[2]":
            result =  self.memory[".SLAM_R[15]"]
        else:
            result =  self.memory[name]
        
        self.mutex.release()
        return result

    def read(self, names):
        '''
        names: String list.
        return a int list which is the values of names.
        '''
        result = []
        if type(names) == type([]) or type(names) == type(()): # Input type is list or tuple.
            for name in names:
                result.append(self.read_by_name(name))
        else:
            result = self.read_by_name(names)
        return result

    def write(self, names, values):
        '''
        names: String list or tuple.
        values: Int list or tuple.
        '''
        if type(names) == type([]) or type(names) == type(()): # Input type is list or tuple.
            for name, value in zip(names, values):
                self.write_by_name(name, value)
        else:
            self.write_by_name(names, values)

    def _virtual_move_thread(self):
        rate = rospy.Rate(rospy.get_param("~fps", 30))
        while not rospy.is_shutdown():
            self.mutex.acquire()
            self.memory['.SLAM_R[14]'] += int(self.memory['.SLAM_R[15]'] * 0.1)
            self.memory['.SLAM_L[14]'] += int(self.memory['.SLAM_L[15]'] * 0.1)
            self.mutex.release()
            rate.sleep()

    def close(self):
        pass
    
    def get_status(self):
        parameters = self.read(self.parameters_list)
        status = PLCStatus()

        status.ServeON = parameters[0]
        status.right.bReady = parameters[1]
        status.right.bMoving = parameters[2]
        status.right.bError = parameters[3]
        status.right.pos = parameters[4]
        status.right.velocity = parameters[5]
        status.right.ErrorCode = parameters[6]
        status.right.temperature = parameters[7]
        status.right.volt = parameters[8]

        status.left.bReady = parameters[9]
        status.left.bMoving = parameters[10]
        status.left.bError = parameters[11]
        status.left.pos = parameters[12]
        status.left.velocity = parameters[13]
        status.left.ErrorCode = parameters[14]
        status.left.temperature = parameters[15]
        status.left.volt = parameters[16]
        return status

class Manager:
    def __init__(self):
        self.plcs = []
        if rospy.get_param("~virtual_plc", True):
            self.vPLC = VPyADS()
            rospy.loginfo("Connection with Virtual PLC.")
        else:
            self._connect()
            rospy.loginfo("Connection with beckoff PLC.")

    def _connect(self):
        # PLC parameters.
        PLC_AMS_ID = rospy.get_param("~plc_ams_id", '192.168.100.100.1.1')
        PLC_IP = rospy.get_param("~plc_ip", '192.168.100.100')
        SENDER_AMS = rospy.get_param("~sender_ams", '1.2.3.4.1.1')
        PLC_USERNAME = rospy.get_param("~plc_username", 'Administrator')
        PLC_PASSWORD = rospy.get_param("~plc_password", '1')
        ROUTE_NAME = rospy.get_param("~plc_route_name", 'RouteToMyPC')
        HOSTNAME = rospy.get_param("~plc_hostname", '192.168.100.191')

        pyads.open_port()
        pyads.set_local_address(SENDER_AMS)
        pyads.add_route_to_plc(SENDER_AMS, HOSTNAME, PLC_IP, PLC_USERNAME, PLC_PASSWORD, route_name=ROUTE_NAME)
        pyads.close_port()
        rospy.set_param('~connected', True)
    
    def open(self):
        if rospy.get_param("~virtual_plc", True): # Virtual PyADS
            return self.vPLC
        else: # PyADS
            PLC_AMS_ID = rospy.get_param("~plc_ams_id", '192.168.100.100.1.1')
            PLC_IP = rospy.get_param("~plc_ip", '192.168.100.100')
            plc = pyads.Connection(PLC_AMS_ID, 801, PLC_IP)
            plc.open()
            self.plcs.append(plc)
            return PyADS(plc) 

SERVICE_PLC = None
CMD_PLC = None
L_mm = None

def SIGINT_handler(signum, frame):
    rospy.loginfo("Keyboard Interrup")
    rospy.signal_shutdown('keyboard interrupt')

def write_service_callback(req):
    global SERVICE_PLC
    if SERVICE_PLC is None: return WPLCResponse()
    SERVICE_PLC.write(req.name, req.value)
    return WPLCResponse()

def cmd_vel_callback(req):
    global CMD_PLC, L_mm
    rospy.loginfo(f'Get new cmd_vel ({req.linear.x} , {req.angular.z})')

    if req.linear.x == 0: temp = 0
    else: temp = 2 * req.linear.x * 1000

    if req.angular.z == 0: temp2 = 0
    else: temp2 = req.angular.z * L_mm

    vr_mm_s = int((temp + temp2) / 2)
    vl_mm_s = int((temp - temp2) / 2)

    CMD_PLC.write([".SLAM_L[2]", ".SLAM_R[2]"], [vl_mm_s, vr_mm_s])

if __name__=="__main__":
    rospy.init_node('Manager', log_level=rospy.DEBUG) # ROS Node init.
    rospy.loginfo("Start of Manager node")

    manager = Manager()
    SERVICE_PLC = manager.open()
    PUB_PLC = manager.open()
    CMD_PLC = manager.open()

    L_mm = rospy.get_param("~wheelbase", 588.0)

    pub = rospy.Publisher("~plc_status", PLCStatus, queue_size=50)
    rospy.Service('~write', WPLC, write_service_callback)
    rospy.Subscriber("/cmd_vel", Twist, cmd_vel_callback)
    rate = rospy.Rate(rospy.get_param("~fps", 60))

    while not rospy.is_shutdown():
        status = PUB_PLC.get_status()
        status.header.stamp = rospy.Time.now()
        pub.publish(status)
        rate.sleep()
    rospy.loginfo("PLC Maneger")
    rospy.loginfo("End of Manager node")