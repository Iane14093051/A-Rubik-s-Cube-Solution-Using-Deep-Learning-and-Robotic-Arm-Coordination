execute_process(COMMAND "/home/robotic/catkin_ws/build/gqcnn/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/robotic/catkin_ws/build/gqcnn/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
