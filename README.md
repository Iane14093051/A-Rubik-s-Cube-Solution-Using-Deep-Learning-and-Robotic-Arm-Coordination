# A Rubik's Cube Solution Using Deep Learning and Robotic Arm Coordination

With the rapid advancement of human-robot collaboration, we can now employ robotic arms for more human-centered tasks. Our goal is to help individuals solve a Rubik's Cube using robotic arms, image recognition, and specialized algorithms.


***
## **Introduction**

We are developing a Rubik's Cube collaboration system that integrates various software and         hardware technologies to achieve human-robot interaction for solving the cube.

- Sensors: RGB-D Depth Camera Realsense D435
- Robotic Arm: TM Robot
- Image Processing: OpenCV
- Algorithm: Kociemba's two-phase algorithm
- Deep Learning: PointNetGPD


## Prerequisite

* Python 3.8.10

* Our requirements in requirements.txt


## Environment

* Ubuntu 20.04.6 LTS
* Intel® Core™ i7-10750H CPU @ 2.60GHz × 12
* NV166 / Mesa Intel® UHD Graphics (CML GT2) 
* Intel® RealSense™ Depth Camera D435


## Training the Model

Please refer to the following format:
[Point-Cloud-Grasp-Model-for-Robotics](https://github.com/Iane14093051/Point-Cloud-Grasp-Model-for-Robotics)


## Usage

1.Start the hand-eye calibration process to align the coordinates between the camera and the arm.
[TM_Robot_Arm-calibration](https://github.com/Iane14093051/TM_Robot_Arm-calibration)


2.Connect the TM robot arm and import the relevant arm operation functions.
[TM_Robot_Arm-Control](https://github.com/Iane14093051/TM_Robot_Arm-Control/tree/main)


3.Power on the RealSense D435 and process the input into point cloud data. 
[RealSense-point_cloud_process](https://github.com/Iane14093051/RealSense-point_cloud_process)


4.Receive point cloud data and input it into the trained model, then send the predicted grasping position to the TM robot arm for grabbing. 
[TM_Robot_Arm-go-grasp](https://github.com/Iane14093051/TM_Robot_Arm-go-grasp)


5.Launch the UI to perform the Rubik's Cube solving steps and visualize relevant information about the cube.
[Rubiks_Cube_UI](https://github.com/Iane14093051/Rubiks_Cube_UI)


## Future works

We are working to enhance Steps 1 through 5 to enable independent testing. Additionally, we are striving to improve the green box in the UI so that it can read data from any area of the screen.


## PPT

[slide](https://github.com/Iane14093051/A_Rubiks_Cube_Solution_Using_Deep_Learning_and_Robotic_Arm_Coordination/raw/refs/heads/main/slide.pptx)


## Poster

[Poster](https://github.com/Iane14093051/A_Rubiks_Cube_Solution_Using_Deep_Learning_and_Robotic_Arm_Coordination/raw/refs/heads/main/poster.pptx)


## Demo

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/aG4lePK26F8/0.jpg)](https://www.youtube.com/watch?v=aG4lePK26F8)
