import 'package:express_corner/core/constant/approutes.dart';
import 'package:get/get.dart';

abstract class EmptyStatusController extends GetxController {
  goToHome();
  goToAddAddress();
}

class EmptyStatusControllerImp extends EmptyStatusController {
  @override
  goToHome() {}

  @override
  goToAddAddress() {
    Get.toNamed(AppRoute.addressAddMap);
  }
}
