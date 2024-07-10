import 'package:shop/core/classes/crud.dart';
import 'package:shop/core/constants/urls/api_urls.dart';

class CheckResetPasswordVerifyCode {
  Crud crud;
  CheckResetPasswordVerifyCode(this.crud);

  postData(
    String email,
    String code,
  ) async {
    var response = await crud.postData(ApiUrls.checkVerifyCode, {
      "email": email,
      "confirmationCode": code,
    });
    return response.fold((l) => l, (r) => r);
  }
}
