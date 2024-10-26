import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:myucommerce/auth/presentaion/login/bloc/login_bloc.dart';
import 'package:myucommerce/helper/constants.dart';
import '../../../view/widgets/custom_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    final bloc = LoginBloc();
    return Scaffold(
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
          Column(
            children: [
              StreamBuilder<String>(
                  stream: bloc.emailError,
                  builder: (context, snapshot) {
                    return MyTextField(
                      errorText: snapshot.data,
                      icon: const Icon(Icons.person),
                      onChanged: (email) {
                        bloc.add(UpdateEmail(email: email));
                      },
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter email';
                      //   } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      //     return "Enter a valid Email";
                      //   }
                      //   return null;
                      // },
                      hintText: 'Email',
                    );
                  }),
              SizedBox(
                height: Get.height * 0.02,
              ),
              StreamBuilder<String>(
                  stream: bloc.passError,
                  builder: (context, snapshot) {
                    return MyTextField(
                      errorText: snapshot.data,
                      isPassword: true,
                      onChanged: (pass) {
                        bloc.add(UpdatePass(pass: pass));
                      },
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter Password';
                      //   }
                      //   return null;
                      // },
                      icon: const Icon(Icons.lock_open),
                      // controller: bloc.passController,
                      hintText: 'Password',
                    );
                  }),
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
                            color: kPrimaryColor, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),

              /// Login Button
              BlocBuilder<LoginBloc, LoginState>(
                  bloc: bloc,
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(kPrimaryColor),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        onPressed: () {
                          bloc.add(Login());
                        },
                        child: state is LoginLoadingState
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    );
                  })
            ],
          ).paddingSymmetric(horizontal: 20),
        ],
      ),
    );
  }
}
