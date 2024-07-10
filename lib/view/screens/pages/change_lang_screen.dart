import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/colors.dart';
import 'package:shop/view/widgets/lang/change_language_button.dart';

import '../../../core/localization/change_lang_controller.dart';

class ChangeLangScreen extends GetView<ChangeLangController> {
  const ChangeLangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.translate_outlined,
                  size: 70,
                  color: AppColors.mainColor,
                ),
                const SizedBox(height: 40),
                ChangeLangButton(
                  title: "English",
                  onTap: () {
                    controller.changeLang("en");
                    controller.goToSignUp();
                  },
                ),
                const SizedBox(height: 20),
                ChangeLangButton(
                  title: "عربي",
                  onTap: () {
                    controller.changeLang("ar");
                    controller.goToSignUp();
                  },
                ),
                const SizedBox(height: 20),
                Text("choseLang".tr),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
