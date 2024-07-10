import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controller/home/main_home_controller.dart';
import 'package:shop/core/constants/colors.dart';
import 'package:shop/view/widgets/home/custom_bottom_appbar.dart';

class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainHomeControllerImp());
    return GetBuilder<MainHomeControllerImp>(
      builder: (controller) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.mainColor,
            onPressed: () {
              controller.goToCart();
            },
            child: const Icon(
              Icons.shopping_basket_outlined,
              size: 30,
              color: Colors.white,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          bottomNavigationBar: CustomBottomAppbar(controller: controller),
          body: SafeArea(
            child: controller.pages.elementAt(controller.changedIndexPage),
          ),
        );
      },
    );
  }
}
