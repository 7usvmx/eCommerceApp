import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/app_routes.dart';
import 'package:shop/core/services/services.dart';
import 'package:shop/core/shared/get_dialog.dart';
import 'package:shop/data/datasource/remote/auth/signup.dart';
import '../../core/classes/request_status.dart';
import '../../core/constants/messages/alerting_messages.dart';
import '../../core/functions/data_handler.dart';

abstract class SignupController extends GetxController {
  signup() {}
  goToSignin();
  goToConfirmEmail();
}

class SignupControllerImp extends SignupController {
  late TextEditingController email;
  late TextEditingController fullName;
  late TextEditingController userName;
  late TextEditingController phone;
  late TextEditingController password;
  bool isPassword = true;
  bool isLoading = false;
  static final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  Services services = Get.find();

  Signup signupCrud = Signup(Get.find());
  List data = [];
  late StatusRequest statusRequest;

  @override
  signup() async {
    statusRequest = StatusRequest.loading;
    isLoading = true;
    update();
    var response = await signupCrud.postData(
      fullName.text,
      userName.text,
      email.text,
      password.text,
      phone.text,
    );
    statusRequest = handlingData(response);
    isLoading = false;
    update();
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        getDialog(
          SuccessMessages.goToVerify,
          SuccessMessages.registerSuccessfully,
          SuccessMessages.congratulation,
          () {
            services.sharedPref.setString("email", email.text);
            goToConfirmEmail();
          },
        );
      } else if (response['status'] == 'registered') {
        getDialog(
          ErrorMessages.tryAgain,
          ErrorMessages.emailAlreadyUsed,
          ErrorMessages.alert,
          () {
            Get.back();
          },
        );
      }
    }
    update();
  }

  @override
  void onInit() {
    

    email = TextEditingController();
    password = TextEditingController();
    fullName = TextEditingController();
    userName = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  goToConfirmEmail() {
    Get.offNamed(AppRoutes.confirmEmail);
  }

  @override
  goToSignin() {
    Get.offNamed(AppRoutes.signin);
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    fullName.dispose();
    userName.dispose();
    phone.dispose();
    super.dispose();
  }
}
