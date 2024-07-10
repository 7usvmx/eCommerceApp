import 'package:shop/core/classes/crud.dart';
import 'package:shop/core/constants/urls/api_urls.dart';

class Signup {
  Crud crud;
  Signup(this.crud);

  postData(
    String fullName,
    String userName,
    String email,
    String password,
    String phone,
  ) async {
    var response = await crud.postData(ApiUrls.signupUrl, {
      "fullname": fullName,
      "username": userName,
      "email": email,
      "password": password,
      "phone": phone,
      "profileImage": "image",
    });
    return response.fold((l) => l, (r) => r);
  }
}
