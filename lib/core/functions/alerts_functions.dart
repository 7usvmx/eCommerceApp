import 'dart:io';

import 'package:get/get.dart';
import 'package:shop/core/shared/button.dart';

class Alerts {
  //! Exit Alert function
  Future<bool> exitAlert() {
    Get.defaultDialog(
      title: "titleExitAlert".tr,
      middleText: "exitAlert".tr,
      actions: [
        Submit(
          text: "exit".tr,
          isLoading: false,
          onPressed: () {
            exit(0);
          },
        ),
        Submit(
          text: "no".tr,
          isLoading: false,
          onPressed: () {
            Get.back();
          },
        ),
      ],
    );
    return Future.value(true);
  }
}
