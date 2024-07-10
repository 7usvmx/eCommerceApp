import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shop/core/constants/image_asset.dart';

import '../../../../core/constants/app_routes.dart';
import '../../../../core/shared/button.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(ImageAsset.done),
            const SizedBox(height: 30),
            Text("successfullyResetPassword".tr),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Submit(
                text: "signin".tr,
                isLoading: false,
                onPressed: () {
                  Get.offAllNamed(AppRoutes.signin);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
