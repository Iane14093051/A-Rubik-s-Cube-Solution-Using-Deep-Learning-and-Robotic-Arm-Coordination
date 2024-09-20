# TM_robot-calibration

Eye-in-Hand Calibration Using Tsai-Lenz Method with TM Robot Arm and Realsense D435

***
## **Introduction**

This project implements an eye-in-hand calibration system using a TM Robot Arm and the RGB-D depth camera Realsense D435. The Tsai-Lenz method is employed to perform hand-eye calibration, which aligns the robot's coordinate system with the camera's coordinate system.

## Prerequisite

* Python 3.8.10

* Our requirements in requirements.txt

## Environment

* Ubuntu 20.04

## Usage

First, start ROS and connect to the TM_robot robotic arm:

```bash
$ rosrun tm_driver tm_driver <robot_ip_address>
```

Next, connect the Realsense D435:

```bash
$ roslaunch realsense2_camera rs_camera.launch
```

Finally, run the hand-eye calibration program:

```bash
$ python main.py
```

