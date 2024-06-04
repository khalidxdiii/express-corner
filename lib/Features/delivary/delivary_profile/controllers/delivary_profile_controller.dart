import 'package:get/get.dart';

import '../../delivary_Layout/presentation/controllers/delivary_home_layout_controller.dart';
import '../data/datasorce/remote/profile_data.dart';
// import '../data/models/users_model.dart';

abstract class ProfileController extends GetxController {}

class DelivaryProfileControllerImp extends DelivaryHomeLayoutControllerImp {
  // StatusRequest? statusRequest = StatusRequest.none;
  // List<UsersModel> usersData = [];
  // UsersModel? userModel;
  // MyServices myServices = Get.find();

  DelivaryProfileData profileData = DelivaryProfileData(Get.find());

  // String username = "";
  // String image = "";
  // String govName = "";
  // String cityName = "";

  @override
  void onInit() {
    // username = delivaryInfoData.first.usersName.toString();
    // image = delivaryInfoData.first.usersImage.toString();
    // govName = delivaryInfoData.first.usersGov.toString();
    // cityName = delivaryInfoData.first.usersCity.toString();

    super.onInit();
  }
}
