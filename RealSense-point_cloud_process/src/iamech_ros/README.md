# iamech_ros
## Software
+ ROS Noetic on ubuntu 20.04
## Hardware
+ iAmech AMM
+ backoff PLC
+ Sick s300
+ Realsense D435i
## Launch Sensor and Driver Nodes
### Start the Node
```bash=
roslaunch iamech_ros driver.launch
```
### Publish Topics
+ /odom (nav_msgs/Odometry).
+ /tf: /odom->/tf.
+ /Manager/plc_status (iamech_ros/PLCStatus).
### Subscrib Topics
+ /cmd_vel (geometry_msgs/Twist): Moving command for AMM.
### Service
+ /Manager/write (iamech_ros/WPLC)
  set the plc memory value via name.
  
### Parameters
+ namespace (string, default="iAmech"): The namespace of noes.
+ viertual_plc (bool, default=false): Connect with virtual PLC or not.
+ send_tf (bool, default=true): send the /odom->/base_link or not.
+ fps (float, default=30): Odom msg publish and velocity update rate.
+ timeout (float, default=1.0)
+ init_serveon (bool, default=True)
+ rplidar (bool, default=false): The 2D LiDAR is rplidar or not.
+ sicklidar (bool): The 2D LiDAR is sick s300. If rplidar is false, the sicklidar is setted to true automatically.
+ rp_devicename (string, default=/dev/rplidar): The device name of rplidar.
+ front_sick_devicename (string, default=/dev/front_S300): The device name of front S300.
+ back_sick_devicename (string, default=/dev/back_S300): The device name of back S300.
+ velodyne (bool, default=false): Launch velodyne driver or not.
+ rs_camera (bool, default=false): Using Realsense D435 or not.

## SLAM
### Start
```
roslaunch iamech_ros slam.launch
```
### Parameters
+ database_folder (string, default=iamech_ros/maps/): The storage folder for .db files.
+ database_name (string, default=rs_lidar_map): The .db file name.
+ depth_topic (string, default=/camera/aligned_depth_to_color/image_raw): The depth image for d435i.
+ rgb_topic (string, default=/camera/color/image_raw): The rgb image for d435i.
+ camera_info (string, default=/camera/color/camera_info): The camera information for d435i.
+ scan_topic (string, default=/scan): The 2D LiDAR scan topic.

## Navigation
### Start
```
roslaunch iamech_ros navigation.launch
```
### Parameters
+ database_folder (string, default=iamech_ros/maps/): The storage folder for .db files.
+ database_name (string, default=rs_lidar_map): The .db file name.
+ depth_topic (string, default=/camera/aligned_depth_to_color/image_raw): The depth image for d435i.
+ rgb_topic (string, default=/camera/color/image_raw): The rgb image for d435i.
+ camera_info (string, default=/camera/color/camera_info): The camera information for d435i.
+ scan_topic (string, default=/scan): The 2D LiDAR scan topic.
