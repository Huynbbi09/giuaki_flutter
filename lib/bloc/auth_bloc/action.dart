import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qltv/bloc/auth_bloc/event.dart';
import 'package:qltv/bloc/auth_bloc/state.dart';

class AuthAction {
  static loginPending(LoginPending event, Emitter<AuthState> emit) {
    emit(AuthState(loadingLogin: true));
  }

  static loginSuccess(LoginSuccess event, Emitter<AuthState> emit) {
    emit(AuthState(loadingLogin: false));
  }

  static loginFailure(LoginFailure event, Emitter<AuthState> emit) {
    emit(AuthState(loadingLogin: false));
  }
}
