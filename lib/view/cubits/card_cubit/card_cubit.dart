// import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:myucommerce/view/cubits/card_cubit/card_states.dart';

import '../../../model/product_model.dart';

class CardCubit extends Cubit<CardStates> {
  CardCubit() : super(InitialState());

  List<Map<String, dynamic>> list = [];
  var box = Hive.box('order');
  //Add items to cart
  Future<void> addToCart(context, ProductModel productModel) async {
    emit(LoadingState());
    try {
      if (list.isEmpty) {
        box.add({
          'name': productModel.name,
          'disc': productModel.disc,
          'price': productModel.price,
          'pic': productModel.pic,
          'id': FirebaseAuth.instance.currentUser!.uid,
          'quantity': productModel.quantity
        });
      } else {
        for (int i = 0; i < list.length; i++) {
          if (productModel.name == list[i]["name"]) {
            return;
          }
        }
        box.add({
          'name': productModel.name,
          'disc': productModel.disc,
          'price': productModel.price,
          'pic': productModel.pic,
          'id': FirebaseAuth.instance.currentUser!.uid,
          'quantity': productModel.quantity
        });
      }
      Get.snackbar('Success', 'Added to cart');
      getCartproducts();
      emit(AddedSuccessState());
    } catch (e) {
      emit(AddedFailureState(message: '$e'));
    }
  }
  //get All cart Products
  List<Map<String, dynamic>> mylist = [];
  getCartproducts() {
    mylist = [];
    list = [];
    try {
      // =================================
      list = box.keys.map((e) {
        var current = box.get(e);
        return {
          'name': current['name'],
          'disc': current['disc'],
          'pic': current['pic'],
          'price': current['price'],
          'id': current['id'],
          'key': e,
          'quantity': current['quantity']
        };
      }).toList();
      mylist = list
          .where((element) =>
              element["id"] == FirebaseAuth.instance.currentUser!.uid)
          .toList();
      emit(AddedSuccessState());
    } catch (e) {
      emit(AddedFailureState(message: '$e'));
    }
  }

  double totalPrice = 0;
  getTotalPrice() {
    totalPrice = 0;
    for (int i = 0; i < mylist.length; i++) {
      totalPrice += double.parse(mylist[i]['price']) * mylist[i]['quantity'];
      // print(totalPrice);
    }
  }

  checkedOut() async {
    await saveOrder(mylist, totalPrice);
    totalPrice = 0;
    await box.clear();
    mylist = [];
    emit(CheckoutInProgressState());
  }
  // save order in (firebase)
  saveOrder(List<Map<String, dynamic>> list, double total) async {
    // var random = Random().nextInt(1000000);
    await FirebaseFirestore.instance.collection('orders').add({
      FirebaseAuth.instance.currentUser!.uid: list,
      "total": total,
      "dateTime": DateTime.now(),
    });
  }
//  decrease quantity  of an item in the cart
  sum(int index) {
    mylist[index]['quantity'] += 1;
    emit(SummitionState());
  }
  // decrease quantity  of an item in the cart
  sub(int index) {
    if (mylist[index]['quantity'] == 1) {
    } else {
      mylist[index]['quantity']--;
      emit(SummitionState());
    }
  }

  //delete product from cart
  deleteProductFromCart({required int key}) async {
    await box.delete(key);
    emit(DeleteProductState());
  }
}
