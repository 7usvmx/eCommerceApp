import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controller/auth/forget_password/set_new_pass_controller.dart';
import '../../../../core/shared/button.dart';
import '../../../widgets/auth/reset_password_fields.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SetNewPassControllerImp controller = Get.put(SetNewPassControllerImp());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                      key: controller.forgetPasswordFormKey,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            //! Welcome Message
                            Text(
                              "resetPasswordHead".tr,
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            const SizedBox(height: 23),
                            Text(
                              "resetPasswordBody".tr,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                height: 1.4,
                              ),
                            ),
                            const SizedBox(height: 23),
                            //! Text Fields
                            ResetPasswordFields(
                              password: controller.password,
                              rePassword: controller.rePassword,
                            ),
                            const SizedBox(height: 20),
                            GetBuilder<SetNewPassControllerImp>(builder: (c) {
                              return Submit(
                                text: "confirmNewPassword".tr,
                                isLoading: c.isLoading,
                                onPressed: () {
                                  controller.updatePassword();
                                },
                              );
                            }),
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
      ),
    );
  }
}
