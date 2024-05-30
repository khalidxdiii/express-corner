import 'package:get/get.dart';

class DelivaryQnrController extends GetxController {
  bool selected = false;

  isActive() {
    selected = !selected;
    update();
  }
}
