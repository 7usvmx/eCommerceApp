import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controller/home/home_controller.dart';
import 'package:shop/core/classes/handling_data_view.dart';
import 'package:shop/core/constants/colors.dart';
import 'package:shop/core/shared/heading_title.dart';
import 'package:shop/view/screens/search/search_screen.dart';
import 'package:shop/view/widgets/home/search_and_notifications.dart';
import 'package:shop/view/widgets/phone_widget.dart';
import 'package:shop/view/widgets/home/categories_widget.dart';
import 'package:shop/view/widgets/home/offer_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future _refresh() async {
    await Future.delayed(const Duration(seconds: 4));
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      body: GetBuilder<HomeControllerImp>(
        builder: (controller) {
          return Column(
            children: [
              SearchAndNotifications(
                onChanged: (val) {
                  controller.checkSearch(val);
                },
                searchText: controller.searchText,
                searchForProducts: () {
                  controller.isSearch ? controller.search() : null;
                },
              ),
              Expanded(
                child: HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Column(
                    children: [
                      !controller.isSearch
                          ? Expanded(
                              child: RefreshIndicator(
                                onRefresh: _refresh,
                                child: ListView(
                                  children: [
                                    const OffersWidget(
                                      title: 'العرض الكبير',
                                      subTitle: 'تخفيض 30% للهواتف',
                                    ),
                                    const CategoriesWidget(),
                                    HeadingWidget(
                                      head: "phones".tr,
                                      color:
                                          AppColors.mainColor.withOpacity(0.5),
                                      services: controller.services,
                                    ),
                                    const SizedBox(height: 10),
                                    PhonesWidget(
                                      controller: controller,
                                      table: null,
                                    ),
                                    HeadingWidget(
                                      head: "elect".tr,
                                      color: Colors.red.withOpacity(0.5),
                                      services: controller.services,
                                    ),
                                    PhonesWidget(
                                      controller: controller,
                                      table: null,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : SearchScreen(
                              searchedData: controller.productsFromSearch,
                              servicesController: controller.services,
                            ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
