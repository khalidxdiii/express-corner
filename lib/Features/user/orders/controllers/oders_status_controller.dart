import 'dart:async';
import 'dart:convert';

import 'package:express_corner/core/class/statusRequest.dart';
import 'package:express_corner/core/constant/approutes.dart';
import 'package:express_corner/core/constant/colors.dart';
import 'package:express_corner/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/data/models/delivary_livelocation_model.dart';
import '../../../../core/functions/handlingdata.dart';
import '../../../../core/functions/separate_string_by_comma.dart';
import '../../../../core/services/google_maps_services.dart';
import '../../../../core/services/location_services.dart';
import '../../../../core/services/services.dart';
import '../../../../linkapi.dart';
import '../data/datasource/remote/orders_data.dart';
import '../data/models/current_orders_withdelivary_model.dart';
import 'package:http/http.dart' as http;

abstract class OrdersStatusController extends GoogleMapsServices {
  getOrdersStatus();
  goToRattingScreen();
}

class OrdersStatusControllerImp extends OrdersStatusController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  OrdersData ordersData = OrdersData(Get.find());
  List<OrdersWithDelivaryModel> dataOrders = [];
  List<DelivaryLiveLocationModel> delivaryLiveLocation = [];
  Timer? _timer;

  int currentStatus = 0;
  late String orderId;
  late String delivaryid;

  late String delivaryLat;
  late String delivaryLong;
  late String stringWayPoints;
  List<String> orderslocationNames = [];
  double orderslocationNamesLeangth = 0.0;
  List<LatLng> waypoints = [];

  var statusTitle = {
    {"title": "طلبك فى انتظار الموافقة", "status": 0},
    {"title": "تم قبول طلبك بواسطه مندوب التوصيل", "status": 1},
    {"title": "تم استلام الطرد من وجهته الاولى وفى طريقة اليكم", "status": 2},
    {"title": "قيد التوصيل", "status": 3},
    {"title": "تم التوصيل بنجاح", "status": 4},
  };

  @override
  getOrdersStatus() async {
    dataOrders.clear();
    markers.clear();
    polylines.clear();
    orderslocationNames.clear();
    waypoints.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.getOrdersStatusData(
        usersID: myServices.sharedPreferences.getString("id")!,
        orderId: orderId);
    // debugPrint('==================== Orders Status Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response["data"];
        dataOrders.addAll(
            responsedata.map((e) => OrdersWithDelivaryModel.fromJson(e)));
        currentStatus = dataOrders.first.ordersStatus!;
        delivaryid = dataOrders.first.ordersDelivaery!;

        orderslocationNames =
            separateStringByComma(dataOrders.first.orderslocationNames!);
        stringWayPoints = dataOrders.first.orderslocationLatlng!;
        userOrderLocation = LatLng(
            double.parse(dataOrders.first.ordersAddressUserLat!),
            double.parse(dataOrders.first.ordersAddressUserLong!));
        waypoints.add(userOrderLocation);

        waypoints.addAll(parseLatLngString(stringWayPoints));
        // print("/////////////////////");
        // print(orderslocationNames);
        // print("/////////////////////");

        if (currentStatus == 4) {
          currentStatus++;
        }
        // getLiveLocation();

        // if (currentStatus == 4) {
        //   goToRattingScreen();
        // }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToRattingScreen() {
    Get.toNamed(
      AppRoute.successDeliverdOrderView,
      arguments: {"orderId": orderId, "delivaryid": delivaryid},
    );
  }

  goToUserRattingViewScreen() {
    Get.toNamed(
      AppRoute.userRatingView,
      arguments: {"orderId": orderId, "delivaryid": delivaryid},
    );
  }

  checkDelivaryImage() async {
    if (dataOrders.first.deliveryImage == "empty") {
      var customAssetIcon =
          BitmapDescriptor.fromBytes(await getImageFromRowData(
        image: AppImageAsset.user,
        width: 100,
      ));
      return customAssetIcon;
    } else {
      var customNetworkIcon = await getNetworkImageMarkerWithBorder(
        "${AppLink.imageUser}/${dataOrders.first.deliveryImage}",
        borderColor: AppColor.primaryColor,
      );
      return customNetworkIcon;
    }
  }

  /// start get livelocation delivary for user
  getDelivaryLiveLocation() async {
    delivaryLiveLocation.clear();
    update();
    var response = await ordersData.getDelivaryLiveLocationData(
      delivaryid: delivaryid,
    );
    debugPrint('==================== Live Location $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response["data"];
        delivaryLiveLocation.addAll(
            responsedata.map((e) => DelivaryLiveLocationModel.fromJson(e)));
        delivaryLat = delivaryLiveLocation.first.liveLocationLat!;
        delivaryLong = delivaryLiveLocation.first.liveLocationLong!;

        var customDelivaryIcon = await checkDelivaryImage();

        markers.add(Marker(
          markerId: const MarkerId("delivary"),
          icon: customDelivaryIcon,
          position:
              LatLng(double.parse(delivaryLat), double.parse(delivaryLong)),
        ));
        update();
      } else {
        // statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  fetchDelivaryLocationPeriodically() {
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      getDelivaryLiveLocation();
    });
  }

  // end get livelocation delivary for user

  @override
  void onInit() {
    orderId = Get.arguments["orderId"];
    getOrdersStatus();

    super.onInit();
  }

  @override
  void dispose() {
    Get.delete<GoogleMapsServices>();
    _timer?.cancel();
    googleMapController.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    if (_timer?.isActive == true) {
      _timer?.cancel();
    } else {
      print('Timer is stopped');
    }
    Get.delete<GoogleMapsServices>();
    _timer?.cancel();
    super.onClose();
  }

////// delivary livelocation
  LatLng delivaryOrderLocation = const LatLng(0, 0);
  uploadDelivaryLiveLocation(
      {required String lat, required String long}) async {
    var response = await ordersData.delivaryLiveLocationData(
      delivaryid: delivaryid,
      // lat: double.parse("25.123").toString(),
      // long: double.parse("25.123").toString(),
      lat: lat,
      long: long,
    );
    debugPrint('==================== Live Location $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
      } else {
        // statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  // fetchLocationPeriodically() {
  //   Future.delayed(Duration(seconds: 5), () {
  //     getDeliveryCurrentLocation();
  //     fetchLocationPeriodically();
  //   });
  // }

  fetchLocationPeriodically() {
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      getDeliveryCurrentLocation();
    });
  }

  void getDeliveryCurrentLocation() async {
    try {
      var locationData = await locationServices.getLocation();
      LatLng currentLocation =
          LatLng(locationData.latitude!, locationData.longitude!);
      delivaryOrderLocation = currentLocation;
      uploadDelivaryLiveLocation(
          lat: locationData.latitude.toString(),
          long: locationData.longitude.toString());

      LatLng delivryLocation =
          LatLng(locationData.latitude!, locationData.longitude!);
      markers.add(Marker(
        markerId: const MarkerId("delivary"),
        position: delivryLocation,
      ));
      update();
    } on LocationServiceException catch (e) {
      // Handle location service exception
    } on LocationPermissionException catch (e) {
      // Handle location permission exception
    } catch (e) {
      // Handle other exceptions
    }
  }

////////// test section ////////////

  void drawRoute(List<LatLng> routePoints) {
    String polylineIdVal = 'polyline';
    polylines.add(Polyline(
      polylineId: PolylineId(polylineIdVal),
      visible: true,
      points: routePoints,
      color: AppColor.primaryColor,
      width: 4,
    ));
    update();
  }

  // void addMarker(LatLng position, String markerId, int number) async {

  //   final MarkerId id = MarkerId(markerId);
  //   final BitmapDescriptor markerIcon =
  //       _createCustomMarkerIcon(number.toString(), Colors.red);
  //   final Marker marker = Marker(
  //     markerId: id,
  //     position: position,
  //     icon: markerIcon,
  //     zIndex: 2,
  //     infoWindow: InfoWindow(
  //       title: 'Marker $number',
  //     ),
  //   );
  //   markers.add(marker);
  //   update();
  // }

  void addMarker(LatLng position, String markerId, int number) async {
    var ordersMarker = BitmapDescriptor.fromBytes(await getImageFromRowData(
        image: AppImageAsset.markerOrders, width: 100));
    var userMarker = BitmapDescriptor.fromBytes(
        await getImageFromRowData(image: AppImageAsset.markerUser, width: 100));
    final MarkerId id = MarkerId(markerId);
    final BitmapDescriptor markerIcon =
        position == userOrderLocation ? userMarker : ordersMarker;
    // : _createCustomMarkerIcon(number.toString(), Colors.red);
    final Marker marker = Marker(
      markerId: id,
      position: position,
      icon: markerIcon,
      zIndex: 2,
      infoWindow: InfoWindow(
        title: 'Marker $number',
      ),
    );
    markers.add(marker);

    update();
  }

  BitmapDescriptor _createCustomMarkerIcon(String number, Color color) {
    return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose);
  }

  Future<void> setPolyline(List<LatLng> waypoints) async {
    polylines.clear();
    markers.clear();
    String apiKey =
        'AIzaSyByzPGdI90_wYhvdrbhNPE37Q9AMDXu2rk'; // Replace with your Google Maps API key
    String origin = '${waypoints.first.latitude},${waypoints.first.longitude}';
    String destination =
        '${waypoints.last.latitude},${waypoints.last.longitude}';
    String waypointsStr = waypoints
        .sublist(1, waypoints.length - 1)
        .map((point) => '${point.latitude},${point.longitude}')
        .join('|');

    String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$destination&waypoints=$waypointsStr&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<LatLng> routePoints =
          _decodePoly(data['routes'][0]['overview_polyline']['points']);
      drawRoute(routePoints);
      // Add markers for each waypoint
      for (int i = 0; i < waypoints.length; i++) {
        addMarker(waypoints[i], 'marker_$i', i + 1);
      }

      // Fit all markers within the viewport
      LatLngBounds bounds = getBoundsForMarkers(waypoints);
      googleMapController
          .animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
    } else {
      print('Failed to fetch route');
    }
  }

  LatLngBounds getBoundsForMarkers(List<LatLng> markers) {
    double minLat = markers.first.latitude;
    double minLng = markers.first.longitude;
    double maxLat = markers.first.latitude;
    double maxLng = markers.first.longitude;

    for (LatLng marker in markers) {
      if (marker.latitude < minLat) minLat = marker.latitude;
      if (marker.latitude > maxLat) maxLat = marker.latitude;
      if (marker.longitude < minLng) minLng = marker.longitude;
      if (marker.longitude > maxLng) maxLng = marker.longitude;
    }

    return LatLngBounds(
      southwest: LatLng(minLat, minLng),
      northeast: LatLng(maxLat, maxLng),
    );
  }

  List<LatLng> _decodePoly(String encoded) {
    List<LatLng> poly = [];
    int index = 0;
    int len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;
      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      double latitude = lat / 1E5;
      double longitude = lng / 1E5;
      poly.add(LatLng(latitude, longitude));
    }
    return poly;
  }
}
