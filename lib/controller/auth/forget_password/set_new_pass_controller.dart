import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/app_routes.dart';
import 'package:shop/core/constants/messages/alerting_messages.dart';
import 'package:shop/core/services/services.dart';
import 'package:shop/core/shared/get_dialog.dart';
import 'package:shop/data/datasource/remote/auth/set_new_password.dart';

abstract class SetNewPassController extends GetxController {
  updatePassword();
  goToSuccess();
}

class SetNewPassControllerImp extends SetNewPassController {
  late TextEditingController password;
  late TextEditingController rePassword;
  late String email;
  bool isLoading = false;
  final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  SetNewPassword setNewPassword = SetNewPassword(Get.find());
  Services services = Get.find();

  @override
  updatePassword() async {
    isLoading = true;
    update();

    if (forgetPasswordFormKey.currentState!.validate()) {
      if (password.text == rePassword.text) {
        var response = await setNewPassword.postData(
          email,
          password.text,
        );
        isLoading = false;
        update();
        if (response['status'] == 'success') {
          goToSuccess();
        }
        // Get.toNamed(AppRoutes.successResetPassword);
      } else {
        getDialog(
          ErrorMessages.tryAgain,
          ErrorMessages.passwordNotMatch,
          ErrorMessages.alert,
          () {
            Get.back();
          },
        );
        isLoading = false;
        update();
      }
    }
  }

  @override
  goToSuccess() {
    Get.offNamed(AppRoutes.successResetPassword);
  }

  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();
    email = services.sharedPref.getString("email")!;
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }
}
