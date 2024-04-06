import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:myucommerce/view/cubits/auth_cubit/auth_cubit.dart';
import 'package:myucommerce/view/cubits/card_cubit/card_cubit.dart';
import 'package:myucommerce/view/cubits/explore_cubit/explore_cubit.dart';
import 'package:myucommerce/view/cubits/profile_cubit/profile_cubit.dart';
import 'package:myucommerce/view/screens/auth/login_page.dart';
import 'package:myucommerce/view/screens/auth/register_page.dart';
import 'package:myucommerce/view/screens/home/home_page.dart';

import 'firebase_options.dart';

bool? islogin;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // to get path of storage place user generator
  var path = Directory.current.path;
  // to initialize Hive
  Hive.init(path);
  // You can provide a [subDir] where the boxes should be stored.
  await Hive.initFlutter();
  await Hive.openBox('order');
  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    islogin = false;
  } else {
    islogin = true;
  }
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => AuthCubit(),
      ),
      BlocProvider(
        create: (context) => ExploreCubit(),
      ),
      BlocProvider(
        create: (context) => CardCubit(),
      ),
      BlocProvider(
        create: (context) => ProfileCubit(),
      ),
    ],
    child: const MyUApp(),
  ));
}

class MyUApp extends StatelessWidget {
  const MyUApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(
          name: '/register',
          page: () => RegisterPage(),
        ),
        GetPage(
          name: '/home',
          page: () => const BNBCounter(),
        ),
      ],
      initialRoute: islogin == true ? '/home' : '/',
    );
  }
}
