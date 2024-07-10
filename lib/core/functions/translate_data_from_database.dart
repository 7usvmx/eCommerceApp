//1 Translating data

import 'package:shop/core/services/services.dart';

translate(Services lang, arColumn, enColumn) {
  if (lang.sharedPref.getString("lang") == "ar") {
    return arColumn;
  } else {
    return enColumn;
  }
}
