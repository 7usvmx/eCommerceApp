import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shop/core/classes/request_status.dart';
import 'package:shop/core/constants/app_routes.dart';
import 'package:shop/core/functions/check_internet_connection.dart';
import 'package:shop/core/functions/data_handler.dart';
import '../../../core/constants/messages/alerting_messages.dart';
import '../../../core/services/services.dart';
import '../../../core/shared/get_dialog.dart';
import '../../../data/datasource/remote/auth/check_reset_password_verify_code.dart';
import '../../../data/datasource/remote/auth/forget_password.dart';

abstract class ForgetPasswordController extends GetxController {
  sendCode();
  goToSignin();
  goToResetPassword();
  checkVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;

  GlobalKey<FormState> key = GlobalKey<FormState>();

  late String code;

  bool isLoading = false;
  ForgetPassword forgetPassword = ForgetPassword(Get.find());

  Services services = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  //  statusRequest = StatusRequest.none;

  @override
  sendCode() async {
    if (key.currentState!.validate()) {
      isLoading = true;
      update();
      if (await checkInternetConnection()) {
        var response = await forgetPassword.postData(email.text);
        statusRequest = handlingData(response);
        update();
        if (response['status'] == "success") {
          statusRequest = handlingData(response);
          update();
          services.sharedPref.setString("email", email.text);
          Get.toNamed(AppRoutes.verifyResetCode);
        } else if (response['status'] == "userNotFound") {
          statusRequest = StatusRequest.failure;
          update();
          getDialog(
            ErrorMessages.tryAgain,
            ErrorMessages.noUserByThisEmail,
            ErrorMessages.alert,
            () {},
          );
        } else if (response['error'] == "tryAgain") {
          getDialog(
            ErrorMessages.tryAgain,
            ErrorMessages.tryAgain,
            ErrorMessages.alert,
            () {},
          );
        } else {
          print("Code Not sent");
        }
        isLoading = false;
        update();
      }
    } else {
      statusRequest = StatusRequest.offlineFailure;
      update();
    }
  }

  CheckResetPasswordVerifyCode check = CheckResetPasswordVerifyCode(Get.find());

  @override
  checkVerifyCode() async {
    if (key.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await check.postData(email.text, code);

      if (response['status'] == 'codeIsTrue') {
        statusRequest = handlingData(response);
        update();
        goToResetPassword();
      } else if (response['status'] == 'errorCode') {
        statusRequest = StatusRequest.failure;
        update();
        getDialog(
          ErrorMessages.tryAgain,
          ErrorMessages.verifyCodeError,
          ErrorMessages.alert,
          () {
            Get.back();
          },
        );
      }
    }
  }

  @override
  goToSignin() {
    Get.offNamed(AppRoutes.signin);
  }

  @override
  goToResetPassword() {
    Get.offNamed(AppRoutes.resetPassword);
  }

  @override
  void onInit() {
    email = TextEditingController();
    code = "";

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
