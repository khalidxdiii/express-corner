import 'package:get/get.dart';

import '../../../../../core/constant/approutes.dart';

abstract class SuccessResetPasswordCotroller extends GetxController {
  goToLogin();
}

class SuccessResetPasswordCotrollerImp extends SuccessResetPasswordCotroller {
  @override
  goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
