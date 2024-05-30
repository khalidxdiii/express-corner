import 'package:express_corner/Features/auth/presentation/widgets/logoauth.dart';
import 'package:express_corner/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import '../../../../../core/class/statusRequest.dart';
import '../../../home page/controllers/home_page_controller.dart';
import '../../controller/favorite_controller.dart';
import '../widgets/favorite_listview.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.put(HomePageController());
    // if (controller.placesDetails.isEmpty) {
    //   // controller.favStatusRequest = StatusRequest.emptyFavorite;
    //   // controller.update();
    // } else {
    //   // controller.favStatusRequest = StatusRequest.success;
    //   // controller.update();
    // }
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            Get.find<FavoriteController>().refreshScreen();
            return Future.value();
          },
          child: ListView(
            children: [
              const LogoAuth(isText: true, text: "المفضلة", isBack: false),
              GetBuilder<HomePageController>(
                builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //   "الصيدليات",
                        //   style: TextStyle(
                        //     fontSize: 16,
                        //     color: Colors.black,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        SizedBox(height: 5),
                        FavoriteListView(),
                      ],
                    ),
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
