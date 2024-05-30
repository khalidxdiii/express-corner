import 'package:get/get.dart';

import '../services/services.dart';

translateDataBase(columnen, columnar) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return columnar;
  } else {
    return columnen;
  }
}
