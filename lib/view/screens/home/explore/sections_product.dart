import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:myucommerce/model/product_model.dart';
import 'package:myucommerce/view/cubits/explore_cubit/explore_cubit.dart';
import 'package:myucommerce/view/cubits/explore_cubit/explore_state.dart';

import '../../../../helper/constants.dart';
import '../../../widgets/custom_text.dart';

class SectionsProducts extends StatelessWidget {
  SectionsProducts({super.key});
  List<ProductModel> lproducts = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text('MyuCommerce'),
          centerTitle: true,
        ),
        body: BlocConsumer<ExploreCubit, ExploreStates>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is SectionDataState) {
                lproducts = state.productlist;
              }
              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.6, crossAxisCount: 2),
                        itemCount: lproducts.length,
                        itemBuilder: (context, i) {
                          return Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.all(8),
                            color: kSeconderyColor,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      height: Get.height / 4,
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
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                        CustomText(
                                          text: '\$${lproducts[i].price}',
                                          size: 20,
                                          color: kPrimaryColor,
                                        ),
                                      ]),
                                ]),
                          );
                        }),
                  ),
                ],
              );
            }));
  }
}
