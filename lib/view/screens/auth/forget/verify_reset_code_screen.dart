import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:shop/core/classes/handling_data_view.dart';
import '../../../../controller/auth/forget_password/forget_password_controller.dart';

class VerifyResetCodeScreen extends StatelessWidget {
  const VerifyResetCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("confirmEmail".tr),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: GetBuilder<ForgetPasswordControllerImp>(
          builder: (c) {
            return HandlingDataView(
              statusRequest: c.statusRequest,
              widget: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Form(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                children: [
                                  //! Welcome Message
                                  Text(
                                    "confirmEmail".tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge,
                                  ),
                                  const SizedBox(height: 23),
                                  Text(
                                    "enterCode".tr,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      height: 1.4,
                                    ),
                                  ),

                                  const SizedBox(height: 23),
                                  //! Text Fields
                                  OtpTextField(
                                    fieldWidth: 50.0,
                                    numberOfFields: 6,
                                    keyboardType: TextInputType.text,
                                    borderColor: const Color(0xFF512DA8),
                                    //set to true to show as box or false to show as dash
                                    showFieldAsBox: true,
                                    //runs when a code is typed in
                                    onCodeChanged: (String code) {
                                      //handle validation or checks here
                                    },
                                    //runs when every textfield is filled
                                    onSubmit: (String verificationCode) {
                                      c.code = verificationCode;
                                      c.checkVerifyCode();
                                    }, // end onSubmit
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
