import 'package:shop/core/classes/crud.dart';
import 'package:shop/core/constants/urls/api_urls.dart';

class FavoritesPageData {
  Crud crud;
  FavoritesPageData(this.crud);

  postData(String userID) async {
    var response = await crud.postData(
      ApiUrls.favorites,
      {
        "userID": userID,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
