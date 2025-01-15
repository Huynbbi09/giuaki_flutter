abstract class AuthEvent {}

class LoginPending extends AuthEvent {}

class LoginSuccess extends AuthEvent {}

class LoginFailure extends AuthEvent {}
