cmake_minimum_required(VERSION 3.0.2)
project(gpd_grasp_msgs)
add_compile_options(-std=c++11)
find_package(catkin REQUIRED
    geometry_msgs
    sensor_msgs
    message_filters
    message_generation
    )

## Generate messages in the 'msg' folder
add_message_files(FILES GraspConfig.msg GraspConfigList.msg)

generate_messages(DEPENDENCIES geometry_msgs sensor_msgs std_msgs)

catkin_package(
  CATKIN_DEPENDS message_runtime 
)
