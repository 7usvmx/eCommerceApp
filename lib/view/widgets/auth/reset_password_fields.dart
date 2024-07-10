import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/functions/input_validator.dart';
import '../../../core/localization/change_lang_controller.dart';
import '../../../core/shared/text_field.dart';

// ignore: must_be_immutable
class ResetPasswordFields extends GetView<ChangeLangController> {
  final TextEditingController password;
  final TextEditingController rePassword;

  const ResetPasswordFields({
    super.key,
    required this.password,
    required this.rePassword,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextForm(
          label: "password".tr,
          isPassword: true,
          inputType: TextInputType.text,
          prefixIcon: const Icon(Icons.lock_outline),
          controller: password,
          validate: (val) {
            return InputValidator().validator(val!, 8, 16, "password");
          },
        ),
        CustomTextForm(
          label: "rePassword".tr,
          isPassword: true,
          inputType: TextInputType.text,
          prefixIcon: const Icon(Icons.lock_outline),
          controller: rePassword,
          validate: (val) {
            return InputValidator().validator(val!, 8, 16, "password");
          },
        ),
      ],
    );
  }
}
