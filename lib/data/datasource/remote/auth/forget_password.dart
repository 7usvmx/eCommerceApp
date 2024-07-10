import 'package:shop/core/classes/crud.dart';
import 'package:shop/core/constants/urls/api_urls.dart';

class ForgetPassword {
  Crud crud;
  ForgetPassword(this.crud);

  postData(
    String email,
  ) async {
    var response = await crud.postData(ApiUrls.forgetPassword, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
