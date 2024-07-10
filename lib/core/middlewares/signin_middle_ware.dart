import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/services/services.dart';

import '../constants/app_routes.dart';

class SigninMiddleWare extends GetMiddleware {
  Services service = Get.find();

  @override
  int? get priority => 2;

  @override
  RouteSettings? redirect(String? route) {
    if (service.sharedPref.getBool("keepSigned") == true) {
      return const RouteSettings(name: AppRoutes.home);
    }
    return null;
  }
}
