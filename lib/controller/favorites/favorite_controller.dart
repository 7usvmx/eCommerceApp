import 'package:get/get.dart';
import 'package:shop/core/classes/request_status.dart';
import 'package:shop/core/functions/data_handler.dart';
import 'package:shop/core/services/services.dart';
import 'package:shop/data/datasource/remote/products/favorite/favorite_data.dart';

abstract class FavoriteController extends GetxController {
  addToFav(String id, value);
  setFave(String id, value);
  delFromFav(String id, value);
}

class FavoriteControllerImp extends FavoriteController {
  Map isFavorite = {};
  Services services = Get.find();

  late StatusRequest statusRequest;

  FavoritesData favoritesData = FavoritesData(Get.find());

  @override
  addToFav(id, value) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoritesData.addToFav(id, value);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.snackbar(
          "تمت الإضافة",
          " تمت الإضافة للمفضلة بنجاح",
          duration: const Duration(seconds: 2),
        );
      } else {
        print(response);
      }
    } else {
      print("error");
    }
  }

  @override
  delFromFav(id, value) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoritesData.deleteFromFav(id, value);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.snackbar(
          "تم الحذف",
          " تم الحذف من المفضلة بنجاح",
          duration: const Duration(seconds: 2),
        );
        statusRequest = StatusRequest.success;
        update();
      } else {
        print(response);
      }
    } else {
      print("error");
    }
  }

  @override
  setFave(id, value) {
    isFavorite[id] = value;
    update();
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.none;
    super.onInit();
  }
}
