import 'package:get/get.dart';
import 'package:shop/core/classes/request_status.dart';
import 'package:shop/core/constants/app_routes.dart';
import 'package:shop/core/functions/data_handler.dart';
import 'package:shop/core/services/services.dart';
import 'package:shop/data/datasource/remote/products/products_data.dart';
import 'package:shop/data/model/products_model.dart';

abstract class ProductsController extends GetxController {
  initialData();
  changeSelectedCat(int newCat);
  goToProductDetails(ProductsModel productsModel);
  getData();
}

class ProductsControllerImp extends ProductsController {
  List categories = [];
  List products = [];
  int? selectedCat;
  String? userID;
  bool isInFav = false;

  StatusRequest statusRequest = StatusRequest.none;

  Services services = Get.find();

  ProductsData productsData = ProductsData(Get.find());

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await productsData.postData(selectedCat!.toString(), userID!);
    statusRequest = handlingData(response);
    update();
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        //! Add all categories to list
        products.addAll(response['data']);
        // print(favorites);
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    }
  }

  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    selectedCat = selectedCat! + 1;
    userID = services.sharedPref.getString("id");
    getData();
  }

  @override
  changeSelectedCat(newCat) {
    selectedCat = newCat;
    update();
  }

  @override
  goToProductDetails(productsModel) {
    Get.toNamed(AppRoutes.productDetails, arguments: {
      "productsModel": productsModel,
    });
  }

 
  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
