import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/Theme/theme_data.dart';
import 'package:shop/core/constants/app_routes.dart';
import 'package:shop/core/services/services.dart';

class ChangeLangController extends GetxController {
  late Locale language;
  ThemeData changeTheme = themeDataEnglish;

  goToSignUp() {
    Get.offNamed(AppRoutes.signup);
  }

  Services services = Get.find();

  changeLang(String langCode) {
    //! change language
    Locale locale = Locale(langCode);
    services.sharedPref.setString("lang", langCode);
    //! change theme
    changeTheme = langCode == "ar" ? themeDataArabic : themeDataEnglish;
    Get.changeTheme(changeTheme);
    Get.updateLocale(locale);
  }

  //! Get lang from Device

  @override
  void onInit() {
    String? mainLang = services.sharedPref.getString("lang");

    //! Check if is set main language for device

    if (mainLang == "ar") {
      language = const Locale("ar");
      changeTheme = themeDataArabic;
    } else if (mainLang == "en") {
      language = const Locale("en");
      changeTheme = themeDataEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      changeTheme = themeDataEnglish;
    }

    super.onInit();
  }
}
