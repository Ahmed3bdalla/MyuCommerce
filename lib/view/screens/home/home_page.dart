import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myucommerce/helper/constants.dart';
import 'package:myucommerce/view/cubits/card_cubit/card_cubit.dart';
import 'package:myucommerce/view/cubits/explore_cubit/explore_cubit.dart';
import 'package:myucommerce/view/cubits/profile_cubit/profile_cubit.dart';
import 'package:myucommerce/view/screens/home/cart/cart_page.dart';
import 'package:myucommerce/view/screens/home/explore/explore_page.dart';
import 'package:myucommerce/view/screens/home/profile/profile_page.dart';

class BNBCounter extends StatefulWidget {
  const BNBCounter({super.key});

  @override
  State<BNBCounter> createState() => _BNBCounterState();
}

class _BNBCounterState extends State<BNBCounter> {
  int counter = 0;
  List<Widget> screens = [
    ExplorePage(),
    CartPage(),
    const ProfilePage(),
  ];
  @override
  void initState() {
    BlocProvider.of<ExploreCubit>(context).getProducts();
    BlocProvider.of<CardCubit>(context).getCartproducts();
    BlocProvider.of<ProfileCubit>(context).getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
            unselectedIconTheme: const IconThemeData(color: Colors.black),
            currentIndex: counter,
            onTap: (value) {
              setState(() {
                counter = value;
              });
            },
            selectedFontSize: 16,
            unselectedFontSize: 14,
            selectedItemColor: kPrimaryColor,
            items: const [
              BottomNavigationBarItem(
                label: "Explore",
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: "Cart",
                icon: Icon(Icons.shopping_bag),
              ),
              BottomNavigationBarItem(
                  label: "Account", icon: Icon(Icons.person)),
            ]),
        body: screens.elementAt(counter));
  }
}
