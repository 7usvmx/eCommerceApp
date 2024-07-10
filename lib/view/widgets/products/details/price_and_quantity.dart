import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shop/controller/products/product_details_controller.dart';
import 'package:shop/core/constants/colors.dart';

class PriceAndQuantity extends StatelessWidget {
  final Function onAdd;
  final Function onRemove;
  const PriceAndQuantity({
    super.key,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsControllerImp>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    onAdd();
                  },
                  icon: const Icon(
                    Icons.add,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${controller.productCount}",
                    style: TextStyle(
                      height: 0.6,
                      fontSize: 20,
                      color: AppColors.mainColorDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    onRemove();
                  },
                  icon: const Icon(Icons.remove),
                ),
              ],
            ),
            Text(
              "\$${controller.productsModel.productPrice}",
              style: TextStyle(
                fontSize: 20,
                color: AppColors.mainColorDark,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );
      },
    );
  }
}
