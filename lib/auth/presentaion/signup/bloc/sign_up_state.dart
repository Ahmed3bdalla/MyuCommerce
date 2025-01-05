part of 'sign_up_bloc.dart';

@immutable
class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {}

class SignUpFailureState extends SignUpState {
  final String error;

  SignUpFailureState({required this.error});
}
