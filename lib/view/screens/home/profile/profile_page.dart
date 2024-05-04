import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:myucommerce/view/cubits/profile_cubit/profile_cubit.dart';
import 'package:myucommerce/view/cubits/profile_cubit/profile_states.dart';
import 'package:myucommerce/view/screens/home/profile/my_orders_page.dart';
import 'package:myucommerce/view/screens/home/profile/who_we_are_page.dart';
import '../../../../helper/constants.dart';
import '../../../widgets/custom_listtile.dart';
import '../../../widgets/custom_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          BlocListener<ProfileCubit, ProfileStates>(
            listener: (context, state) {
              if (state is LoadingState) {}
            },
            child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: kPrimaryColor),
              accountName: CustomText(
                text: BlocProvider.of<ProfileCubit>(context).userModel.name,
                size: 20,
                color: Colors.white,
              ),
              accountEmail: CustomText(
                text: BlocProvider.of<ProfileCubit>(context).userModel.email,
                size: 18,
                color: Colors.white,
              ),
              // currentAccountPicture: Image.asset(kLogo)
            ),
          ),
          CustomListTile(
              leading: Icons.people,
              title: "who we are",
              ontap: () {
                Get.to(() => const WhoWeArePage());
              }),
          CustomListTile(
              leading: Icons.history,
              title: "Order History",
              ontap: () {
                BlocProvider.of<ProfileCubit>(context).getMyOrders();
                Get.to(() => MyOrdersPage());
              }),
          CustomListTile(
              leading: Icons.logout,
              title: "Log Out",
              ontap: () async {
                try {
                  FirebaseAuth.instance.signOut();
                  Get.offAllNamed('/');
                } catch (e) {
                  Get.snackbar('Error', '$e');
                }
              }),
          const CustomText(
              text: "Supervisor Dr. Yasser Fouda",
              size: 18,
              color: kPrimaryColor)
        ],
      )),
    );
  }
}
