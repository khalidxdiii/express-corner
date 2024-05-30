import 'package:cached_network_image/cached_network_image.dart';
import 'package:express_corner/Features/auth/presentation/widgets/logoauth.dart';
import 'package:express_corner/core/class/handlingdataview.dart';
import 'package:express_corner/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart' as lottie;

import '../../../../../core/constant/app_icons_assets.dart';
import '../../../../../core/constant/approutes.dart';
import '../../../../../core/constant/imageasset.dart';
import '../../../../../core/shared/defult_button.dart';
import '../../../../../linkapi.dart';
import '../../../../delivary/delivary_orders/presintaion/widgets/delivary_oders_details/delivary_orders_details_items_card.dart';
import '../../controllers/oders_status_controller.dart';
import '../widgets/oders_details/orders_details_rating_card_item.dart';

class OrdersStatusView extends StatelessWidget {
  const OrdersStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersStatusControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            const LogoAuth(
              isText: true,
              text: "حالة الطلب",
            ),
            // SizedBox(height: 20),
            GetBuilder<OrdersStatusControllerImp>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      lottie.Lottie.asset(AppImageAsset.mapTracking,
                          width: 200, height: 150),
                      const MyTimeLine(),
                      const SizedBox(height: 20),
                      controller.currentStatus >= 4
                          ? controller.dataOrders.first.userIsRating == "1"
                              ? StatusDetailsRatingCardItem()
                              : CustomDefultButton(
                                  text: "تقييم",
                                  onPressed: () {
                                    controller.goToUserRattingViewScreen();
                                  },
                                )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyTimeLine extends StatelessWidget {
  const MyTimeLine({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersStatusControllerImp>(
      builder: (controller) => const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTimeLineItem(currentStatus: 0),
          MyTimeLineItem(currentStatus: 1),
          MyTimeLineItem(currentStatus: 2),
          MyTimeLineItem(currentStatus: 3),
          MyTimeLineItem(currentStatus: 4, showLine: false),
        ],
      ),
    );
  }
}

class MyTimeLineItem extends StatelessWidget {
  const MyTimeLineItem({
    super.key,
    required this.currentStatus,
    this.showLine = true,
  });

  final int currentStatus;
  final bool? showLine;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersStatusControllerImp>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              (controller.currentStatus == currentStatus)
                  ? SvgPicture.asset(AppIconsAsset.stepCrrunet)
                  : controller.currentStatus < currentStatus
                      ? SvgPicture.asset(AppIconsAsset.stepPending)
                      : SvgPicture.asset(AppIconsAsset.stepDone),
              const SizedBox(width: 10),
              Text(
                controller.statusTitle.toList()[currentStatus]["title"]
                    as String,
                style: TextStyle(
                    color: controller.currentStatus < currentStatus
                        ? AppColor.gray
                        : AppColor.primaryColor),
              ),
            ],
          ),
          showLine == true
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 14),
                    Container(
                      // width: Get.width / 3,
                      width: 2,
                      // height: MediaQuery.of(context).size.height * 0.1,
                      height: (controller.statusTitle.toList()[currentStatus]
                                      ["status"] as int ==
                                  1 &&
                              controller.currentStatus >= 1)
                          ? 90
                          : (controller.statusTitle.toList()[currentStatus]
                                          ["status"] as int ==
                                      2 &&
                                  controller.currentStatus >= 2)
                              ? controller.orderslocationNamesLeangth
                              : (controller.statusTitle.toList()[currentStatus]
                                              ["status"] as int ==
                                          3 &&
                                      controller.currentStatus >= 3)
                                  ? 220
                                  : 30,
                      color: (controller.currentStatus < currentStatus ||
                              controller.currentStatus == currentStatus)
                          ? AppColor.gray
                          : AppColor.primaryColor,
                    ),

                    // order id
                    (controller.statusTitle.toList()[currentStatus]["status"]
                                    as int ==
                                0 &&
                            controller.currentStatus >= 0)
                        ? Row(
                            children: [
                              const SizedBox(width: 10),
                              const Text(
                                "رقم الطلب : ",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                              Text(
                                controller.orderId,
                                style: const TextStyle(
                                    color: AppColor.primaryColor, fontSize: 12),
                              )
                            ],
                          )
                        : const SizedBox(),
                    // delivary info

                    (controller.statusTitle.toList()[currentStatus]["status"]
                                    as int ==
                                1 &&
                            controller.currentStatus >= 1)
                        ? const OrderStatusDelivaryCardInfo()
                        : const SizedBox(),
                    // start end process
                    (controller.statusTitle.toList()[currentStatus]["status"]
                                    as int ==
                                2 &&
                            controller.currentStatus >= 2)
                        ? const StartEndProcessWidget()
                        : const SizedBox(),
                    // map
                    (controller.statusTitle.toList()[currentStatus]["status"]
                                    as int ==
                                3 &&
                            controller.currentStatus >= 3)
                        ? const CustomLiveLocation()
                        : const SizedBox()
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class StatusDetailsRatingCardItem extends GetView<OrdersStatusControllerImp> {
  const StatusDetailsRatingCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return customContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "التقييم",
            style: TextStyle(
                color: AppColor.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "لم تقم بتقييم الطلب حتى الان",
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: () {
                  Get.toNamed(
                    AppRoute.userRatingView,
                    arguments: {
                      "orderId":
                          controller.dataOrders.first.ordersId.toString(),
                      "delivaryid": controller.dataOrders.first.ordersDelivaery
                    },
                  );
                },
                child: const Text(
                  "اضغط هنا للتقيم !!",
                  style: TextStyle(color: AppColor.primaryColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StartEndProcessWidget extends GetView<OrdersStatusControllerImp> {
  const StartEndProcessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Assume each item is 30 pixels high, plus 10 pixels padding between items
    final itemHeight = 30.0;
    final padding = 10.0;
    final itemCount = controller.orderslocationNames.length + 1;
    final totalHeight = itemCount * (itemHeight + padding);

    // Store the height in the controller
    controller.orderslocationNamesLeangth = totalHeight;

    return Container(
      width: Get.width - 60,
      margin: const EdgeInsets.only(right: 10, top: 10),
      // padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.fithColor,
      ),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  AppImageAsset.markerUser,
                  width: 25,
                  height: 25,
                  fit: BoxFit.fill,
                ),
                const SizedBox(width: 10),
                Text(
                  controller.dataOrders.first.ordersAddressUserDetails
                      .toString(),
                  style: const TextStyle(
                      fontSize: 12, color: Colors.black, height: 1.3),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.orderslocationNames.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 5),
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          AppImageAsset.markerOrders,
                          width: 25,
                          height: 25,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          controller.orderslocationNames[index],
                          style: const TextStyle(
                              color: Colors.black, fontSize: 12, height: 1.3),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 8)
        ],
      ),
    );
  }
}

class OrderStatusDelivaryCardInfo extends GetView<OrdersStatusControllerImp> {
  const OrderStatusDelivaryCardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width - 60,
      margin: const EdgeInsets.only(right: 10, top: 10),
      // padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.fithColor,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey[200],
          child: GestureDetector(
            onTap: () {
              if (controller.dataOrders.first.deliveryImage != "empty" ||
                  controller.dataOrders.first.deliveryImage != "fail") {
                Get.toNamed(AppRoute.openImage, arguments: {
                  "imageUrl":
                      "${AppLink.imageUser}/${controller.dataOrders.first.deliveryImage}"
                });
              }
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: (controller.dataOrders.first.deliveryImage == "empty" ||
                      controller.dataOrders.first.deliveryImage == "fail")
                  ? Image.asset(
                      AppImageAsset.user,
                      fit: BoxFit.fill,
                    )
                  : CachedNetworkImage(
                      imageUrl:
                          "${AppLink.imageUser}/${controller.dataOrders.first.deliveryImage}",
                      placeholder: (context, url) => lottie.Lottie.asset(
                        AppImageAsset.imageLoading,
                        height: 60,
                        width: 60,
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                    ),
            ),
          ),
        ),
        title: Text(
          controller.dataOrders.first.deliveryName.toString(),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: Column(
          children: [
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(Icons.phone_android_outlined,
                    color: AppColor.primaryColor, size: 17),
                const SizedBox(width: 3),
                Text(
                  controller.dataOrders.first.deliveryPhone.toString(),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    height: 1.2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(Icons.star_border,
                    color: AppColor.primaryColor, size: 17),
                const SizedBox(width: 3),
                Text(
                  controller.dataOrders.first.deliveryExpertise.toString(),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    height: 1.2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

class CustomLiveLocation extends GetView<OrdersStatusControllerImp> {
  const CustomLiveLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersStatusControllerImp>(
      builder: (controller) => Container(
        width: Get.width - 60,
        height: 200,
        margin: const EdgeInsets.only(right: 10, top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColor.fithColor,
          border: Border.all(color: AppColor.fithColor, width: 2),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: GestureDetector(
            onTap: () {},
            child: GoogleMap(
              zoomGesturesEnabled: false,
              zoomControlsEnabled: false,
              onTap: (argument) {
                Get.to(() => const MapView());
              },
              initialCameraPosition: controller.initialCameraPosition,
              mapType: MapType.normal,
              markers: controller.markers,
              polylines: controller.polylines,
              onMapCreated: (GoogleMapController mapController) async {
                controller.googleMapController = mapController;
                controller.updateCurrentLocation(
                    dataOrders: controller.dataOrders);

                // controller.getMakers(dataOrders: controller.dataOrders);
                // var points = await controller.getRouteData(
                //     dataOrders: controller.dataOrders);
                // controller.displayRoutes(points);

                // // controller.updateUserLocation(points);
                // // controller.fetchLocationPeriodically();

                // if (controller.currentStatus == 3) {
                //   controller.fetchDelivaryLocationPeriodically();
                // }

                ///////// test section /////////
                print("//////////////////////");
                print(controller.stringWayPoints);
                print("//////////////////////");
                print("//////////////////////");
                // List<LatLng> waypoints = [
                //   LatLng(30.95951750155712, 31.23914978465836), // Start
                //   LatLng(30.960566331048266, 31.24412796428729), // Waypoint
                //   LatLng(30.96178075080629, 31.24073765229862), // Waypoint
                //   LatLng(30.960708934168565, 31.240898584829726), // End
                // ];
                controller.setPolyline(controller.waypoints);
                if (controller.currentStatus == 3) {
                  controller.fetchDelivaryLocationPeriodically();
                }
                controller.update();
              },
            ),
          ),
        ),
      ),
    );
  }
}

class MapView extends GetView<OrdersStatusControllerImp> {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OrdersStatusControllerImp>(
        builder: (controller) => GoogleMap(
          initialCameraPosition: controller.initialCameraPosition,
          mapType: MapType.normal,
          markers: controller.markers,
          polylines: controller.polylines,
          onMapCreated: (GoogleMapController mapController) async {
            controller.googleMapController = mapController;
            controller.updateCurrentLocation(dataOrders: controller.dataOrders);

            controller.setPolyline(controller.waypoints);
            controller.update();
            if (controller.currentStatus == 3) {
              controller.fetchDelivaryLocationPeriodically();
            }
          },
        ),
      ),
    );
  }
}
