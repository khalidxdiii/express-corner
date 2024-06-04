import 'package:get/get.dart';

import 'Features/auth/controller/forgetpassword/forgetpassword_controller.dart';
import 'Features/auth/controller/signup_controller.dart';
import 'Features/delivary/delivary_Layout/presentation/controllers/delivary_home_layout_controller.dart';
import 'Features/delivary/delivary_orders/controllers/delivary_orders_controller.dart';
import 'Features/delivary/delivary_profile/controllers/delivary_profile_controller.dart';
import 'Features/user/favorite/controller/favorite_controller.dart';
import 'Features/user/home page/controllers/home_page_controller.dart';
import 'core/class/crud.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpCotrollerImp(), fenix: true);
    Get.lazyPut(() => ForgetPasswordCotrollerImp(), fenix: true);
    Get.lazyPut(() => FavoriteController(), fenix: true);
    Get.lazyPut(() => HomePageController(), fenix: true);
    Get.lazyPut(() => DelivaryHomeLayoutControllerImp(), fenix: true);
    Get.lazyPut(() => DelivaryProfileControllerImp(), fenix: true);
    Get.lazyPut(() => DelivaryOrdersControllerImp());

    Get.put(Crud());
    Get.put(CrudMix());
  }
}
