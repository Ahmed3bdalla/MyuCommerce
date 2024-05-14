import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:myucommerce/helper/constants.dart';
import 'package:myucommerce/view/cubits/card_cubit/card_states.dart';
import 'package:myucommerce/view/cubits/card_cubit/card_cubit.dart';

import '../../../../model/product_model.dart';
import '../../../widgets/custom_text.dart';

class ProductDetielsPage extends StatelessWidget {
  const ProductDetielsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductModel product = Get.arguments;
    return BlocListener<CardCubit, CardStates>(
      listener: (context, state) {},
      child: Scaffold(
          body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back))),
                SizedBox(
                    height: Get.height / 3, child: Image.network(product.pic)),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          text: product.name, size: 26, color: Colors.black),
                      SizedBox(
                        height: Get.height / 30,
                      ),
                      SizedBox(
                        height: Get.height / 30,
                      ),
                      const CustomText(
                          text: "Discreption", size: 20, color: Colors.black),
                      Text(
                        product.disc,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(15),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Price",
                        style: TextStyle(fontSize: 25),
                      ),
                      CustomText(
                        color: kPrimaryColor,
                        text: '\$${product.price}',
                        size: 18,
                      )
                    ],
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10)),
                      onPressed: () {
                        BlocProvider.of<CardCubit>(context)
                            .addToCart(context, product);
                      },
                      child: const Text(
                        "Add",
                        style: TextStyle(fontSize: 25),
                      ))
                ]),
          )
        ],
      )),
    );
  }
}
