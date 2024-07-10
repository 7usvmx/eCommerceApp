import 'package:shop/core/classes/crud.dart';
import 'package:shop/core/constants/urls/api_urls.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  addToCart(String productID, String userID) async {
    var response = await crud.postData(ApiUrls.addToCart, {
      'productID': productID,
      'userID': userID,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteFromCart(String productID, String userID) async {
    var response = await crud.postData(ApiUrls.deleteFromCart, {
      'productID': productID,
      'userID': userID,
    });
    return response.fold((l) => l, (r) => r);
  }

  quantityCounter(String productID, String userID) async {
    var response = await crud.postData(ApiUrls.quantityCounter, {
      'productID': productID,
      'userID': userID,
    });
    return response.fold((l) => l, (r) => r);
  }

  getData(String userID) async {
    var response = await crud.postData(ApiUrls.cartView, {
      'userID': userID,
    });
    return response.fold((l) => l, (r) => r);
  }
}
