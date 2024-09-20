// Generated by gencpp from file gqcnn/GQCNNGraspPlannerBoundingBoxResponse.msg
// DO NOT EDIT!


#ifndef GQCNN_MESSAGE_GQCNNGRASPPLANNERBOUNDINGBOXRESPONSE_H
#define GQCNN_MESSAGE_GQCNNGRASPPLANNERBOUNDINGBOXRESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <gqcnn/GQCNNGrasp.h>

namespace gqcnn
{
template <class ContainerAllocator>
struct GQCNNGraspPlannerBoundingBoxResponse_
{
  typedef GQCNNGraspPlannerBoundingBoxResponse_<ContainerAllocator> Type;

  GQCNNGraspPlannerBoundingBoxResponse_()
    : grasp()  {
    }
  GQCNNGraspPlannerBoundingBoxResponse_(const ContainerAllocator& _alloc)
    : grasp(_alloc)  {
  (void)_alloc;
    }



   typedef  ::gqcnn::GQCNNGrasp_<ContainerAllocator>  _grasp_type;
  _grasp_type grasp;





  typedef boost::shared_ptr< ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse_<ContainerAllocator> const> ConstPtr;

}; // struct GQCNNGraspPlannerBoundingBoxResponse_

typedef ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse_<std::allocator<void> > GQCNNGraspPlannerBoundingBoxResponse;

typedef boost::shared_ptr< ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse > GQCNNGraspPlannerBoundingBoxResponsePtr;
typedef boost::shared_ptr< ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse const> GQCNNGraspPlannerBoundingBoxResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse_<ContainerAllocator1> & lhs, const ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse_<ContainerAllocator2> & rhs)
{
  return lhs.grasp == rhs.grasp;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse_<ContainerAllocator1> & lhs, const ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace gqcnn

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ed2996f74c00186d31646a6475f8155c";
  }

  static const char* value(const ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xed2996f74c00186dULL;
  static const uint64_t static_value2 = 0x31646a6475f8155cULL;
};

template<class ContainerAllocator>
struct DataType< ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "gqcnn/GQCNNGraspPlannerBoundingBoxResponse";
  }

  static const char* value(const ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# response params\n"
"GQCNNGrasp grasp\n"
"\n"
"\n"
"================================================================================\n"
"MSG: gqcnn/GQCNNGrasp\n"
"# Copyright ©2017. The Regents of the University of California (Regents).\n"
"# All Rights Reserved. Permission to use, copy, modify, and distribute this\n"
"# software and its documentation for educational, research, and not-for-profit\n"
"# purposes, without fee and without a signed licensing agreement, is hereby\n"
"# granted, provided that the above copyright notice, this paragraph and the\n"
"# following two paragraphs appear in all copies, modifications, and\n"
"# distributions. Contact The Office of Technology Licensing, UC Berkeley, 2150\n"
"# Shattuck Avenue, Suite 510, Berkeley, CA 94720-1620, (510) 643-7201,\n"
"# otl@berkeley.edu,\n"
"# http://ipira.berkeley.edu/industry-info for commercial licensing opportunities.\n"
"\n"
"# IN NO EVENT SHALL REGENTS BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL,\n"
"# INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING LOST PROFITS, ARISING OUT OF\n"
"# THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF REGENTS HAS BEEN\n"
"# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.\n"
"\n"
"# REGENTS SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO,\n"
"# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR\n"
"# PURPOSE. THE SOFTWARE AND ACCOMPANYING DOCUMENTATION, IF ANY, PROVIDED\n"
"# HEREUNDER IS PROVIDED \"AS IS\". REGENTS HAS NO OBLIGATION TO PROVIDE\n"
"# MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.\n"
"\n"
"geometry_msgs/Pose pose\n"
"float64 q_value\n"
"\n"
"uint8 PARALLEL_JAW=0\n"
"uint8 SUCTION=1\n"
"uint8 grasp_type\n"
"\n"
"float64[2] center_px\n"
"float64 angle\n"
"float64 depth\n"
"sensor_msgs/Image thumbnail\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Pose\n"
"# A representation of pose in free space, composed of position and orientation. \n"
"Point position\n"
"Quaternion orientation\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Quaternion\n"
"# This represents an orientation in free space in quaternion form.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"float64 w\n"
"\n"
"================================================================================\n"
"MSG: sensor_msgs/Image\n"
"# This message contains an uncompressed image\n"
"# (0, 0) is at top-left corner of image\n"
"#\n"
"\n"
"Header header        # Header timestamp should be acquisition time of image\n"
"                     # Header frame_id should be optical frame of camera\n"
"                     # origin of frame should be optical center of camera\n"
"                     # +x should point to the right in the image\n"
"                     # +y should point down in the image\n"
"                     # +z should point into to plane of the image\n"
"                     # If the frame_id here and the frame_id of the CameraInfo\n"
"                     # message associated with the image conflict\n"
"                     # the behavior is undefined\n"
"\n"
"uint32 height         # image height, that is, number of rows\n"
"uint32 width          # image width, that is, number of columns\n"
"\n"
"# The legal values for encoding are in file src/image_encodings.cpp\n"
"# If you want to standardize a new string format, join\n"
"# ros-users@lists.sourceforge.net and send an email proposing a new encoding.\n"
"\n"
"string encoding       # Encoding of pixels -- channel meaning, ordering, size\n"
"                      # taken from the list of strings in include/sensor_msgs/image_encodings.h\n"
"\n"
"uint8 is_bigendian    # is this data bigendian?\n"
"uint32 step           # Full row length in bytes\n"
"uint8[] data          # actual matrix data, size is (step * rows)\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
;
  }

  static const char* value(const ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.grasp);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GQCNNGraspPlannerBoundingBoxResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse_<ContainerAllocator>& v)
  {
    s << indent << "grasp: ";
    s << std::endl;
    Printer< ::gqcnn::GQCNNGrasp_<ContainerAllocator> >::stream(s, indent + "  ", v.grasp);
  }
};

} // namespace message_operations
} // namespace ros

#endif // GQCNN_MESSAGE_GQCNNGRASPPLANNERBOUNDINGBOXRESPONSE_H
