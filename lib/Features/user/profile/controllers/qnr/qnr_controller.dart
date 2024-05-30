import 'package:get/get.dart';

class QnrController extends GetxController {
  bool selected = false;

  isActive() {
    selected = !selected;
    update();
  }
}
