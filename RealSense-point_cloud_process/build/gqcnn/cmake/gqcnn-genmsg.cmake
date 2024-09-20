# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "gqcnn: 4 messages, 3 services")

set(MSG_I_FLAGS "-Igqcnn:/home/robotic/catkin_ws/src/gqcnn/msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(gqcnn_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/msg/GQCNNGrasp.msg" NAME_WE)
add_custom_target(_gqcnn_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "gqcnn" "/home/robotic/catkin_ws/src/gqcnn/msg/GQCNNGrasp.msg" "geometry_msgs/Point:geometry_msgs/Quaternion:geometry_msgs/Pose:std_msgs/Header:sensor_msgs/Image"
)

get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/msg/BoundingBox.msg" NAME_WE)
add_custom_target(_gqcnn_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "gqcnn" "/home/robotic/catkin_ws/src/gqcnn/msg/BoundingBox.msg" ""
)

get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/msg/Action.msg" NAME_WE)
add_custom_target(_gqcnn_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "gqcnn" "/home/robotic/catkin_ws/src/gqcnn/msg/Action.msg" ""
)

get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/msg/Observation.msg" NAME_WE)
add_custom_target(_gqcnn_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "gqcnn" "/home/robotic/catkin_ws/src/gqcnn/msg/Observation.msg" ""
)

get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlanner.srv" NAME_WE)
add_custom_target(_gqcnn_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "gqcnn" "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlanner.srv" "sensor_msgs/RegionOfInterest:geometry_msgs/Point:geometry_msgs/Quaternion:geometry_msgs/Pose:std_msgs/Header:sensor_msgs/Image:gqcnn/GQCNNGrasp:sensor_msgs/CameraInfo"
)

get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlannerBoundingBox.srv" NAME_WE)
add_custom_target(_gqcnn_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "gqcnn" "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlannerBoundingBox.srv" "sensor_msgs/RegionOfInterest:geometry_msgs/Point:geometry_msgs/Quaternion:gqcnn/BoundingBox:geometry_msgs/Pose:std_msgs/Header:sensor_msgs/Image:gqcnn/GQCNNGrasp:sensor_msgs/CameraInfo"
)

get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlannerSegmask.srv" NAME_WE)
add_custom_target(_gqcnn_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "gqcnn" "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlannerSegmask.srv" "sensor_msgs/RegionOfInterest:geometry_msgs/Point:geometry_msgs/Quaternion:geometry_msgs/Pose:std_msgs/Header:sensor_msgs/Image:gqcnn/GQCNNGrasp:sensor_msgs/CameraInfo"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/msg/GQCNNGrasp.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gqcnn
)
_generate_msg_cpp(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/msg/BoundingBox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gqcnn
)
_generate_msg_cpp(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/msg/Action.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gqcnn
)
_generate_msg_cpp(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/msg/Observation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gqcnn
)

### Generating Services
_generate_srv_cpp(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlanner.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/home/robotic/catkin_ws/src/gqcnn/msg/GQCNNGrasp.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CameraInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gqcnn
)
_generate_srv_cpp(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlannerBoundingBox.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/robotic/catkin_ws/src/gqcnn/msg/BoundingBox.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/home/robotic/catkin_ws/src/gqcnn/msg/GQCNNGrasp.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CameraInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gqcnn
)
_generate_srv_cpp(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlannerSegmask.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/home/robotic/catkin_ws/src/gqcnn/msg/GQCNNGrasp.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CameraInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gqcnn
)

### Generating Module File
_generate_module_cpp(gqcnn
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gqcnn
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(gqcnn_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(gqcnn_generate_messages gqcnn_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/msg/GQCNNGrasp.msg" NAME_WE)
add_dependencies(gqcnn_generate_messages_cpp _gqcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/msg/BoundingBox.msg" NAME_WE)
add_dependencies(gqcnn_generate_messages_cpp _gqcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/msg/Action.msg" NAME_WE)
add_dependencies(gqcnn_generate_messages_cpp _gqcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/msg/Observation.msg" NAME_WE)
add_dependencies(gqcnn_generate_messages_cpp _gqcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlanner.srv" NAME_WE)
add_dependencies(gqcnn_generate_messages_cpp _gqcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlannerBoundingBox.srv" NAME_WE)
add_dependencies(gqcnn_generate_messages_cpp _gqcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlannerSegmask.srv" NAME_WE)
add_dependencies(gqcnn_generate_messages_cpp _gqcnn_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(gqcnn_gencpp)
add_dependencies(gqcnn_gencpp gqcnn_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS gqcnn_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/msg/GQCNNGrasp.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/gqcnn
)
_generate_msg_eus(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/msg/BoundingBox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/gqcnn
)
_generate_msg_eus(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/msg/Action.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/gqcnn
)
_generate_msg_eus(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/msg/Observation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/gqcnn
)

### Generating Services
_generate_srv_eus(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlanner.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/home/robotic/catkin_ws/src/gqcnn/msg/GQCNNGrasp.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CameraInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/gqcnn
)
_generate_srv_eus(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlannerBoundingBox.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/robotic/catkin_ws/src/gqcnn/msg/BoundingBox.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/home/robotic/catkin_ws/src/gqcnn/msg/GQCNNGrasp.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CameraInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/gqcnn
)
_generate_srv_eus(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlannerSegmask.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/home/robotic/catkin_ws/src/gqcnn/msg/GQCNNGrasp.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CameraInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/gqcnn
)

### Generating Module File
_generate_module_eus(gqcnn
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/gqcnn
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(gqcnn_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(gqcnn_generate_messages gqcnn_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/msg/GQCNNGrasp.msg" NAME_WE)
add_dependencies(gqcnn_generate_messages_eus _gqcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/msg/BoundingBox.msg" NAME_WE)
add_dependencies(gqcnn_generate_messages_eus _gqcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/msg/Action.msg" NAME_WE)
add_dependencies(gqcnn_generate_messages_eus _gqcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/msg/Observation.msg" NAME_WE)
add_dependencies(gqcnn_generate_messages_eus _gqcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlanner.srv" NAME_WE)
add_dependencies(gqcnn_generate_messages_eus _gqcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlannerBoundingBox.srv" NAME_WE)
add_dependencies(gqcnn_generate_messages_eus _gqcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlannerSegmask.srv" NAME_WE)
add_dependencies(gqcnn_generate_messages_eus _gqcnn_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(gqcnn_geneus)
add_dependencies(gqcnn_geneus gqcnn_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS gqcnn_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/msg/GQCNNGrasp.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gqcnn
)
_generate_msg_lisp(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/msg/BoundingBox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gqcnn
)
_generate_msg_lisp(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/msg/Action.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gqcnn
)
_generate_msg_lisp(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/msg/Observation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gqcnn
)

### Generating Services
_generate_srv_lisp(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlanner.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/home/robotic/catkin_ws/src/gqcnn/msg/GQCNNGrasp.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CameraInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gqcnn
)
_generate_srv_lisp(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlannerBoundingBox.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/robotic/catkin_ws/src/gqcnn/msg/BoundingBox.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/home/robotic/catkin_ws/src/gqcnn/msg/GQCNNGrasp.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CameraInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gqcnn
)
_generate_srv_lisp(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlannerSegmask.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/home/robotic/catkin_ws/src/gqcnn/msg/GQCNNGrasp.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CameraInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gqcnn
)

### Generating Module File
_generate_module_lisp(gqcnn
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gqcnn
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(gqcnn_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(gqcnn_generate_messages gqcnn_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/msg/GQCNNGrasp.msg" NAME_WE)
add_dependencies(gqcnn_generate_messages_lisp _gqcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/msg/BoundingBox.msg" NAME_WE)
add_dependencies(gqcnn_generate_messages_lisp _gqcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/msg/Action.msg" NAME_WE)
add_dependencies(gqcnn_generate_messages_lisp _gqcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/msg/Observation.msg" NAME_WE)
add_dependencies(gqcnn_generate_messages_lisp _gqcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlanner.srv" NAME_WE)
add_dependencies(gqcnn_generate_messages_lisp _gqcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlannerBoundingBox.srv" NAME_WE)
add_dependencies(gqcnn_generate_messages_lisp _gqcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlannerSegmask.srv" NAME_WE)
add_dependencies(gqcnn_generate_messages_lisp _gqcnn_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(gqcnn_genlisp)
add_dependencies(gqcnn_genlisp gqcnn_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS gqcnn_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/msg/GQCNNGrasp.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/gqcnn
)
_generate_msg_nodejs(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/msg/BoundingBox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/gqcnn
)
_generate_msg_nodejs(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/msg/Action.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/gqcnn
)
_generate_msg_nodejs(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/msg/Observation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/gqcnn
)

### Generating Services
_generate_srv_nodejs(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlanner.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/home/robotic/catkin_ws/src/gqcnn/msg/GQCNNGrasp.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CameraInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/gqcnn
)
_generate_srv_nodejs(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlannerBoundingBox.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/robotic/catkin_ws/src/gqcnn/msg/BoundingBox.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/home/robotic/catkin_ws/src/gqcnn/msg/GQCNNGrasp.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CameraInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/gqcnn
)
_generate_srv_nodejs(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlannerSegmask.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/home/robotic/catkin_ws/src/gqcnn/msg/GQCNNGrasp.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CameraInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/gqcnn
)

### Generating Module File
_generate_module_nodejs(gqcnn
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/gqcnn
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(gqcnn_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(gqcnn_generate_messages gqcnn_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/msg/GQCNNGrasp.msg" NAME_WE)
add_dependencies(gqcnn_generate_messages_nodejs _gqcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/msg/BoundingBox.msg" NAME_WE)
add_dependencies(gqcnn_generate_messages_nodejs _gqcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/msg/Action.msg" NAME_WE)
add_dependencies(gqcnn_generate_messages_nodejs _gqcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/msg/Observation.msg" NAME_WE)
add_dependencies(gqcnn_generate_messages_nodejs _gqcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlanner.srv" NAME_WE)
add_dependencies(gqcnn_generate_messages_nodejs _gqcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlannerBoundingBox.srv" NAME_WE)
add_dependencies(gqcnn_generate_messages_nodejs _gqcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlannerSegmask.srv" NAME_WE)
add_dependencies(gqcnn_generate_messages_nodejs _gqcnn_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(gqcnn_gennodejs)
add_dependencies(gqcnn_gennodejs gqcnn_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS gqcnn_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/msg/GQCNNGrasp.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gqcnn
)
_generate_msg_py(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/msg/BoundingBox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gqcnn
)
_generate_msg_py(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/msg/Action.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gqcnn
)
_generate_msg_py(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/msg/Observation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gqcnn
)

### Generating Services
_generate_srv_py(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlanner.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/home/robotic/catkin_ws/src/gqcnn/msg/GQCNNGrasp.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CameraInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gqcnn
)
_generate_srv_py(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlannerBoundingBox.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/robotic/catkin_ws/src/gqcnn/msg/BoundingBox.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/home/robotic/catkin_ws/src/gqcnn/msg/GQCNNGrasp.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CameraInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gqcnn
)
_generate_srv_py(gqcnn
  "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlannerSegmask.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/home/robotic/catkin_ws/src/gqcnn/msg/GQCNNGrasp.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CameraInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gqcnn
)

### Generating Module File
_generate_module_py(gqcnn
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gqcnn
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(gqcnn_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(gqcnn_generate_messages gqcnn_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/msg/GQCNNGrasp.msg" NAME_WE)
add_dependencies(gqcnn_generate_messages_py _gqcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/msg/BoundingBox.msg" NAME_WE)
add_dependencies(gqcnn_generate_messages_py _gqcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/msg/Action.msg" NAME_WE)
add_dependencies(gqcnn_generate_messages_py _gqcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/msg/Observation.msg" NAME_WE)
add_dependencies(gqcnn_generate_messages_py _gqcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlanner.srv" NAME_WE)
add_dependencies(gqcnn_generate_messages_py _gqcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlannerBoundingBox.srv" NAME_WE)
add_dependencies(gqcnn_generate_messages_py _gqcnn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/gqcnn/srv/GQCNNGraspPlannerSegmask.srv" NAME_WE)
add_dependencies(gqcnn_generate_messages_py _gqcnn_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(gqcnn_genpy)
add_dependencies(gqcnn_genpy gqcnn_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS gqcnn_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gqcnn)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gqcnn
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(gqcnn_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(gqcnn_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/gqcnn)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/gqcnn
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(gqcnn_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(gqcnn_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gqcnn)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gqcnn
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(gqcnn_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(gqcnn_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/gqcnn)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/gqcnn
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(gqcnn_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(gqcnn_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gqcnn)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gqcnn\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gqcnn
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  string(REGEX REPLACE "([][+.*()^])" "\\\\\\1" ESCAPED_PATH "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gqcnn")
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gqcnn
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${ESCAPED_PATH}/.+/__init__.pyc?$"
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(gqcnn_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(gqcnn_generate_messages_py sensor_msgs_generate_messages_py)
endif()
