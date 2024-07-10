// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:shop/core/constants/colors.dart';

class CustomTextForm extends StatelessWidget {
  final String label;
  final dynamic isPassword;
  final inputType;
  final prefixIcon;
  final IconButton? suffixIcon;
  final controller;
  final String? Function(String?) validate;

  const CustomTextForm({
    super.key,
    required this.label,
    required this.isPassword,
    required this.inputType,
    required this.prefixIcon,
    required this.controller,
    this.suffixIcon,
    required this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 28),
      child: TextFormField(
        validator: validate,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textInputAction: TextInputAction.next,
        controller: controller,
        keyboardType: inputType,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.mainColor),
          ),
        ),
      ),
    );
  }
}
