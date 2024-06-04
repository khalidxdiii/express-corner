import 'package:get/get.dart';

// import '../../../../core/class/statusRequest.dart';
// import '../../../../core/services/services.dart';
import '../../delivary_Layout/presentation/controllers/delivary_home_layout_controller.dart';
import '../data/datasource/delivary_home_page_data.dart';

abstract class DelivaryHomePageController
    extends DelivaryHomeLayoutControllerImp {}

class DelivaryHomePageControllerImp extends DelivaryHomePageController {
  // MyServices myServices = Get.find();
  // StatusRequest statusRequest = StatusRequest.none;
  DelivaryHomePageData homeData = DelivaryHomePageData(Get.find());
}
