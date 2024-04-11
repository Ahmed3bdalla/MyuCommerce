import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myucommerce/helper/constants.dart';

import 'custom_text.dart';

class Cart extends StatelessWidget {
  const Cart(
      {super.key,
      required this.name,
      required this.pic,
      required this.price,
      required this.sum,
      required this.sub,
      required this.quantity,
      required this.del});
  final String name;
  final String price;
  final String pic;
  final String quantity;
  final Function() sum;
  final Function() sub;
  final Function() del;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: Get.height / 6,
      color: kSeconderyColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: Get.width / 3, height: 100, child: Image.network(pic)),
            SizedBox(
              width: Get.width / 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
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
                            quantity,
                            style: const TextStyle(fontSize: 18),
                          ),
                          InkWell(onTap: sum, child: const Icon(Icons.add)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: Get.width / 4,
              child: InkWell(
                onTap: del,
                child: const Icon(Icons.delete),
              ),
            )
          ],
        ),
      ),
    );
  }
}
