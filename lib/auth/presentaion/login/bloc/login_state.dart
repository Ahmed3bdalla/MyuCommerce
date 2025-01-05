part of 'login_bloc.dart';

@immutable
class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class ValidateState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFailureState extends LoginState {
  final String error;
  LoginFailureState({required this.error});
}
