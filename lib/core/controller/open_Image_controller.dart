import 'package:get/get.dart';

class OpenImageController extends GetxController {
  late String imageUrl;

  @override
  void onInit() {
    imageUrl = Get.arguments["imageUrl"];
    super.onInit();
  }
}
