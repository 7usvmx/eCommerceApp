import 'package:shop/core/classes/crud.dart';
import 'package:shop/core/constants/urls/api_urls.dart';

class Signin {
  Crud crud;
  Signin(this.crud);

  postData(
    String email,
    String password,
  ) async {
    var response = await crud.postData(ApiUrls.signinUrl, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
