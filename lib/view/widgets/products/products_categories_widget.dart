import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controller/products/products_controller.dart';
import 'package:shop/core/constants/colors.dart';
import 'package:shop/core/functions/translate_data_from_database.dart';
import 'package:shop/data/model/categories_model.dart';

class ProductsCategoriesWidget extends GetView<ProductsControllerImp> {
  const ProductsCategoriesWidget({
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
            return CategoriesProducts(
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index]),
              selectedCat: index + 1,
            );
          },
        ),
      ),
    );
  }
}

class CategoriesProducts extends StatelessWidget {
  final CategoriesModel categoriesModel;
  final int? selectedCat;

  const CategoriesProducts({
    super.key,
    required this.categoriesModel,
    required this.selectedCat,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(ProductsControllerImp());
    return Column(
      children: [
        GetBuilder<ProductsControllerImp>(
          builder: (c) => Container(
            decoration: c.selectedCat! == selectedCat!
                ? BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 3,
                        color: AppColors.mainColor.withOpacity(0.4),
                      ),
                    ),
                  )
                : null,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 6.0),
            child: InkWell(
              onTap: () async {
                c.changeSelectedCat(selectedCat!);
                c.products.clear();
                await c.getData();
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  "${translate(c.services, categoriesModel.arCatName, categoriesModel.enCatName)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
