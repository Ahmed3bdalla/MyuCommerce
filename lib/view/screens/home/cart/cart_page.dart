import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:myucommerce/view/cubits/card_cubit/card_States.dart';
import 'package:myucommerce/view/cubits/card_cubit/card_cubit.dart';

import '../../../../helper/constants.dart';
import '../../../widgets/cart.dart';
import '../../../widgets/custom_text.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});
  List<Map<String, dynamic>> list = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardCubit, CardStates>(builder: (context, state) {
      if (state is AddedSuccessState) {
        list = BlocProvider.of<CardCubit>(context).mylist;
        BlocProvider.of<CardCubit>(context).getTotalPrice();
      } else if (state is CheckoutInProgressState) {
        list.clear();
      }
      return Scaffold(
          body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, i) {
                  return Cart(
                    disc: list[i]['disc'],
                    name: list[i]['name'],
                    pic: list[i]['pic'],
                    price: list[i]['price'].toString(),
                    sum: () {},
                    sub: () {},
                  );
                }),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      color: Colors.black,
                      text: "Total",
                      size: 22,
                    ),
                    CustomText(
                      color: kPrimaryColor,
                      text:
                          "\$${BlocProvider.of<CardCubit>(context).totalPrice}",
                      size: 22,
                    ),
                  ],
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: kPrimaryColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 18)),
                    onPressed: () {
                      if (list.isEmpty) {
                      } else {
                        BlocProvider.of<CardCubit>(context).checkedOut();
                        Get.snackbar('Success', 'Your order has been placed');
                      }
                    },
                    child: const CustomText(
                      text: "CHECKOUT",
                      size: 18,
                      color: Colors.white,
                    )),
              ],
            ),
          )
        ],
      ));
    });
  }
}
