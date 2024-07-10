import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controller/cart/cart_controller.dart';
import 'package:shop/controller/products/product_details_controller.dart';
import 'package:shop/core/classes/handling_data_view.dart';
import 'package:shop/core/classes/request_status.dart';
import 'package:shop/core/constants/colors.dart';
import 'package:shop/core/functions/translate_data_from_database.dart';
import 'package:shop/core/services/services.dart';
import 'package:shop/view/widgets/products/details/color_chose.dart';
import 'package:shop/view/widgets/products/details/price_and_quantity.dart';
import 'package:shop/view/widgets/products/details/product_details_head.dart';

class ProductDetailsScreen extends GetView<ProductDetailsControllerImp> {
  const ProductDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsControllerImp());
    Services services = Get.find();
    return Scaffold(
      bottomNavigationBar: GetBuilder<ProductDetailsControllerImp>(
        builder: (controller) {
          return controller.statusRequest == StatusRequest.loading
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    height: Get.height / 12,
                    color: AppColors.mainColor,
                    onPressed: () async {
                      controller.cartController.isLoading = true;
                      controller.cartController.update();
                      await controller.cartController.addToCart(
                        controller.productsModel.productID!,
                      );
                      controller.cartController.isLoading = false;
                      controller.cartController.update();
                      controller.cartController.refreshPage();
                      controller.goToCart();
                    },
                    child: GetBuilder<CartControllerImp>(
                      builder: (c) {
                        return c.isLoading
                            ? CircularProgressIndicator(
                                color: AppColors.whiteColor)
                            : Text(
                                "addToCart".tr,
                                style: TextStyle(
                                  color: TextColors.whiteColor,
                                  fontSize: 20,
                                ),
                              );
                      },
                    ),
                  ),
                );
        },
      ),
      body: SafeArea(
        child: GetBuilder<ProductDetailsControllerImp>(
          builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  ProductDetailsHead(controller: controller),
                  const SizedBox(height: 120),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          translate(
                            services,
                            controller.productsModel.arProductName,
                            controller.productsModel.enProductName,
                          ),
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                color: AppColors.mainColorDark,
                              ),
                        ),
                        const SizedBox(height: 20),
                        PriceAndQuantity(
                          onAdd: () {
                            controller.addMore();
                          },
                          onRemove: () {
                            controller.deleteMore();
                          },
                        ),
                        const SizedBox(height: 20),
                        Text(
                          translate(
                            services,
                            controller.productsModel.arProductDesc,
                            controller.productsModel.enProductDesc,
                          ),
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: AppColors.mainColorDark,
                                fontSize: 20,
                              ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "colors".tr,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                color: AppColors.mainColorDark,
                              ),
                        ),
                        const SizedBox(height: 20),
                        ProductColorChose(services: services),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
