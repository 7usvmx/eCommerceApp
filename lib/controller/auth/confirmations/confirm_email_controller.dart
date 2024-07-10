import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/classes/request_status.dart';
import 'package:shop/core/constants/app_routes.dart';
import 'package:shop/core/functions/data_handler.dart';
import 'package:shop/data/datasource/remote/auth/resend_code.dart';
import '../../../core/constants/messages/alerting_messages.dart';
import '../../../core/services/services.dart';
import '../../../core/shared/get_dialog.dart';
import '../../../data/datasource/remote/auth/verify_account.dart';

abstract class ConfirmEmailController extends GetxController {
  confirm();
  resendCode();
  goToSuccessSignedUp();
}

class ConfirmEmailControllerImp extends ConfirmEmailController {
  late TextEditingController code;

  late String email;
  StatusRequest? statusRequest;
  bool isLoading = false;

  Services services = Get.find();
  VerifyAccount verifyAccount = VerifyAccount(Get.find());

  @override
  confirm() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyAccount.postData(
      email,
      code.text,
    );

    if (response['status'] == 'success') {
      statusRequest = StatusRequest.success;
      update();
      Get.offAllNamed(AppRoutes.signin);
    } else if (response['status'] == 'errorCode') {
      getDialog(
        ErrorMessages.tryAgain,
        ErrorMessages.verifyCodeError,
        ErrorMessages.alert,
        () {
          Get.back();
        },
      );
    } else if (response['status'] == 'confirmed') {
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

  @override
  goToSuccessSignedUp() {}

  ResendCode resend = ResendCode(Get.find());

  @override
  resendCode() async {
    isLoading = true;
    statusRequest = StatusRequest.loading;
    update();
    var response = await resend.postData(email);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.toNamed(AppRoutes.confirmEmail);
      } else {
        statusRequest == StatusRequest.noData;
        update();
      }
    } else {
      statusRequest == StatusRequest.failure;
      update();
    }
  }

  @override
  void onInit() {
    code = TextEditingController();
    email = services.sharedPref.getString("email")!;
    super.onInit();
  }

  @override
  void dispose() {
    code.dispose();
    super.dispose();
  }
}



//   SigninControllerImp c = Get.put(SigninControllerImp());

//   ResendCode resend = ResendCode(Get.find());

//   @override
//   resendCode() async {
//     Map response = await resend.postData(c.email.text);

//     if (response['status'] == 'success') {
//       getDialog(
//         SuccessMessages.goToVerify,
//         SuccessMessages.codeSent,
//         "",
//         () {
//           Get.back();
//         },
//       );
//     } else if (response['status'] == 'errorCode') {
//       getDialog(
//         ErrorMessages.tryAgain,
//         ErrorMessages.verifyCodeError,
//         ErrorMessages.alert,
//         () {
//           Get.back();
//         },
//       );
//     }

//     // print(" EHey there ${code.text}");
//   }

//   @override
//   goToSuccessSignedUp() {
//     Get.toNamed(AppRoutes.successSignedUp);
//   }

//   @override
//   void onInit() {
//     code = TextEditingController();
//     super.onInit();
//   }

//   @override
//   void dispose() {
//     code.dispose();
//     super.dispose();
//   }
// }
