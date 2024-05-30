import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../favorite/presentation/views/favorite_view.dart';
import '../../home page/presentation/views/home_page_view.dart';
import '../../orders/presintaion/views/orders_layout_view.dart';
import '../../profile/controllers/edit_profile_controller.dart';
import '../../profile/data/datasorce/remote/profile_data.dart';
import '../../profile/data/models/users_model.dart';
import '../../profile/presentation/views/profile_view.dart';

import 'package:express_corner/core/services/services.dart';

import '../../../../core/class/statusRequest.dart';
import '../../../../core/functions/handlingdata.dart';

abstract class HomeController extends GetxController {
  changePage(int newIndex);
  getUserData();
}

class HomeControllerImp extends HomeController {
  StatusRequest? statusRequest = StatusRequest.none;
  List<UsersModel> usersData = [];
  UsersModel? userModel;
  MyServices myServices = Get.find();

  ProfileData profileData = ProfileData(Get.find());

  late String? username;
  late String? image;
  late String? govName;
  late String? cityName;

  int currentIndex = 0;

  List<Widget> body = const [
    HomePageView(),
    OrdersView(),
    FavoriteView(),
    ProfileView(),
  ];

  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      label: "الرئيسية",
      icon: Icon(Icons.home),
    ),
    BottomNavigationBarItem(
      label: "الطلبات",
      icon: Icon(Icons.check_outlined),
    ),
    BottomNavigationBarItem(
      label: "المفضلة",
      icon: Icon(Icons.favorite),
    ),
    BottomNavigationBarItem(
      label: "حسابى",
      icon: Icon(
        Icons.person,
      ),
    ),
  ];

  @override
  getUserData() async {
    usersData.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await profileData.viewData(
        usersid: myServices.sharedPreferences.getString("id").toString());
    debugPrint('==================== Profile Edit View Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        usersData.addAll(datalist.map((e) => UsersModel.fromJson(e)));
        if (usersData.isNotEmpty) {
          userModel = usersData.first;
          username = userModel!.usersName;
          // image = "${AppLink.imageUser}/${userModel!.usersImage}";
          image = userModel!.usersImage;
          govName = userModel!.usersGov;
          cityName = userModel!.usersCity;
          myServices.sharedPreferences.setString("userimage", image.toString());
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  changePage(int newIndex) {
    currentIndex = newIndex;
    update();
  }

  @override
  void onInit() async {
    Get.delete<EditProfileControllerImp>();
    getUserData();

    super.onInit();
  }
}
