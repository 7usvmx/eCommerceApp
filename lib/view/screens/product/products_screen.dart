import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controller/favorites/favorite_controller.dart';
import 'package:shop/controller/products/products_controller.dart';
import 'package:shop/core/classes/handling_data_view.dart';

import 'package:shop/data/model/products_model.dart';
import 'package:shop/view/widgets/products/product_card.dart';
import 'package:shop/view/widgets/products/products_categories_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductsControllerImp());
    FavoriteControllerImp favController = Get.put(FavoriteControllerImp());

    return Scaffold(
      body: GetBuilder<ProductsControllerImp>(
        builder: (controller) {
          return SafeArea(
            child: RefreshIndicator(
              onRefresh: () async {
                controller.products.clear();
                await controller.getData();
              },
              child: Column(
                children: [
                  // SearchAndNotifications(
                  //   onChanged: (val) {},
                  //   searchText: ,
                  // ),
                  const SizedBox(height: 10),
                  const ProductsCategoriesWidget(),
                  HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: GridView.builder(
                          itemCount: controller.products.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.6, //2 / 2.5,
                            mainAxisSpacing: 20,
                          ),
                          itemBuilder: (context, index) {
                            favController.isFavorite[controller.products[index]
                                    ['productID']] =
                                controller.products[index]['favorite'];

                            return ProductCard(
                              productsModel: ProductsModel.fromJson(
                                  controller.products[index]),
                              controller: controller,
                              index: index,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
