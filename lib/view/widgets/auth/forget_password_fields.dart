import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/functions/input_validator.dart';
import '../../../core/localization/change_lang_controller.dart';
import '../../../core/shared/text_field.dart';

// ignore: must_be_immutable
class ForgetPasswordFields extends GetView<ChangeLangController> {
  final TextEditingController email;

  const ForgetPasswordFields({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
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
      ],
    );
  }
}
