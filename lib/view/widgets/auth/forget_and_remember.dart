import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/shared/text_button.dart';

class ForgetAndRemember extends StatelessWidget {
  final Function forgetPassword;
  final Function rememberMe;
  const ForgetAndRemember(
      {super.key, required this.forgetPassword, required this.rememberMe});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextButton(
          title: 'remember'.tr,
          onPressed: () {
            rememberMe();
          },
        ),
        CustomTextButton(
          title: 'forget'.tr,
          onPressed: () {
            forgetPassword();
          },
        ),
      ],
    );
  }
}
