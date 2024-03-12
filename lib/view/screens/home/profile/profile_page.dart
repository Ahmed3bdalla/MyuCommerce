import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:myucommerce/view/cubits/profile_cubit/profile_cubit.dart';
import 'package:myucommerce/view/cubits/profile_cubit/profile_states.dart';

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
                currentAccountPicture: Image.asset('images/logo.jpg')),
          ),
          CustomListTile(
              leading: Icons.edit,
              title: "Edit Profile",
              ontap: () {
                return null;
              }),
          CustomListTile(
              leading: Icons.shopping_basket,
              title: "Shipping Address",
              ontap: () {
                return null;
              }),
          CustomListTile(
              leading: Icons.history,
              title: "Order History",
              ontap: () {
                return null;
              }),
          CustomListTile(
              leading: Icons.credit_card, title: "Cards", ontap: () {}),
          CustomListTile(
              leading: Icons.notifications,
              title: "Notifications",
              ontap: () {}),
          CustomListTile(
              leading: Icons.logout,
              title: "Log Out",
              ontap: () async {
                try {
                  FirebaseAuth.instance.signOut().then((value) {
                    Get.offAllNamed('/');
                  });
                } catch (e) {
                  Get.snackbar('Error', '$e');
                }
              }),
        ],
      )),
    );
  }
}
