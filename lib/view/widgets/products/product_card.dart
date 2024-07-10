import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controller/favorites/favorite_controller.dart';
import 'package:shop/controller/products/products_controller.dart';
import 'package:shop/core/constants/colors.dart';
import 'package:shop/core/constants/image_asset.dart';
import 'package:shop/core/functions/translate_data_from_database.dart';
import 'package:shop/data/model/products_model.dart';

class ProductCard extends StatelessWidget {
  final ProductsModel productsModel;
  final ProductsControllerImp controller;
  final int index;
  const ProductCard({
    super.key,
    required this.productsModel,
    required this.controller,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProductDetails(productsModel);
      },
      child: Card(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Hero(
                          tag: "${productsModel.productID}",
                          child: CachedNetworkImage(
                            imageUrl: "${productsModel.productImage}",
                            height: 100,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          "${translate(controller.services, productsModel.arProductName, productsModel.enProductName)}",
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 17,
                          ),
                          maxLines: 1,
                        ),
                        Text(
                          "\$${productsModel.discount}",
                          style: TextStyle(
                            color: AppColors.mainColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GetBuilder<FavoriteControllerImp>(
                    builder: (controller) => IconButton(
                      onPressed: () async {
                        if (controller.isFavorite[productsModel.productID] ==
                            "0") {
                          controller.setFave(
                              productsModel.productID.toString(), "1");
                          await controller.addToFav(
                            productsModel.productID!,
                            controller.services.sharedPref.getString("id")!,
                          );
                        } else {
                          controller.setFave(
                              productsModel.productID.toString(), "0");
                          await controller.delFromFav(
                            productsModel.productID!,
                            controller.services.sharedPref.getString("id")!,
                          );
                        }
                      },
                      icon: Icon(
                        controller.isFavorite[productsModel.productID] == "0"
                            ? Icons.favorite_border
                            : Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (productsModel.productDiscount != "0")
              Positioned(
                left: 0,
                child: Image.asset(ImageAsset.sale, width: 60),
              )
          ],
        ),
      ),
    );
  }
}
