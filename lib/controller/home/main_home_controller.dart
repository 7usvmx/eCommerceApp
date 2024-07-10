import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/app_routes.dart';
import 'package:shop/view/screens/favorites/favorites_screen.dart';
import 'package:shop/view/screens/home/home_screen.dart';
import 'package:shop/view/screens/settings/settings_screen.dart';

abstract class MainHomeController extends GetxController {
  changePage(int pageIndex);
  goToCart();
}

class MainHomeControllerImp extends MainHomeController {
  int changedIndexPage = 0;

  List<Widget> pages = [
    const HomeScreen(),
    const Center(child: Text("بحث")),
    const FavoritesScreen(),
    const SettingsScreen(),
  ];

  @override
  changePage(int pageIndex) {
    changedIndexPage = pageIndex;
    update();
  }

  @override
  goToCart() {
    Get.toNamed(AppRoutes.cart);
  }
}
