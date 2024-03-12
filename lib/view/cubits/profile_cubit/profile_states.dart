abstract class ProfileStates{}

class InitialState extends ProfileStates{}
class LoadingState extends ProfileStates{}
class SuccessState extends ProfileStates{}
class FailureState extends ProfileStates{
  final String errorMessage;
  FailureState({required this.errorMessage});
}

