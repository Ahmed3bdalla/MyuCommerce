import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final String? Function(String?) validator;
  final Widget? icon;
  const MyTextField({
    super.key,
    required this.icon,
    required this.validator,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: icon,
          hintText: hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
        controller: controller,
        validator: validator);
  }
}
