import 'package:get/get.dart';
import 'package:shop/core/classes/request_status.dart';
import 'package:shop/core/functions/data_handler.dart';
import 'package:shop/core/services/services.dart';
import 'package:shop/data/datasource/remote/products/favorite/favorites_page_data.dart';
import 'package:shop/data/model/my_favorites_model.dart';
import 'package:shop/data/model/products_model.dart';

abstract class FavoritesPageController extends GetxController {
  getData();
  removeFav(int index);
}

class FavoritesPageControllerImp extends FavoritesPageController {
  //!

  ProductsModel? productsModel;
  List<MyFavoritesModel> favoritesList = [];

  FavoritesPageData favoritesPageData = FavoritesPageData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  Services services = Get.find();

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();

    var response =
        await favoritesPageData.postData(services.sharedPref.getString("id")!);

    statusRequest = handlingData(response);
    update();

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List responded = response['data'];
        favoritesList
            .addAll(responded.map((e) => MyFavoritesModel.fromJson(e)));
        print(favoritesList);
      } else {
        statusRequest = StatusRequest.noData;
        update();
      }
    } else {
      statusRequest = StatusRequest.failure;
      update();
    }

    // favoritesList.add(response["data"]);
  }

  @override
  removeFav(index) {
    favoritesList.removeAt(index);
    update();
    if (favoritesList != []) {
      statusRequest = StatusRequest.noData;
      update();
    }
  }

  @override
  void onInit() async {
    // productsModel = Get.arguments['productsModel'];
    await getData();
    super.onInit();
  }
}
