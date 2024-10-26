import 'package:flutter/material.dart';
import 'package:myucommerce/helper/extensions/extensions.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool isPassword;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final Widget? icon;
  final String? errorText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  const MyTextField({
    super.key,
    this.icon,
    this.validator,
    this.controller,
    this.hintText,
    this.errorText,
    this.keyboardType,
    this.onChanged,
    this.isPassword = false,
    this.suffixIcon,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      obscureText: widget.isPassword == true ? obscureText : false,
      decoration: InputDecoration(
        suffixIcon: widget.suffixIcon ??
            (widget.isPassword == true
                ? InkWell(
                    onTap: () {
                      obscureText = !obscureText;
                      setState(() {});
                    },
                    child: Icon(
                      !obscureText ? Icons.remove_red_eye_rounded : Icons.remove_red_eye,
                    ).paddingSymmetric(horizontal: 15))
                : null),
        prefixIcon: widget.icon,
        hintText: widget.hintText,
        errorText: widget.errorText == null || widget.errorText == ''
            ? null
            : widget.errorText, // Automatically shows error text if needed
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[200], // Light background for better visibility
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(), // Default border
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(), // Focused border with color
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(width: 0.0), // Error border
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(width: 0.0), // Focused error border
        ),
      ),
      validator: widget.validator,
      onChanged: widget.onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction, // Validate as user types
      textInputAction: TextInputAction.next, // Adds a 'next' button on the keyboard
    );
  }
}
