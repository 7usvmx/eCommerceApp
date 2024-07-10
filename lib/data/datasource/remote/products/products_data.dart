import 'package:shop/core/classes/crud.dart';
import 'package:shop/core/constants/urls/api_urls.dart';

class ProductsData {
  Crud crud;
  ProductsData(this.crud);

  postData(String catID, String userID) async {
    var response = await crud.postData(
      ApiUrls.products,
      {
        "catID": catID,
        "userID": userID,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
