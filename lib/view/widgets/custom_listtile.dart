import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.leading,
      required this.title,
      required this.ontap});
  final String title;
  final IconData leading;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(5),
          color: const Color(0xffff5b5b),
          child: Icon(
            leading,
            color: Colors.black,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 22),
        ),
        onTap: ontap,
      ),
    );
  }
}
