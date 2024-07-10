import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controller/products/product_details_controller.dart';
import 'package:shop/core/constants/colors.dart';

class ProductDetailsHead extends StatelessWidget {
  const ProductDetailsHead({
    super.key,
    required this.controller,
  });

  final ProductDetailsControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.mainColor,
          ),
          height: 200,
        ),
        Positioned(
          top: 50,
          right: Get.width / 4,
          left: Get.width / 4,
          child: Hero(
            tag: "${controller.productsModel.productID}",
            child: CachedNetworkImage(
              imageUrl: "${controller.productsModel.productImage}",
              height: 250,
              fit: BoxFit.fill,
            ),
          ),
        )
      ],
    );
  }
}
