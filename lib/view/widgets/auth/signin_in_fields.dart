import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/signin_controller.dart';
import '../../../core/functions/input_validator.dart';
import '../../../core/shared/text_field.dart';

// ignore: must_be_immutable
class SignInFields extends StatelessWidget {
  final TextEditingController email;
  final TextEditingController password;
  bool isPassword;

  SignInFields({
    super.key,
    required this.email,
    required this.password,
    required this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(SigninControllerImp());
    return Column(
      children: [
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
