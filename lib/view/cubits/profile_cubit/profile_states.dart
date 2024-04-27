abstract class ProfileStates{}

class InitialState extends ProfileStates{}
class LoadingState extends ProfileStates{}
class GetUserDataSuccessState extends ProfileStates{}
class GetUserDataFailureState extends ProfileStates{
  final String errorMessage;
  GetUserDataFailureState({required this.errorMessage});
}

class GetOrdersSuccessState extends ProfileStates{}
class GetOrdersFailureState extends ProfileStates{
    final String errorMessage;
  GetOrdersFailureState({required this.errorMessage});
}
