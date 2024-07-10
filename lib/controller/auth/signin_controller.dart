import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controller/auth/confirmations/confirm_email_controller.dart';
import 'package:shop/core/constants/app_routes.dart';
import 'package:shop/core/constants/messages/alerting_messages.dart';
import 'package:shop/core/shared/get_dialog.dart';
import 'package:shop/data/datasource/remote/auth/signin.dart';
import '../../core/classes/request_status.dart';
import '../../core/functions/data_handler.dart';
import '../../core/services/services.dart';

abstract class SigninController extends GetxController {
  login() {}
  goToSignup();
  goToForgetPassword();
}

class SigninControllerImp extends SigninController {
  //! Form Key
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  //! Variables
  late TextEditingController email;
  late TextEditingController password;
  bool isPassword = true;
  //! Icon
  Icon icon = const Icon(Icons.visibility_outlined);
  Services services = Get.find();

  bool isLoading = false;

  Signin signinCrud = Signin(Get.find());

  late StatusRequest statusRequest;

  showAndHidePassword() {
    isPassword = !isPassword;
    if (isPassword) {
      icon = const Icon(Icons.visibility_outlined);
    } else {
      icon = const Icon(Icons.visibility_off_outlined);
    }
    update();
  }

  // ConfirmEmailControllerImp confirmationController =
  //     Get.put(ConfirmEmailControllerImp());

  @override
  login() async {
    statusRequest = StatusRequest.loading;
    isLoading = true;
    update();
    var response = await signinCrud.postData(email.text, password.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          services.sharedPref.setBool("keepSigned", true);
          services.sharedPref.setString(
            "id",
            response["data"]["usersID"],
          );
          services.sharedPref.setString(
            "fullName",
            response["data"]["fullname"],
          );
          services.sharedPref.setString(
            "email",
            response["data"]["email"],
          );
          services.sharedPref
              .setString("userFullName", response["data"]["fullname"]);
          Get.offAllNamed(AppRoutes.home);
        } else if (response['status'] == 'emailError') {
          getDialog(
            ErrorMessages.tryAgain,
            ErrorMessages.emailError,
            ErrorMessages.alert,
            () {
              Get.back();
            },
          );
        } else if (response['status'] == 'passwordError') {
          getDialog(
            ErrorMessages.tryAgain,
            ErrorMessages.passwordError,
            ErrorMessages.alert,
            () {
              Get.back();
            },
          );
        } else if (response['status'] == 'notVerified') {
          services.sharedPref.setString("email", email.text);
          getDialog(
            ErrorMessages.sendCode,
            ErrorMessages.notVerified,
            ErrorMessages.alert,
            () {
              ConfirmEmailControllerImp c = Get.put(ConfirmEmailControllerImp());
              c.resendCode();
            },
          );
        } else if (response['status'] == 'failure') {
          getDialog(
            ErrorMessages.tryAgain,
            ErrorMessages.passwordError,
            ErrorMessages.alert,
            () {
              Get.back();
            },
          );
        }
      }
    }
    isLoading = false;
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  goToSignup() {
    Get.offNamed(AppRoutes.signup);
  }

  @override
  goToForgetPassword() {
    Get.offNamed(AppRoutes.forgetPassword);
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
