import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myucommerce/view/cubits/profile_cubit/profile_states.dart';

import '../../../model/user_model.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(InitialState());

  CollectionReference userRef = FirebaseFirestore.instance.collection('users');

  late UserModel userModel;
  void getUserData() async {
    emit(LoadingState());
    try {
      await userRef
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((user) {
        userModel = UserModel.fromjson(user.data() as Map<String, dynamic>);
      });
      emit(GetUserDataSuccessState());
    } catch (e) {
      emit(GetUserDataFailureState(errorMessage: '$e'));
    }
  }

  // Future addNewProduct(
  //     {required String name,
  //     required String disc,
  //     required String price,
  //     required String pic,
  //     required int quantity}) async {
  //   FirebaseFirestore.instance.collection(kAllProducts).add({
  //     "name": name,
  //     "disc": disc,
  //     "price": price,
  //     "pic": pic,
  //     "quantity": quantity
  //   });
  // }

  CollectionReference orderRef =
      FirebaseFirestore.instance.collection('orders');
  List<Map<String, dynamic>> orders = [];
  Future getMyOrders() async {
    try {
      orderRef.snapshots().listen((event) {
        orders = [];
        for (var doc in event.docs) {
          if (doc["id"] == FirebaseAuth.instance.currentUser!.uid) {
            orders.add(doc.data() as Map<String, dynamic>);
          }
        }
        // print(orders.length);
        emit(GetOrdersSuccessState());
      });
    } catch (e) {
      emit(GetOrdersFailureState(errorMessage: '$e'));
    }
  }
}
