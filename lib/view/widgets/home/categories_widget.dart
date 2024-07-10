import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop/controller/home/home_controller.dart';
import 'package:shop/core/constants/colors.dart';
import 'package:shop/core/constants/image_asset.dart';
import 'package:shop/core/functions/translate_data_from_database.dart';
import 'package:shop/data/model/categories_model.dart';

class CategoriesWidget extends GetView<HomeControllerImp> {
  const CategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: SizedBox(
        height: 100,
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(width: 20);
          },
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            return CategoriesHome(
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index]),
              controller: controller,
              selectedCat: index,
            );
          },
        ),
      ),
    );
  }
}

class CategoriesHome extends StatelessWidget {
  final CategoriesModel categoriesModel;
  final int? selectedCat;

  const CategoriesHome({
    super.key,
    required this.categoriesModel,
    required this.controller,
    required this.selectedCat,
  });

  final HomeControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.grey200,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(10),
          height: 60,
          width: 60,
          child: InkWell(
            onTap: () {
              controller.goToProductsPage(controller.categories, selectedCat!);
            },
            child: SvgPicture.network(
                "${ImageAsset.rootNetworkCatImagePath}${categoriesModel.catImage}"),
          ),
        ),
        Text(
          "${translate(controller.services, categoriesModel.arCatName, categoriesModel.enCatName)}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
