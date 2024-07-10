import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controller/home/main_home_controller.dart';
import 'package:shop/core/constants/colors.dart';

class CustomButtonAppBar extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onPressed;
  final bool? isActive;

  const CustomButtonAppBar({
    super.key,
    required this.controller,
    required this.title,
    required this.icon,
    required this.onPressed,
    required this.isActive,
  });

  final MainHomeControllerImp controller;

  @override
  Widget build(BuildContext context) {
    Get.put(MainHomeControllerImp());

    return GetBuilder<MainHomeControllerImp>(
      builder: (c) {
        return MaterialButton(
          onPressed: () {
            onPressed();
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isActive == true ? AppColors.mainColor : Colors.black45,
              ),
              Text(
                title,
                style: TextStyle(
                  color:
                      isActive == true ? AppColors.mainColor : Colors.black45,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
