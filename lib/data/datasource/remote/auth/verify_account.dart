import 'package:shop/core/classes/crud.dart';
import 'package:shop/core/constants/urls/api_urls.dart';

class VerifyAccount {
  Crud crud;
  VerifyAccount(this.crud);

  postData(
    String email,
    String confirmationCode,
  ) async {
    var response = await crud.postData(ApiUrls.verifyAccount, {
      "email": email,
      "confirmationCode": confirmationCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
