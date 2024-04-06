abstract class CardStates {}

class InitialState extends CardStates {}
class LoadingState extends CardStates {}

class AddedSuccessState extends CardStates {}


class AddedFailureState extends CardStates {
  final String message;
  AddedFailureState({required this.message});
}
class CheckoutInProgressState extends CardStates {}
class SummitionState extends CardStates {}
class SubtractionState extends CardStates {}
class DeleteProductState extends CardStates {}