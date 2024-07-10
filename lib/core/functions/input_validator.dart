import 'package:get/get.dart';
import 'package:shop/core/constants/messages/alerting_messages.dart';

class InputValidator extends GetxController {
  //! Check if field is empty or not

  validator(String val, int min, int max, String type) {
    if (type == "username") {
      if (!GetUtils.isUsername(val)) {
        return "isText".tr;
      }
    }
    if (type == "email") {
      if (!GetUtils.isEmail(val)) {
        return "isEmail".tr;
      }
    }
    if (type == "phone") {
      if (!GetUtils.isPhoneNumber(val)) {
        return "isPhone".tr;
      }
    }

    if (val.isEmpty) {
      return ErrorMessages.emptyInputErrorMessage;
    }
    if (val.length > max) {
      return "${ErrorMessages.maxInputErrorMessage} $max ${"character".tr}";
    }
    if (val.length < min) {
      return "${ErrorMessages.minInputErrorMessage} $min ${"character".tr}";
    }
  }
}
