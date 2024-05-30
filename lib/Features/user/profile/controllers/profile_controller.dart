import 'package:express_corner/core/services/services.dart';
import 'package:get/get.dart';

import '../../../../core/class/statusRequest.dart';

import '../data/datasorce/remote/profile_data.dart';
import '../data/models/users_model.dart';

abstract class ProfileController extends GetxController {}

class ProfileControllerImp extends ProfileController {
  StatusRequest? statusRequest = StatusRequest.none;
  List<UsersModel> usersData = [];
  UsersModel? userModel;
  MyServices myServices = Get.find();

  ProfileData profileData = ProfileData(Get.find());

  late String? username;
  late String? image;
  late String? govName;
  late String? cityName;

  @override
  void onInit() async {
    username = myServices.sharedPreferences.getString("username");
    image = myServices.sharedPreferences.getString("userimage");
    govName = myServices.sharedPreferences.getString("gov");
    cityName = myServices.sharedPreferences.getString("city");

    super.onInit();
  }
}
