import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/app_routes.dart';
import 'package:shop/core/constants/colors.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainColor,
        tooltip: "addAddress".tr,
        onPressed: () {
          Get.toNamed(AppRoutes.addAddress);
        },
        child: Icon(
          Icons.add_location_alt_outlined,
          color: AppColors.white,
        ),
      ),
      appBar: AppBar(
        title: Text("addresses".tr),
        foregroundColor: AppColors.white,
      ),
    );
  }
}
