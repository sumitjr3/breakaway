import 'package:breakaway/constants/themes.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final input_icon;
  final String hintText;
  final bool obsecure;

  const MyTextField({
    super.key,
    required this.controller,
    required this.input_icon,
    required this.hintText,
    required this.obsecure,
  });

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = AppTheme();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obsecure,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: appTheme.studyTheme.colorScheme.secondary),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: appTheme.studyTheme.colorScheme.primary),
            ),
            fillColor: appTheme.studyTheme.colorScheme.secondary,
            filled: true,
            hintText: hintText,
            prefixIcon: input_icon,
            hintStyle: const TextStyle(color: Colors.black54)),
      ),
    );
  }
}
