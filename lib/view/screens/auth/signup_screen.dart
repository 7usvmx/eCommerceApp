import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controller/auth/signup_controller.dart';
import 'package:shop/core/constants/image_asset.dart';
import 'package:shop/core/functions/alerts_functions.dart';
import 'package:shop/core/shared/hey_widget.dart';
import '../../../core/shared/button.dart';
import '../../../core/shared/text_button.dart';
import '../../widgets/auth/or_sign_with_social_medial.dart';
import '../../widgets/auth/signup_fields.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SignupControllerImp controller = Get.put(SignupControllerImp());

    return Scaffold(
        resizeToAvoidBottomInset: false,
        // ignore: deprecated_member_use
        body: WillPopScope(
          onWillPop: Alerts().exitAlert,
          child: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset(
                    ImageAsset.signupTop,
                  ),
                ),
                ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Form(
                          key: SignupControllerImp.signUpFormKey,
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              children: [
                                // const SizedBox(height: 23),
                                //! Welcome Message
                                HeyWidget(name: "signupWithUs".tr),
                                const SizedBox(height: 23),
                                Text(
                                  "signinWith".tr,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    height: 1.4,
                                  ),
                                ),
                                const SizedBox(height: 30),
                                //! Text Fields
                                SignupFields(
                                  email: controller.email,
                                  password: controller.password,
                                  isPassword: controller.isPassword,
                                  fullName: controller.fullName,
                                  userName: controller.userName,
                                  phone: controller.phone,
                                ),
                                //! Forget password and remember me

                                const SizedBox(height: 20),
                                GetBuilder<SignupControllerImp>(
                                  builder: (api) => Submit(
                                    text: "signup".tr,
                                    isLoading: api.isLoading,
                                    onPressed: () {
                                      controller.signup();
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
                                      "haveAccount".tr,
                                    ),
                                    CustomTextButton(
                                      title: "signin".tr,
                                      onPressed: () {
                                        //!Go to signin page
                                        controller.goToSignin();
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
              ],
            ),
          ),
        ));
  }
}
