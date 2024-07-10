import 'package:get/get.dart';
import 'package:shop/core/functions/check_internet_connection.dart';
import 'package:shop/core/services/services.dart';

class InternetChecker extends GetMiddleware {
  Services service = Get.find();

  @override
  int? get priority => 1;

  internetChecker() async {
    bool result = await checkInternetConnection();
    if (result) {
      print("connected");
    } else {
      print("disconnected");
    }
  }
}
