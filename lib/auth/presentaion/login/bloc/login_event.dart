part of 'login_bloc.dart';

@immutable
class LoginEvent {}

class Login extends LoginEvent {}

class UpdateEmail extends LoginEvent {
  final String email;

  UpdateEmail({required this.email});
}

class UpdatePass extends LoginEvent {
  final String pass;

  UpdatePass({required this.pass});
}
