// Generated by gencpp from file gqcnn/GQCNNGraspPlannerBoundingBox.msg
// DO NOT EDIT!


#ifndef GQCNN_MESSAGE_GQCNNGRASPPLANNERBOUNDINGBOX_H
#define GQCNN_MESSAGE_GQCNNGRASPPLANNERBOUNDINGBOX_H

#include <ros/service_traits.h>


#include <gqcnn/GQCNNGraspPlannerBoundingBoxRequest.h>
#include <gqcnn/GQCNNGraspPlannerBoundingBoxResponse.h>


namespace gqcnn
{

struct GQCNNGraspPlannerBoundingBox
{

typedef GQCNNGraspPlannerBoundingBoxRequest Request;
typedef GQCNNGraspPlannerBoundingBoxResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct GQCNNGraspPlannerBoundingBox
} // namespace gqcnn


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::gqcnn::GQCNNGraspPlannerBoundingBox > {
  static const char* value()
  {
    return "407b4efa8d681d543dbf2db432f2efef";
  }

  static const char* value(const ::gqcnn::GQCNNGraspPlannerBoundingBox&) { return value(); }
};

template<>
struct DataType< ::gqcnn::GQCNNGraspPlannerBoundingBox > {
  static const char* value()
  {
    return "gqcnn/GQCNNGraspPlannerBoundingBox";
  }

  static const char* value(const ::gqcnn::GQCNNGraspPlannerBoundingBox&) { return value(); }
};


// service_traits::MD5Sum< ::gqcnn::GQCNNGraspPlannerBoundingBoxRequest> should match
// service_traits::MD5Sum< ::gqcnn::GQCNNGraspPlannerBoundingBox >
template<>
struct MD5Sum< ::gqcnn::GQCNNGraspPlannerBoundingBoxRequest>
{
  static const char* value()
  {
    return MD5Sum< ::gqcnn::GQCNNGraspPlannerBoundingBox >::value();
  }
  static const char* value(const ::gqcnn::GQCNNGraspPlannerBoundingBoxRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::gqcnn::GQCNNGraspPlannerBoundingBoxRequest> should match
// service_traits::DataType< ::gqcnn::GQCNNGraspPlannerBoundingBox >
template<>
struct DataType< ::gqcnn::GQCNNGraspPlannerBoundingBoxRequest>
{
  static const char* value()
  {
    return DataType< ::gqcnn::GQCNNGraspPlannerBoundingBox >::value();
  }
  static const char* value(const ::gqcnn::GQCNNGraspPlannerBoundingBoxRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse> should match
// service_traits::MD5Sum< ::gqcnn::GQCNNGraspPlannerBoundingBox >
template<>
struct MD5Sum< ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse>
{
  static const char* value()
  {
    return MD5Sum< ::gqcnn::GQCNNGraspPlannerBoundingBox >::value();
  }
  static const char* value(const ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse> should match
// service_traits::DataType< ::gqcnn::GQCNNGraspPlannerBoundingBox >
template<>
struct DataType< ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse>
{
  static const char* value()
  {
    return DataType< ::gqcnn::GQCNNGraspPlannerBoundingBox >::value();
  }
  static const char* value(const ::gqcnn::GQCNNGraspPlannerBoundingBoxResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // GQCNN_MESSAGE_GQCNNGRASPPLANNERBOUNDINGBOX_H
