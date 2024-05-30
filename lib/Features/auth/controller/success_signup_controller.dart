import 'package:get/get.dart';

import '../../../../core/constant/approutes.dart';

abstract class SuccessSignUpCotroller extends GetxController {
  goToLogin();
}

class SuccessSignUpCotrollerImp extends SuccessSignUpCotroller {
  @override
  goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
