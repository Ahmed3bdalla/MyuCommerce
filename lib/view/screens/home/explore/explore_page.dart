import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:myucommerce/helper/constants.dart';
import 'package:myucommerce/view/cubits/explore_cubit/explore_cubit.dart';
import 'package:myucommerce/view/cubits/explore_cubit/explore_state.dart';

import '../../../../model/product_model.dart';
import '../../../widgets/custom_text.dart';
import 'product_details.dart';

class ExplorePage extends StatelessWidget {
  ExplorePage({super.key});
  List<ProductModel> lproducts = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExploreCubit, ExploreStates>(
        listener: (context, state) {
      if (state is DataSuccess) {
        lproducts = state.productlist;
      } else if (state is DataFailure) {
        // showSnackBar(context, state.errMessage);
        Get.snackbar('Error', state.errMessage);
      }
    }, builder: (context, state) {
      if (state is LoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: Get.height / 15,
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20),
                //   child: TextField(
                //     // keyboardType:KeyboardKey(),
                //     decoration: InputDecoration(
                //       prefixIcon: const Icon(Icons.search),
                //       labelText: "Search",
                //       labelStyle: const TextStyle(color: kPrimaryColor),
                //       hintText: "Search",
                //       border: OutlineInputBorder(
                //           borderSide: const BorderSide(color: kPrimaryColor),
                //           borderRadius: BorderRadius.circular(30)),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: Get.height / 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Sections",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                SizedBox(
                  height: Get.height / 80,
                ),
                SizedBox(
                    height: Get.height / 5,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                color: Colors.grey,
                                height: Get.height / 5,
                                width: Get.height / 4,
                                child: const Center(
                                    child: Text(
                                  ' \tاقسام\nكليه علوم',
                                  style: TextStyle(fontSize: 30),
                                )),
                              ),
                            ),
                          );
                        })),
                SizedBox(
                  height: Get.height / 80,
                ),
                Container(
                  width: Get.width,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: const CustomText(
                    text: "All Products",
                    size: 30,
                    color: Colors.black,
                  ),
                  // child: Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const CustomText(
                  //       text: "Best Selling",
                  //       size: 30,
                  //       color: Colors.black,
                  //     ),
                  //     TextButton(
                  //         onPressed: () {},
                  //         child: const CustomText(
                  //           color: kPrimaryColor,
                  //           text: "See all",
                  //           size: 18,
                  //         )),
                  //   ],
                  // ),
                ),
                SizedBox(
                  height: Get.height / 80,
                ),
                SizedBox(
                  height: Get.height / 2.15,
                  width: double.infinity,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: lproducts.length,
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () {
                            Get.to(() => const ProductDetielsPage(),
                                arguments: lproducts[i]);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.all(8),
                            color: Colors.grey[200],
                            width: Get.width / 2,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                      height: 200,
                                      width: 200,
                                      child: Image.network(lproducts[i].pic)),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: lproducts[i].name,
                                          size: 18,
                                          color: Colors.black,
                                        ),
                                        Text(
                                          lproducts[i].disc,
                                          maxLines: 1,
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                        CustomText(
                                          text: '\$${lproducts[i].price}',
                                          size: 22,
                                          color: kPrimaryColor,
                                        ),
                                      ]),
                                ]),
                          ),
                        );
                      }),
                )
              ]),
        ),
      );
    });
  }
}
