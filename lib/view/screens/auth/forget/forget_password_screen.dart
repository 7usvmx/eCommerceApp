import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controller/auth/forget_password/forget_password_controller.dart';
import 'package:shop/core/classes/handling_data_view.dart';
import 'package:shop/view/widgets/auth/forget_password_fields.dart';
import '../../../../core/shared/button.dart';
import '../../../../core/shared/text_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                            key: c.key,
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                children: [
                                  //! Welcome Message
                                  Text(
                                    "forgetPasswordHead".tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge,
                                  ),
                                  const SizedBox(height: 23),
                                  Text(
                                    "forgetPasswordBody".tr,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      height: 1.4,
                                    ),
                                  ),
                                  const SizedBox(height: 23),
                                  //! Text Fields
                                  ForgetPasswordFields(
                                    email: c.email,
                                  ),
                                  const SizedBox(height: 20),
                                  GetBuilder<ForgetPasswordControllerImp>(
                                      builder: (c) {
                                    return Submit(
                                      text: "sendCode".tr,
                                      isLoading: c.isLoading,
                                      onPressed: () {
                                        c.sendCode();
                                        // Get.toNamed(AppRoutes.confirmCode);
                                      },
                                    );
                                  }),
                                  const SizedBox(height: 30),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "haveAccount".tr,
                                      ),
                                      CustomTextButton(
                                        title: "signin".tr,
                                        onPressed: () {
                                          c.goToSignin();
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
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
