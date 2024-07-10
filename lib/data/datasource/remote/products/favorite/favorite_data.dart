import 'package:shop/core/classes/crud.dart';
import 'package:shop/core/constants/urls/api_urls.dart';

class FavoritesData {
  Crud crud;
  FavoritesData(this.crud);

  addToFav(String productID, String userID) async {
    var response = await crud.postData(
      ApiUrls.addToFavorites,
      {
        "userID": userID,
        "productID": productID,
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  deleteFromFav(String productID, String userID) async {
    var response = await crud.postData(
      ApiUrls.deleteFromFavorites,
      {
        "userID": userID,
        "productID": productID,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
