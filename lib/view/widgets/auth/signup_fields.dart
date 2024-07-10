import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controller/auth/signin_controller.dart';
import 'package:shop/core/functions/input_validator.dart';
import '../../../core/shared/text_field.dart';

// ignore: must_be_immutable
class SignupFields extends StatelessWidget {
  final TextEditingController email;
  final TextEditingController fullName;
  final TextEditingController userName;
  final TextEditingController password;
  final TextEditingController phone;
  bool isPassword;
  SignupFields({
    super.key,
    required this.email,
    required this.password,
    required this.isPassword,
    required this.fullName,
    required this.userName,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(SigninControllerImp());
    return Column(
      children: [
        CustomTextForm(
          label: "fullName".tr,
          isPassword: false,
          inputType: TextInputType.text,
          prefixIcon: const Icon(Icons.person_2_outlined),
          controller: fullName,
          validate: (val) {
            return InputValidator().validator(val!, 3, 30, "fullName");
          },
        ),
        CustomTextForm(
          label: "username".tr,
          isPassword: false,
          inputType: TextInputType.text,
          prefixIcon: const Icon(Icons.person_2_outlined),
          controller: userName,
          validate: (val) {
            return InputValidator().validator(val!, 6, 16, "username");
          },
        ),
        CustomTextForm(
          label: "phone".tr,
          isPassword: false,
          inputType: TextInputType.phone,
          prefixIcon: const Icon(Icons.phone_iphone_outlined),
          controller: phone,
          validate: (val) {
            return InputValidator().validator(val!, 10, 14, "phone");
          },
        ),
        CustomTextForm(
          label: "email".tr,
          isPassword: false,
          inputType: TextInputType.emailAddress,
          prefixIcon: const Icon(Icons.email_outlined),
          controller: email,
          validate: (val) {
            return InputValidator().validator(val!, 10, 50, "email");
          },
        ),
        GetBuilder<SigninControllerImp>(
          builder: (c) {
            return CustomTextForm(
              label: "pass".tr,
              isPassword: c.isPassword,
              inputType: TextInputType.emailAddress,
              prefixIcon: const Icon(Icons.lock_outlined),
              suffixIcon: IconButton(
                onPressed: () {
                  c.showAndHidePassword();
                },
                icon: c.icon,
              ),
              controller: password,
              validate: (val) {
                return InputValidator().validator(val!, 8, 16, "password");
              },
            );
          },
        ),
      ],
    );
  }
}
