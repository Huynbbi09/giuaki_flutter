import 'package:qltv/bloc/auth_bloc/event.dart';
import 'package:qltv/bloc/auth_bloc/state.dart';
import 'package:qltv/config/prefs.dart';
import 'package:qltv/constant/token.dart';
import 'package:qltv/dto/request/auth.dart';
import 'package:qltv/dto/response/auth.dart';
import 'package:qltv/query/baseQuery.dart';
import 'package:qltv/query/endpoint/auth.dart';

class AuthApi {
  static Future<dynamic> login(
    LoginRequest payload,
    AuthBloc bloc,
  ) async {
    bloc.add(LoginPending());
    Map<String, dynamic> result = await BaseQuery.query(BaseQueryPayload(
      data: payload.toJson(),
      queryParam: {},
      endpoint: AuthEndpoint.loginEndpoint(),
    ));

    print(result);

    String accessToken = result["data"][LoginResponse.accessToken];
    await Prefs.prefs.setString(Token.accessToken, accessToken);

    return result;
  }
}
