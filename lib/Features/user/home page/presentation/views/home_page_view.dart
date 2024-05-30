import 'package:express_corner/core/constant/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/class/handlingdataview.dart';
import '../../../favorite/controller/favorite_controller.dart';
import '../../controllers/home_page_controller.dart';
import '../widgets/category_listview.dart';
import '../widgets/custom_home_title.dart';
import '../widgets/home_header.dart';
import '../widgets/pharmacies_listview.dart';
import '../widgets/restaurant_list_view.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());
    Get.put(FavoriteController());
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            Get.find<HomePageController>().getData();
            // Get.find<HomePageController>().favoriteController.getFavHomeData();
            Get.find<HomePageController>().getFavHomeData();

            Get.find<HomePageController>().getCurrentLocation();
            return Future.value();
          },
          child: ListView(
            children: [
              HomeHeader(
                onTap: () {
                  Get.toNamed(AppRoute.notificationsView);
                },
              ),
              GetBuilder<HomePageController>(
                builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomHomeTitle(
                        title: "الاماكن",
                        isShowAll: false,
                      ),
                      const SizedBox(height: 5),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: ListCategoriesHome(),
                      ),
                      CustomHomeTitle(
                        title: "المطاعم القريبة منك",
                        onTap: () {
                          Get.toNamed(AppRoute.pharmaciesView, arguments: {
                            "type": "restaurant",
                            "pageTitle": "المطاعم القريبة منك",
                            "searchHint": "ابحث  باسم المطعم...",
                          });
                        },
                      ),
                      const SizedBox(height: 250, child: RestaurantListView()),
                      CustomHomeTitle(
                        title: "الصيدليات القريبة منك",
                        onTap: () {
                          Get.toNamed(AppRoute.pharmaciesView, arguments: {
                            "type": "pharmacy",
                            "pageTitle": "الصيدليات القريبة منك",
                            "searchHint": "ابحث  باسم الصيدلية...",
                          });
                        },
                      ),
                      const SizedBox(height: 250, child: PharmaciesListView()),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
