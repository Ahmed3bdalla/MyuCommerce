import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:myucommerce/helper/constants.dart';
import 'package:myucommerce/view/widgets/myButton.dart';
import '../../cubits/auth_cubit/auth_cubit.dart';
import '../../cubits/auth_cubit/auth_states.dart';
import '../../widgets/custom_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is LoadingState) {
            Get.defaultDialog(
                title: "Loading",
                content: const CircularProgressIndicator(),
                barrierDismissible: false);
          } else if (state is LoginSuccess) {
            Get.offAllNamed("/home");
          } else if (state is LoginFailure) {
            Get.back();
            Get.snackbar('Error', state.errorMessage);
            // showSnackBar(context, state.errorMessage);
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          body: ListView(
            children: [
              SizedBox(
                height: Get.height * 0.1,
              ),
              Image.asset(
                kLogo,
                height: Get.height * 0.2,
                width: Get.width,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Welcome Back',
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      /// username or Email====================
                      MyTextField(
                          icon: const Icon(Icons.person),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email';
                            } else if (!RegExp(r'\S+@\S+\.\S+')
                                .hasMatch(value)) {
                              return "Enter a valid Email";
                            }
                            return null;
                          },
                          controller: emailController,
                          hintText: 'Email',
                          obscureText: false),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),

                      /// password==============================
                      MyTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Password';
                            }
                            return null;
                          },
                          icon: const Icon(Icons.lock_open),
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
                            'If you have not an Account',
                            textAlign: TextAlign.center,
                          ),
                          TextButton(
                              onPressed: () {
                                Get.offAllNamed('/register');
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),

                      /// Login Button
                      MyButton(
                          onTap: () async {
                            if (formkey.currentState!.validate()) {
                              await BlocProvider.of<AuthCubit>(context)
                                  .loginUser(
                                      email: emailController.text,
                                      password: passController.text);
                            } else {}
                          },
                          text: "Login")
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
