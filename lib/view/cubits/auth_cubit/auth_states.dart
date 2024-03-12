
abstract class AuthStates {}

class InitialState extends AuthStates {}

class LoadingState extends AuthStates {}

class LoginSuccess extends AuthStates {}

class LoginFailure extends AuthStates {
  LoginFailure({required this.errorMessage});
  final String errorMessage;
}

class RegisterSuccess extends AuthStates {}

class RegisterFailure extends AuthStates {
  RegisterFailure({required this.errorMessage});
  final String errorMessage;
}
