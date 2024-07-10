import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controller/auth/signin_controller.dart';
import 'package:shop/core/shared/button.dart';
import 'package:shop/view/widgets/auth/forget_and_remember.dart';
import '../../../core/functions/alerts_functions.dart';
import '../../../core/shared/text_button.dart';
import '../../widgets/auth/or_sign_with_social_medial.dart';
import '../../widgets/auth/signin_in_fields.dart';

// ignore: must_be_immutable
class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SigninControllerImp controller = Get.put(SigninControllerImp());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: Alerts().exitAlert,
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Form(
                        key: controller.signInFormKey,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            children: [
                              //! Welcome Message
                              Text(
                                "welcome".tr,
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                              const SizedBox(height: 23),
                              Text(
                                "signinWith".tr,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  height: 1.4,
                                ),
                              ),
                              const SizedBox(height: 23),
                              //! Text Fields
                              SignInFields(
                                email: controller.email,
                                password: controller.password,
                                isPassword: controller.isPassword,
                              ),
                              //! Forget password and remember me
                              ForgetAndRemember(
                                forgetPassword: () {
                                  controller.goToForgetPassword();
                                },
                                rememberMe: () {},
                              ),
                              const SizedBox(height: 20),
                              GetBuilder<SigninControllerImp>(
                                builder: (api) => Submit(
                                  text: "signin".tr,
                                  isLoading: api.isLoading,
                                  onPressed: () {
                                    controller.login();
                                  },
                                ),
                              ),
                              const SizedBox(height: 30),
                              const OrSignWithSocialMedial(),
                              const SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "doNotHaveAccount".tr,
                                  ),
                                  CustomTextButton(
                                    title: "signup".tr,
                                    onPressed: () {
                                      //!Go to signup page
                                      controller.goToSignup();
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
        ),
      ),
    );
  }
}
