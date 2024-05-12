import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final input_icon;
  final String hintText;
  final bool obsecure;
  final Color backgroundColor;

  const MyTextField({
    super.key,
    required this.controller,
    required this.input_icon,
    required this.hintText,
    required this.obsecure,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obsecure,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: backgroundColor,
            filled: true,
            hintText: hintText,
            prefixIcon: input_icon,
            hintStyle: TextStyle(color: Colors.grey[500])),
      ),
    );
  }
}
