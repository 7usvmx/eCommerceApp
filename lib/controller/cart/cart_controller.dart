import 'package:get/get.dart';
import 'package:shop/core/classes/request_status.dart';
import 'package:shop/core/functions/data_handler.dart';
import 'package:shop/core/services/services.dart';
import 'package:shop/data/datasource/remote/cart/cart_data.dart';
import 'package:shop/data/model/amount_model.dart';
import 'package:shop/data/model/cart_model.dart';

abstract class CartController extends GetxController {
  addToCart(String productID);
  delFromCart(String productID);
  quantityCounter(String productID);
  getData();
  addMore(productID);
  deleteMore(productID);
  refreshPage();
}

class CartControllerImp extends CartController {
  //! Important variables
  late String userID;
  int productCount = 0;
  bool isLoading = false;
  bool isQuantityZero = true;
  List<CartModel> cartDataList = [];
  List<AmountModel> summary = [];

  CartData cartData = CartData(Get.find());
  Services services = Get.find();
  late StatusRequest statusRequest;

  @override
  addToCart(productID) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addToCart(productID, userID);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        print(response);
      } else {
        statusRequest = StatusRequest.failure;
        update();
        print(response);
      }
    }
    update();
  }

  @override
  delFromCart(productID) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteFromCart(productID, userID);
    statusRequest = handlingData(response);
    update();
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
      } else {
        statusRequest = StatusRequest.failure;
        update();
        print(response);
      }
    }

    update();
  }

  @override
  quantityCounter(productID) async {
    var response = await cartData.quantityCounter(productID, userID);
    statusRequest = handlingData(response);
    update();
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        int counter = 0;
        counter = int.parse(response['data']['quantity']);
        return counter;
      } else {
        statusRequest = StatusRequest.failure;
        update();
        print(response);
      }
    }
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.getData(userID);
    statusRequest = handlingData(response);
    update();
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        //! Cart data
        if (response['data'][0]['status'] != 'failure') {
          List responded = response['data'];
          cartDataList.addAll(responded.map((e) => CartModel.fromJson(e)));
          // //! Amount details
          List amountDetails = response['amountData'];
          summary.addAll(amountDetails.map((e) => AmountModel.fromJson(e)));
        } else {
          statusRequest = StatusRequest.noData;
          update();
        }
      } else {
        statusRequest = StatusRequest.noData;
        update();
      }
    }
  }

  @override
  addMore(productID) {
    if (productCount >= 0) {
      productCount = productCount + 1;
      addToCart(productID);
      update();
    }
  }

  @override
  deleteMore(productID) {
    if (productCount > 0) {
      productCount = productCount - 1;
    }
    delFromCart(productID);
    update();
  }

  clearData() {
    productCount = 0;
    cartDataList.clear();
    summary.clear();
  }

  @override
  refreshPage() {
    clearData();
    getData();
  }

  @override
  void onInit() {
    userID = services.sharedPref.getString("id")!;
    statusRequest = StatusRequest.none;
    getData();
    super.onInit();
  }
}
