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
    // const SavedPage(),
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
            selectedFontSize: 22,
            selectedItemColor: kPrimaryColor,
            items: const [
              BottomNavigationBarItem(
                label: "*",
                activeIcon: Text(
                  'Explore',
                  style: TextStyle(color: kPrimaryColor, fontSize: 20),
                ),
                icon: Icon(Icons.mouse_outlined),
              ),
              BottomNavigationBarItem(
                label: "*",
                activeIcon: Text(
                  'Cart',
                  style: TextStyle(color: kPrimaryColor, fontSize: 20),
                ),
                icon: Icon(Icons.shopping_bag),
              ),
              BottomNavigationBarItem(
                  label: "*",
                  activeIcon: Text(
                    'Account',
                    style: TextStyle(color: kPrimaryColor, fontSize: 20),
                  ),
                  icon: Icon(Icons.person)),
            ]),
        body: screens.elementAt(counter));
  }
}
