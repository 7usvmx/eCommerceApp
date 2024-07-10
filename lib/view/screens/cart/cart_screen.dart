import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controller/cart/cart_controller.dart';
import 'package:shop/core/classes/handling_data_view.dart';
import 'package:shop/core/classes/request_status.dart';
import 'package:shop/core/functions/translate_data_from_database.dart';
import 'package:shop/view/widgets/cart/cart_floating_bottom_button.dart';
import 'package:shop/view/widgets/cart/product_card_for_cart.dart';

class CartScreen extends GetView<CartControllerImp> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return Scaffold(
      bottomNavigationBar: GetBuilder<CartControllerImp>(builder: (controller) {
        return controller.statusRequest != StatusRequest.success
            ? const SizedBox()
            : CartFloatingBottomButton(
                onPressed: () {},
                allProductPrice: '00',
                amount: controller.summary.first.totalAmount!,
              );
      }),
      appBar: AppBar(
          title:
              Text("السلة", style: Theme.of(context).textTheme.headlineLarge),
          centerTitle: true,
          forceMaterialTransparency: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
          )),
      body: SafeArea(
        child: GetBuilder<CartControllerImp>(
          builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Column(
                children: [
                  //! Products in the cart
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.cartDataList.length,
                      itemBuilder: (context, index) {
                        return ProductCardForCart(
                          title: translate(
                              controller.services,
                              controller.cartDataList[index].arProductName,
                              controller.cartDataList[index].enProductName),
                          price:
                              "${controller.cartDataList[index].productPrice}",
                          image:
                              '${controller.cartDataList[index].productImage}',
                          quantity: controller.cartDataList[index].quantity
                              .toString(),
                          onAdd: () async {
                            await controller.addMore(
                                controller.cartDataList[index].productID);
                            controller.refreshPage();
                          },
                          onRemove: () async {
                            await controller.deleteMore(
                                controller.cartDataList[index].productID);
                            controller.refreshPage();
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
