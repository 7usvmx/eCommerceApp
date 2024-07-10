import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop/controller/home/home_controller.dart';
import 'package:shop/core/constants/colors.dart';
import 'package:shop/data/model/products_model.dart';

class PhonesWidget extends StatelessWidget {
  final HomeControllerImp controller;
  final table;
  const PhonesWidget({
    super.key,
    required this.controller,
    required this.table,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 250,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.products.length,
          separatorBuilder: (context, index) {
            return const SizedBox(width: 10);
          },
          itemBuilder: (context, index) {
            return ProductsWidgetInner(
              productsModel: ProductsModel.fromJson(
                controller.products[index],
              ),
              controller: controller,
            );
          },
        ),
      ),
    );
  }
}

class ProductsWidgetInner extends StatelessWidget {
  final ProductsModel productsModel;
  final HomeControllerImp controller;
  const ProductsWidgetInner({
    super.key,
    required this.productsModel,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    int id;
    id = int.parse(productsModel.productID!);
    return GestureDetector(
      onTap: () {
        controller.goToProductDetails(productsModel);
        print(id);
      },
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.grey600.withOpacity(0.3),
              ),
              height: 260,
              width: 260,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: "${productsModel.productImage}",
                  height: 230,
                  width: 230,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
