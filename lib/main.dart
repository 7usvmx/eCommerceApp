import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/localization/change_lang_controller.dart';
import 'package:shop/core/localization/translation.dart';
import 'package:shop/core/services/services.dart';
import 'package:shop/routes.dart';
import 'core/bindings/initial_bindings.dart';
import 'core/constants/app_routes.dart';
import 'core/functions/check_internet_connection.dart';

bool internet = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();

  internet = await internetChecker();

  runApp(const MyApp());
}

internetChecker() async {
  bool result = await checkInternetConnection();
  if (result) {
    return true;
  } else {
    return false;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ChangeLangController controller = Get.put(ChangeLangController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop',
      theme: controller.changeTheme,
      locale: controller.language,
      translations: AppTranslation(),
      initialBinding: InitialBindings(),
      initialRoute:
          internet ? AppRoutes.languages : AppRoutes.noInternetConnection,
      // AppRoutes.cart,
      getPages: routes,
    );
  }
}
