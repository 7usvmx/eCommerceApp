import 'package:shop/core/classes/crud.dart';
import 'package:shop/core/constants/urls/api_urls.dart';

class SetNewPassword {
  Crud crud;
  SetNewPassword(this.crud);

  postData(
    String email,
    String password,
  ) async {
    var response = await crud.postData(ApiUrls.setNewPassword, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
