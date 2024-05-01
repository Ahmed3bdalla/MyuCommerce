import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myucommerce/helper/constants.dart';
import 'package:myucommerce/view/cubits/profile_cubit/profile_cubit.dart';
import 'package:myucommerce/view/cubits/profile_cubit/profile_states.dart';
import 'package:myucommerce/view/widgets/custom_text.dart';

class MyOrdersPage extends StatelessWidget {
  MyOrdersPage({super.key});
  List<Map<String, dynamic>> orders = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('My Orders'),
        centerTitle: true,
      ),
      body: BlocBuilder<ProfileCubit, ProfileStates>(
        builder: (context, state) {
          if (state is GetOrdersSuccessState) {
            orders = BlocProvider.of<ProfileCubit>(context).orders;
            // print(orders.length);
          } else if (state is GetOrdersFailureState) {
            return Center(child: Text(state.errorMessage));
          }
          return Column(children: [
            Expanded(
                child: ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (context, i) {
                      return Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(20),
                          color: kSeconderyColor,
                          child: SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(orders[i]['id']),
                                  const SizedBox(height: 5),
                                  const CustomText(
                                      text: 'Products',
                                      size: 20,
                                      color: Colors.black),
                                  const SizedBox(height: 5),
                                  ListView.builder(
                                      shrinkWrap: true, //important
                                      itemCount:
                                          orders[i]['order']?.length,
                                      itemBuilder: (context, index) {
                                        return SizedBox(
                                          child: Text(orders[i]['order'][index]
                                              ['name']),
                                        );
                                      }),
                                  const SizedBox(height: 10),
                                  const CustomText(
                                      text: 'Total',
                                      size: 18,
                                      color: Colors.black),
                                  CustomText(
                                      text: '${orders[i]['total']}',
                                      size: 16,
                                      color: kPrimaryColor),
                                ]),
                          ));
                    }))
          ]);
        },
      ),
    );
  }
}
