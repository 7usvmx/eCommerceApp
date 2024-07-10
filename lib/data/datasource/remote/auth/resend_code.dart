import 'package:shop/core/classes/crud.dart';
import 'package:shop/core/constants/urls/api_urls.dart';

class ResendCode {
  Crud crud;
  ResendCode(this.crud);

  postData(
    String email,
  ) async {
    var response = await crud.postData(ApiUrls.resendVerifyCode, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
