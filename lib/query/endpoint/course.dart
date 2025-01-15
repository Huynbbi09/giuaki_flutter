import 'package:qltv/constant/method.dart';
import 'package:qltv/query/baseQuery.dart';

class CourseEndpoint {
  static EndpointConfig getAllCourse() {
    return EndpointConfig(
      url: "api/v1/course/all-public",
      method: Method.get,
      header: {},
    );
  }

  static EndpointConfig getDetailCourse() {
    return EndpointConfig(
      url: "api/v1/course/detail-public",
      method: Method.get,
      header: {},
    );
  }
}
