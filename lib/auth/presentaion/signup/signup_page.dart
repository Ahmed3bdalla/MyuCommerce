import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:myucommerce/auth/presentaion/signup/bloc/sign_up_bloc.dart';
import '../../../helper/constants.dart';
import '../../../view/widgets/custom_textfield.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  @override
  Widget build(BuildContext context) {
    final bloc = SignUpBloc();
    return Scaffold(
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
          Column(
            children: [
              StreamBuilder<String>(
                  stream: bloc.idError,
                  builder: (context, snapshot) {
                    return MyTextField(
                      errorText: snapshot.data,
                      icon: const Icon(Icons.person),
                      onChanged: (p0) {
                        bloc.updateId(p0);
                      },
                      hintText: 'ID',
                      // obscureText: false,
                    );
                  }),
              SizedBox(
                height: Get.height * 0.01,
              ),
              StreamBuilder<String>(
                  stream: bloc.nameError,
                  builder: (context, snapshot) {
                    return MyTextField(
                      errorText: snapshot.data,
                      icon: const Icon(Icons.person),
                      onChanged: (p0) {
                        bloc.updateName(p0);
                      },
                      hintText: 'Username',
                      // obscureText: false,
                    );
                  }),
              SizedBox(
                height: Get.height * 0.01,
              ),
              // Email
              StreamBuilder<String>(
                  stream: bloc.emailError,
                  builder: (context, snapshot) {
                    return MyTextField(
                      errorText: snapshot.data,
                      icon: const Icon(Icons.person),
                      onChanged: (p0) {
                        bloc.updateEmail(p0);
                      },
                      hintText: 'Email',
                    );
                  }),
              SizedBox(
                height: Get.height * 0.01,
              ),

              /// password
              StreamBuilder<String>(
                  stream: bloc.passError,
                  builder: (context, snapshot) {
                    return MyTextField(
                      errorText: snapshot.data,
                      icon: const Icon(Icons.lock_open),
                      onChanged: (p0) {
                        bloc.updatePass(p0);
                      },
                      hintText: 'Password',
                      isPassword: true,
                    );
                  }),
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
                            color: kPrimaryColor, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              SizedBox(height: Get.height * 0.003),

              /// Register Button
              BlocBuilder<SignUpBloc, SignUpState>(
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
                          bloc.add(SignUp());
                        },
                        child: state is SignUpLoadingState
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                "Register",
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    );
                  })
            ],
          ).paddingSymmetric(horizontal: 20, vertical: 20),
        ],
      ),
    );
  }
}
