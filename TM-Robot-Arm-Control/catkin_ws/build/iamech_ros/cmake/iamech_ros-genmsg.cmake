# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "iamech_ros: 2 messages, 1 services")

set(MSG_I_FLAGS "-Iiamech_ros:/home/robotic/catkin_ws/src/iamech_ros/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(iamech_ros_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/robotic/catkin_ws/src/iamech_ros/msg/PLCStatus.msg" NAME_WE)
add_custom_target(_iamech_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "iamech_ros" "/home/robotic/catkin_ws/src/iamech_ros/msg/PLCStatus.msg" "std_msgs/Header:iamech_ros/Wheel"
)

get_filename_component(_filename "/home/robotic/catkin_ws/src/iamech_ros/msg/Wheel.msg" NAME_WE)
add_custom_target(_iamech_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "iamech_ros" "/home/robotic/catkin_ws/src/iamech_ros/msg/Wheel.msg" ""
)

get_filename_component(_filename "/home/robotic/catkin_ws/src/iamech_ros/srv/WPLC.srv" NAME_WE)
add_custom_target(_iamech_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "iamech_ros" "/home/robotic/catkin_ws/src/iamech_ros/srv/WPLC.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(iamech_ros
  "/home/robotic/catkin_ws/src/iamech_ros/msg/PLCStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/robotic/catkin_ws/src/iamech_ros/msg/Wheel.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/iamech_ros
)
_generate_msg_cpp(iamech_ros
  "/home/robotic/catkin_ws/src/iamech_ros/msg/Wheel.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/iamech_ros
)

### Generating Services
_generate_srv_cpp(iamech_ros
  "/home/robotic/catkin_ws/src/iamech_ros/srv/WPLC.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/iamech_ros
)

### Generating Module File
_generate_module_cpp(iamech_ros
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/iamech_ros
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(iamech_ros_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(iamech_ros_generate_messages iamech_ros_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robotic/catkin_ws/src/iamech_ros/msg/PLCStatus.msg" NAME_WE)
add_dependencies(iamech_ros_generate_messages_cpp _iamech_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/iamech_ros/msg/Wheel.msg" NAME_WE)
add_dependencies(iamech_ros_generate_messages_cpp _iamech_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/iamech_ros/srv/WPLC.srv" NAME_WE)
add_dependencies(iamech_ros_generate_messages_cpp _iamech_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(iamech_ros_gencpp)
add_dependencies(iamech_ros_gencpp iamech_ros_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS iamech_ros_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(iamech_ros
  "/home/robotic/catkin_ws/src/iamech_ros/msg/PLCStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/robotic/catkin_ws/src/iamech_ros/msg/Wheel.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/iamech_ros
)
_generate_msg_eus(iamech_ros
  "/home/robotic/catkin_ws/src/iamech_ros/msg/Wheel.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/iamech_ros
)

### Generating Services
_generate_srv_eus(iamech_ros
  "/home/robotic/catkin_ws/src/iamech_ros/srv/WPLC.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/iamech_ros
)

### Generating Module File
_generate_module_eus(iamech_ros
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/iamech_ros
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(iamech_ros_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(iamech_ros_generate_messages iamech_ros_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robotic/catkin_ws/src/iamech_ros/msg/PLCStatus.msg" NAME_WE)
add_dependencies(iamech_ros_generate_messages_eus _iamech_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/iamech_ros/msg/Wheel.msg" NAME_WE)
add_dependencies(iamech_ros_generate_messages_eus _iamech_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/iamech_ros/srv/WPLC.srv" NAME_WE)
add_dependencies(iamech_ros_generate_messages_eus _iamech_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(iamech_ros_geneus)
add_dependencies(iamech_ros_geneus iamech_ros_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS iamech_ros_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(iamech_ros
  "/home/robotic/catkin_ws/src/iamech_ros/msg/PLCStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/robotic/catkin_ws/src/iamech_ros/msg/Wheel.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/iamech_ros
)
_generate_msg_lisp(iamech_ros
  "/home/robotic/catkin_ws/src/iamech_ros/msg/Wheel.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/iamech_ros
)

### Generating Services
_generate_srv_lisp(iamech_ros
  "/home/robotic/catkin_ws/src/iamech_ros/srv/WPLC.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/iamech_ros
)

### Generating Module File
_generate_module_lisp(iamech_ros
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/iamech_ros
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(iamech_ros_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(iamech_ros_generate_messages iamech_ros_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robotic/catkin_ws/src/iamech_ros/msg/PLCStatus.msg" NAME_WE)
add_dependencies(iamech_ros_generate_messages_lisp _iamech_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/iamech_ros/msg/Wheel.msg" NAME_WE)
add_dependencies(iamech_ros_generate_messages_lisp _iamech_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/iamech_ros/srv/WPLC.srv" NAME_WE)
add_dependencies(iamech_ros_generate_messages_lisp _iamech_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(iamech_ros_genlisp)
add_dependencies(iamech_ros_genlisp iamech_ros_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS iamech_ros_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(iamech_ros
  "/home/robotic/catkin_ws/src/iamech_ros/msg/PLCStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/robotic/catkin_ws/src/iamech_ros/msg/Wheel.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/iamech_ros
)
_generate_msg_nodejs(iamech_ros
  "/home/robotic/catkin_ws/src/iamech_ros/msg/Wheel.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/iamech_ros
)

### Generating Services
_generate_srv_nodejs(iamech_ros
  "/home/robotic/catkin_ws/src/iamech_ros/srv/WPLC.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/iamech_ros
)

### Generating Module File
_generate_module_nodejs(iamech_ros
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/iamech_ros
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(iamech_ros_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(iamech_ros_generate_messages iamech_ros_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robotic/catkin_ws/src/iamech_ros/msg/PLCStatus.msg" NAME_WE)
add_dependencies(iamech_ros_generate_messages_nodejs _iamech_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/iamech_ros/msg/Wheel.msg" NAME_WE)
add_dependencies(iamech_ros_generate_messages_nodejs _iamech_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/iamech_ros/srv/WPLC.srv" NAME_WE)
add_dependencies(iamech_ros_generate_messages_nodejs _iamech_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(iamech_ros_gennodejs)
add_dependencies(iamech_ros_gennodejs iamech_ros_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS iamech_ros_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(iamech_ros
  "/home/robotic/catkin_ws/src/iamech_ros/msg/PLCStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/robotic/catkin_ws/src/iamech_ros/msg/Wheel.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/iamech_ros
)
_generate_msg_py(iamech_ros
  "/home/robotic/catkin_ws/src/iamech_ros/msg/Wheel.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/iamech_ros
)

### Generating Services
_generate_srv_py(iamech_ros
  "/home/robotic/catkin_ws/src/iamech_ros/srv/WPLC.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/iamech_ros
)

### Generating Module File
_generate_module_py(iamech_ros
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/iamech_ros
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(iamech_ros_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(iamech_ros_generate_messages iamech_ros_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robotic/catkin_ws/src/iamech_ros/msg/PLCStatus.msg" NAME_WE)
add_dependencies(iamech_ros_generate_messages_py _iamech_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/iamech_ros/msg/Wheel.msg" NAME_WE)
add_dependencies(iamech_ros_generate_messages_py _iamech_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotic/catkin_ws/src/iamech_ros/srv/WPLC.srv" NAME_WE)
add_dependencies(iamech_ros_generate_messages_py _iamech_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(iamech_ros_genpy)
add_dependencies(iamech_ros_genpy iamech_ros_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS iamech_ros_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/iamech_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/iamech_ros
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(iamech_ros_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/iamech_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/iamech_ros
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(iamech_ros_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/iamech_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/iamech_ros
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(iamech_ros_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/iamech_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/iamech_ros
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(iamech_ros_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/iamech_ros)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/iamech_ros\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/iamech_ros
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(iamech_ros_generate_messages_py std_msgs_generate_messages_py)
endif()
