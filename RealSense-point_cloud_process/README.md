# RealSense-point_cloud_process
Point cloud pre-processing for PointNetGPD & Realsense D435

Based on the ROS framework, primarily designed to support PointNetGPD, but can be slightly modified to become general-purpose code.

***
## **Introduction**

- Reads the scene point cloud of desktop objects using the Realsense D435 and performs a series of pre-processing steps to retain the point cloud of the region of interest, supporting:
   - Axis-aligned filtering in the camera coordinate system
   - Removal of the desktop surface
   - Outlier removal
   - Point cloud down-sampling
   - Point cloud smoothing
- Uses ROS_tf to read the coordinate relationship between the desktop marker QR code (target marker name: "ar_marker_6") and the camera coordinate system ("camera_depth_optical_frame"), allowing the point cloud of the region of interest to be transformed into the desktop marker coordinate system.
- Publishes the pre-processed point cloud (in the parent coordinate system of the desktop marker "ar_marker_6") as ROS topics, with the following topic names:
   
   ```
   /table_top_points       # Point cloud after filtering and other pre-processing
   /table_top_points_subsampled      # Pre-processed and down-sampled point cloud
   ```

## Prerequisite

* Python 3.8.10

* Our requirements in requirements.txt

## Environment

* Ubuntu 20.04 

## Installation and Usage

1. Clone the repository into your ROS workspace:
   ```bash
   cd ~/catkin_ws/src
   git clone https://github.com/Iane14093051/RealSense-point_cloud_process.git
   catkin build
   ```
   
2. Before running this code, ensure that the Realsense D435 camera is already running and publishing the relevant topics:
   ```bash
   roslaunch realsense2_camera rs_camera.launch publish_tf:=true
   ```

3. Start processing the desktop point cloud:
   ```bash
   roslaunch point_cloud_process get_table_top_points.launch 
   ```

4. Launch RViz to observe the point cloud:

   ```bash
   rviz
   ```
5. Modify the pre-processing parameters in the configuration file config/preprocess_param.txt:

   This file specifies various parameters used during the processing. The program will read these parameters before processing each frame of point cloud data, 
   allowing you to modify them directly and observe the changes in real-time.

    ```
    pass_through_x=1    # Enable or disable axis-aligned filtering in the x-direction
    pass_through_y=1    # Enable or disable filtering in the y-direction
    pass_through_z=1    # Enable or disable filtering in the z-direction
    table_remove=1         # Allow removal of the desktop surface
    outlier_remove=1      # Allow removal of outliers   
    surface_smooth=0      # Allow surface smoothing
    subsample=0           # Allow down-sampling
    z_min= 0.3           # Set the near distance for z-axis filtering
    z_max=0.9                      
    x_left= -0.4         # Set the left distance for x-axis filtering
    x_right= 0.3                  
    y_up= -0.25          # Set the upper distance for y-axis filtering
    y_down= 0.2             
    remain_rate=0.4      # Desktop removal rate
    remain_points=500     # Minimum remaining points on the desktop
    k_points= 50         # Number of points used for outlier removal
    thresh=0.9           # Threshold for outlier removal
    radius= 0.03         # Radius for outlier removal
    subsampling_leaf_size=0.004 # Set the voxel size for down-sampling
    ```

