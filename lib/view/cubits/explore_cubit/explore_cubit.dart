import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myucommerce/helper/constants.dart';
import 'package:myucommerce/view/cubits/explore_cubit/explore_state.dart';

import '../../../model/product_model.dart';

class ExploreCubit extends Cubit<ExploreStates> {
  ExploreCubit() : super(InitialState());
  CollectionReference productsCollection =
      FirebaseFirestore.instance.collection(kAllProducts);
  List<ProductModel> products = [];
  getProducts() async {
    emit(LoadingState());
    try {
      productsCollection.snapshots().listen((event) {
        for (var doc in event.docs) {
          products.add(ProductModel.fromjson(doc));
        }
        emit(DataSuccess(productlist: products));
        // print(products);
      });
    } catch (e) {
      emit(DataFailure(errMessage: "$e"));
    }
  }

  getSectionsProducts({required String sectionName}) async {
    await FirebaseFirestore.instance.collection(sectionName).get();
  }
}
