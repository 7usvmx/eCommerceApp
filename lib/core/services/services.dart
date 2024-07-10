import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services extends GetxService {
  //! Shared Preferences local storage services
  late SharedPreferences sharedPref;

  Future<Services> init() async {
    sharedPref = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // FirebaseMessaging.instance.getToken().then((val) {
  //   print(val);
  // });
  await Get.putAsync(() {
    return Services().init();
  });
}
