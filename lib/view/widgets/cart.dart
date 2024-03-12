import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myucommerce/helper/constants.dart';

import 'custom_text.dart';

class Cart extends StatelessWidget {
  const Cart(
      {super.key,
      required this.disc,
      required this.name,
      required this.pic,
      required this.price,
      required this.sum,
      required this.sub,
      });
  final String name;
  final String price;
  final String disc;
  final String pic;
  final int quantity = 1;
  final Function() sum;
  final Function() sub;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: Get.height / 6,
      color: Colors.grey[200],
      child: Row(
        children: [
          SizedBox(
              width: Get.width / 3, height: 100, child: Image.network(pic)),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: name,
                  size: 18,
                  color: Colors.black,
                ),
                CustomText(
                  text: '\$$price',
                  size: 18,
                  color: kPrimaryColor,
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: 70,
                  height: 30,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(onTap: sub, child: const Icon(Icons.remove)),
                      Text(
                        "$quantity",
                        style: const TextStyle(fontSize: 18),
                      ),
                      InkWell(onTap: sum, child: const Icon(Icons.add)),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
