import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/classes/request_status.dart';
import 'package:shop/core/constants/app_routes.dart';
import 'package:shop/core/functions/data_handler.dart';
import 'package:shop/core/services/services.dart';
import 'package:shop/data/datasource/remote/home/home_data.dart';
import 'package:shop/data/model/products_model.dart';

abstract class HomeController extends GetxController {
  getData();
  search();
  goToProductsPage(List categories, int selectedCat);
  goToProductDetails(ProductsModel productsModel);
  checkSearch(String value);
}

class HomeControllerImp extends HomeController {
  //! text editing controllers
  late TextEditingController searchText;

  //! Data lists
  List categories = [];
  List products = [];
  List<ProductsModel> productsFromSearch = [];
  bool isSearch = false;
  StatusRequest statusRequest = StatusRequest.none;

  Services services = Get.find();

  HomeData homeData = HomeData(Get.find());

  @override
  checkSearch(value) {
    if (value == "") {
      isSearch = false;
      searchText.clear();
      statusRequest = StatusRequest.none;
    } else {
      isSearch = true;
    }
    update();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.postData();
    statusRequest = handlingData(response);
    update();
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        //! Add all categories to list
        categories.addAll(response['cat']);
        products.addAll(response['products']);
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    }
  }

//! search for product

  @override
  search() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.search(searchText.text);
    statusRequest = handlingData(response);
    update();
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        //! Add all categories to list
        productsFromSearch.clear();
        List responded = response['data'];
        productsFromSearch.addAll(
          responded.map(
            (e) => ProductsModel.fromJson(e),
          ),
        );
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    }
  }

  @override
  goToProductsPage(categories, selectedCat) {
    Get.toNamed(AppRoutes.products, arguments: {
      "categories": categories,
      "selectedCat": selectedCat,
    });
  }

  @override
  goToProductDetails(productsModel) {
    Get.toNamed(AppRoutes.productDetails, arguments: {
      "productsModel": productsModel,
    });
  }

  @override
  void dispose() {
    searchText.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    getData();
    searchText = TextEditingController();
    super.onInit();
  }
}
