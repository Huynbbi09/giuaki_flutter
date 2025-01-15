import 'package:qltv/query/baseQuery.dart';

class AuthEndpoint {
  static EndpointConfig loginEndpoint() {
    return EndpointConfig(
      url: "api/v1/auth/login",
      method: "POST",
      header: {},
    );
  }
}
