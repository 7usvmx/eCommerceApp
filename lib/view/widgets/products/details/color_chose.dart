import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controller/products/product_details_controller.dart';
import 'package:shop/core/services/services.dart';

class ProductColorChose extends GetView<ProductDetailsControllerImp> {
  const ProductColorChose({
    super.key,
    required this.services,
  });

  final Services services;

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsControllerImp());
    return Row(
      children: [
        ...List.generate(
          controller.colors.length,
          (index) {
            return GetBuilder<ProductDetailsControllerImp>(
              builder: (controller) {
                return Container(
                  decoration: BoxDecoration(
                    color: controller.colors[index]["isActive"]
                        ? controller.colors[index]["color"]
                        : null,
                    border: Border.all(
                      width: 5,
                      color: controller.colors[index]["color"],
                    ),
                    shape: BoxShape.circle,
                  ),
                  height: 30,
                  width: 30,
                  margin: EdgeInsets.only(
                    right:
                        services.sharedPref.getString("lang") == "ar" ? 10 : 0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      controller.selectColor(index);
                    },
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
