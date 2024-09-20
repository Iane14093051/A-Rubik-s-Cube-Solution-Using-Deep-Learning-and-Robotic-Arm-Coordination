# Point-Cloud-Grasp-Model-for-Robotics

## Acknowledgements
This code is based on the original implementation by **[Hongzhuo Liang](https://github.com/lianghongzhuo/PointNetGPD)** et al., as described in their paper:

**Paper Title**: [PointNetGPD: Detecting Grasp Configurations from Point Sets](https://arxiv.org/pdf/1809.06267)

I have made some minor adjustments to the original implementation.

***
## **Introduction**

PointNetGPD: Detecting Grasp Configurations from Point Sets

PointNetGPD is an end-to-end grasp evaluation model to address the challenging problem of localizing robot grasp configurations directly from the point cloud.

## Prerequisite

* Python 3.8.10

* Our requirements in requirements.txt

## Environment

* Ubuntu 20.04 


## Training the Model

1. Run the experiments:
   
    ```bash
    cd PointNetGPD
    ```

    
    Launch a tensorboard for monitoring
    ```bash
    tensorboard --log-dir ./assets/log --port 8080
	```

    and run an experiment for 200 epoch
    ```bash
    python main_1v.py --epoch 200 --mode train --batch-size x (x>1)  
	```
    
    File name and corresponding experiment:
    ```bash
    main_1v.py        --- 1-viewed point cloud, 2 class
    main_1v_mc.py     --- 1-viewed point cloud, 3 class
    main_1v_gpd.py    --- 1-viewed point cloud, GPD
    main_fullv.py     --- Full point cloud, 2 class
    main_fullv_mc.py  --- Full point cloud, 3 class
    main_fullv_gpd.py --- Full point cloud, GPD
    ```
    For GPD experiments, you may change the input channel number by modifying `input_chann` in the experiment scripts(only 3 and 12 channels are available)

## Using the Model for Grasping
   
1. Install the pre-processing package:

    ```bash
    cd ~/catkin_ws/src
    git clone https://github.com/Iane14093051/RealSense-point_cloud_process.git
    catkin build
    ```

2. Start point cloud collection and pre-processing:
    ```bash
    roslaunch realsense2_camera rs_camera.launch publish_tf:=true  # Start the camera
    roslaunch point_cloud_process get_table_top_points.launch          # Start label tracking and point cloud pre-processing
    ```

3. Run the perception node:

This part utilizes PointNetGPD to read the processed point cloud of the target area on the desktop, performs grasp pose generation (GPG), then sends the internal point cloud of the gripper to PointNet for scoring, outputting the results as ROS messages indicating a good grasp.
    
    ```bash
    cd $HOME/code/PointNetGPD/apps
    python kinect2grasp.py  
    ```
    arguments:
    -h, --help                 show this help message and exit
    --cuda                     Use CUDA for computation
    --gpu GPU                  Specify the GPU number to use
    --load-model LOAD_MODEL    Specify which pre-trained model to use (this parameter is actually overridden by the     later model_type MODEL_TYPE)
    --show_final_grasp         Set whether to display the final grasp (addresses multi-threading display issues)
    --tray_grasp               Not finished grasp type (still in progress)
    --using_mp                 Whether to use multi-threading for grasp sampling
    --model_type MODEL_TYPE    Choose which model to use from three options
    For example:
    ```bash
    python kinect2grasp.py  --cuda  --gpu  0  --load-model  ../data/1v_500_2class_ourway2sample.model   --using_mp   --model_type   750
    ```



------

