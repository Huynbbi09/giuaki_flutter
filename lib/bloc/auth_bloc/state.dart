import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qltv/bloc/auth_bloc/action.dart';
import 'package:qltv/bloc/auth_bloc/event.dart';

class AuthState {
  final bool loadingLogin;

  AuthState({
    required this.loadingLogin,
  });

  AuthState changeState({
    bool? loadingLogin,
  }) {
    return AuthState(
      loadingLogin: loadingLogin ?? this.loadingLogin,
    );
  }
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState(loadingLogin: false)) {
    on<LoginPending>((event, emit) => AuthAction.loginPending(event, emit));
    on<LoginSuccess>((event, emit) => AuthAction.loginSuccess(event, emit));
    on<LoginFailure>((event, emit) => AuthAction.loginFailure(event, emit));
  }
}
