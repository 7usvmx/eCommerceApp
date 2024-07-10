import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/app_routes.dart';
import 'package:shop/core/shared/button.dart';

class SuccessSignedUp extends StatelessWidget {
  const SuccessSignedUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 200,
              color: Colors.greenAccent,
            ),
            const SizedBox(height: 30),
            Text("successfullySignedUp".tr),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Submit(
                text: "goToHome".tr,
                isLoading: false,
                onPressed: () {
                  Get.offAllNamed(AppRoutes.home);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
