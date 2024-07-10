import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controller/cart/cart_controller.dart';
import 'package:shop/core/constants/colors.dart';

class ProductCardForCart extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final String quantity;
  final Function onRemove;
  final Function onAdd;

  const ProductCardForCart({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.quantity,
    required this.onRemove,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 12.0,
        left: 12.0,
        right: 12.0,
      ),
      child: Card(
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: CachedNetworkImage(
                imageUrl: image,
                height: 100,
              ),
            ),
            //! title
            Expanded(
              flex: 4,
              child: ListTile(
                title: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
                subtitle: Text(
                  price,
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            GetBuilder<CartControllerImp>(builder: (controller) {
              return Expanded(
                flex: 1,
                child: Column(
                  children: [
                    SizedBox(
                      height: 45,
                      child: IconButton(
                        onPressed: () {
                          onAdd();
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ),
                    SizedBox(height: 30, child: Text(quantity)),
                    SizedBox(
                      height: 30,
                      child: IconButton(
                        onPressed: () {
                          onRemove();
                        },
                        icon: const Icon(Icons.remove),
                      ),
                    ),
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
