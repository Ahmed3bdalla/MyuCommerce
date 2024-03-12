import 'package:myucommerce/model/product_model.dart';

abstract class ExploreStates {}

class InitialState extends ExploreStates {}

class LoadingState extends ExploreStates {}

class DataSuccess extends ExploreStates {
  final List<ProductModel> productlist;
  DataSuccess({required this.productlist});
}

class DataFailure extends ExploreStates {
  String errMessage;
  DataFailure({required this.errMessage});
}
