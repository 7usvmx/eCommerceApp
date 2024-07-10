import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controller/cart/cart_controller.dart';
import 'package:shop/core/classes/request_status.dart';
import 'package:shop/core/constants/app_routes.dart';
import 'package:shop/data/model/products_model.dart';

abstract class ProductDetailsController extends GetxController {
  initialData();
  addMore();
  deleteMore();
  amount(double price, String add);
  selectColor(int index);
  goToCart();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  CartControllerImp cartController = Get.put(CartControllerImp());

  late ProductsModel productsModel;
  late StatusRequest statusRequest;
  int productCount = 0;
  List colors = [
    {
      "color": Colors.green,
      "isActive": false,
    },
    {
      "color": Colors.yellow,
      "isActive": false,
    },
    {
      "color": Colors.red,
      "isActive": false,
    }
  ];

  @override
  selectColor(index) {
    colors[index]["isActive"] = !colors[index]["isActive"];
    update();
  }

  @override
  initialData() async {
    statusRequest = StatusRequest.loading;
    update();
    productsModel = Get.arguments['productsModel'];
    update();
    productCount =
        await cartController.quantityCounter(productsModel.productID!);
    statusRequest = StatusRequest.success;

    update();
  }

  @override
  addMore() {
    if (productCount >= 0) {
      productCount = productCount + 1;
      cartController.addToCart(
        productsModel.productID!,
      );
      update();
    }
  }

  @override
  deleteMore() {
    if (productCount > 0) {
      productCount = productCount - 1;
      cartController.delFromCart(
        productsModel.productID!,
      );
      update();
    }
  }

  @override
  amount(price, add) {}

  @override
  void onInit() {
    statusRequest = StatusRequest.none;
    initialData();
    super.onInit();
  }

  @override
  goToCart() {
    Get.toNamed(AppRoutes.cart);
  }
}
