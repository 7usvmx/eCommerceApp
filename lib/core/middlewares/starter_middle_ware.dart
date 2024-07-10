import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/services/services.dart';

import '../constants/app_routes.dart';

class StarterMiddleWare extends GetMiddleware {
  Services service = Get.find();

  @override
  int? get priority => 3;

  @override
  RouteSettings? redirect(String? route) {
    if (service.sharedPref.getString("lang") != null) {
      return const RouteSettings(name: AppRoutes.signup);
    }
    return null;
  }
}
