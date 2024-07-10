import 'package:shop/core/classes/crud.dart';
import 'package:shop/core/constants/urls/api_urls.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  getAddressData(String productID, String userID) async {
    var response = await crud.postData(ApiUrls.addressData, {
      'userID': userID,
    });
    return response.fold((l) => l, (r) => r);
  }
}
