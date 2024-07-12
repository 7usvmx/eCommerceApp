import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shop/core/constants/colors.dart';

class AddAddress extends GetView<AddAddress> {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("addAddress".tr),
        foregroundColor: AppColors.white,
      ),
      
    );
  }
}
