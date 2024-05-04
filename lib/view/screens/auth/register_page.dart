import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../helper/constants.dart';
import '../../cubits/auth_cubit/auth_cubit.dart';
import '../../cubits/auth_cubit/auth_states.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/mybutton.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is LoadingState) {
            Get.defaultDialog(
                title: "Loading",
                content: const CircularProgressIndicator(),
                barrierDismissible: false);
          } else if (state is RegisterSuccess) {
            Get.offAllNamed('/home');
          } else if (state is RegisterFailure) {
            Get.back();
            Get.snackbar('Error', state.errorMessage);
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          body: ListView(
            children: [
              SizedBox(
                height: Get.height * 0.02,
              ),
              Image.asset(
                kLogo,
                height: Get.height * 0.2,
                width: Get.width,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Hello',
                ),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      MyTextField(
                          icon: const Icon(Icons.person),
                          validator: (value) {
                            if (value!.length != 9) {
                              return 'Please enter Your ID like that 800******';
                            }
                            return null;
                          },
                          controller: idController,
                          hintText: 'ID',
                          obscureText: false),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      MyTextField(
                          icon: const Icon(Icons.person),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Username';
                            }
                            return null;
                          },
                          controller: usernameController,
                          hintText: 'Username',
                          obscureText: false),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      // Email
                      MyTextField(
                          icon: const Icon(Icons.person),
                          validator: (value) {
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value!)) {
                              return "Enter a valid Email";
                            }
                            return null;
                          },
                          controller: emailController,
                          hintText: 'Email',
                          obscureText: false),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),

                      /// password
                      MyTextField(
                          icon: const Icon(Icons.lock_open),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Password';
                            }
                            return null;
                          },
                          controller: passController,
                          hintText: 'Password',
                          obscureText: true),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'If you have already an Account',
                            textAlign: TextAlign.center,
                          ),
                          TextButton(
                              onPressed: () {
                                Get.offAllNamed('/');
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                      SizedBox(height: Get.height * 0.003),

                      /// Register Button
                      MyButton(
                          onTap: () async {
                            if (formkey.currentState!.validate()) {
                              await BlocProvider.of<AuthCubit>(context)
                                  .registerUser(
                                      username: usernameController.text,
                                      id: idController.text,
                                      email: emailController.text,
                                      password: passController.text);
                            } else {}
                          },
                          text: "Register"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
