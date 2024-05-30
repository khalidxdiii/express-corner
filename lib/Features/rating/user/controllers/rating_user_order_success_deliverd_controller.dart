import 'package:get/get.dart';

class RatingUserOrderSuccessDeliverdController extends GetxController {
  late String orderId;

  @override
  void onInit() {
    orderId = Get.arguments["orderId"];
    super.onInit();
  }
}
