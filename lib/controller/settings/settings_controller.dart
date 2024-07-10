import 'package:get/get.dart';
import 'package:shop/core/constants/app_routes.dart';
import 'package:shop/core/localization/change_lang_controller.dart';
import 'package:shop/core/services/services.dart';

abstract class SettingsController extends GetxController {
  logout();
  changeLanguage();
}

class SettingsControllerImp extends SettingsController {
  bool isArabic = true;

  Services services = Get.find();

  @override
  changeLanguage() {
    ChangeLangController controller = Get.put(ChangeLangController());
    if (isArabic == true) {
      isArabic = false;
      controller.changeLang("en");
    } else {
      isArabic = true;
      controller.changeLang("ar");
    }
    update();
    controller.onClose();
    controller.onDelete();
  }

  @override
  logout() {
    services.sharedPref.remove("keepSigned");
    Get.offAllNamed(AppRoutes.signin);
  }
}
