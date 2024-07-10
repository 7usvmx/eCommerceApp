import 'package:flutter/material.dart';
import 'package:shop/controller/home/main_home_controller.dart';
import 'package:shop/data/datasource/static/bottom_navigation_data.dart';
import 'package:shop/view/widgets/home/bottom_appbar.dart';

class CustomBottomAppbar extends StatelessWidget {
  final MainHomeControllerImp controller;

  const CustomBottomAppbar({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 18,
      child: Row(
        children: [
          ...List.generate(
            controller.pages.length + 1,
            (index) {
              int i = index > 2 ? index - 1 : index;
              return index == 2
                  ? const Spacer()
                  : CustomButtonAppBar(
                      controller: controller,
                      title: navigation[i].title,
                      icon: navigation[i].icon,
                      onPressed: () {
                        controller.changePage(i);
                      },
                      isActive: controller.changedIndexPage == i ? true : false,
                    );
            },
          ),
        ],
      ),
    );
  }
}
