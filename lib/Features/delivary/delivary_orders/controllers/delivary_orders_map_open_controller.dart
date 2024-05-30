// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:http/http.dart' as http;
// import 'dart:ui' as ui;

// import '../../../../core/class/statusRequest.dart';
// import '../../../../core/constant/colors.dart';
// import '../../../../core/constant/imageasset.dart';
// import '../../../../core/functions/handlingdata.dart';
// import '../../../../core/functions/separate_string_by_comma.dart';
// import '../../../../core/services/google_maps_services.dart';
// import '../../../../core/services/location_services.dart';
// import '../../../../core/services/services.dart';
// import '../../../../linkapi.dart';
// import '../data/datasource/remote/delivary_orders_data.dart';
// import '../data/models/delivary_orders_details_model.dart';

// class DelivaryOrdersMapOpenController extends GoogleMapsServices {}

// class DelivaryOrdersMapOpenControllerImp
//     extends DelivaryOrdersMapOpenController {
//   StatusRequest statusRequest = StatusRequest.none;

//   MyServices myServices = Get.find();

//   DelivaryOrdersData ordersData = DelivaryOrdersData(Get.find());

//   LatLng delivaryOrderLocation = const LatLng(0, 0);

//   Timer? timer;
//   List<LatLng> waypoints = [];
//   late String delivaryImage;
//   List<DelivaryOrdersDetailsModel> dataOrders = [];
//   int currentStatus = 0;
//   late String stringWayPoints;
//   List<String> orderslocationNames = [];
//   late String orderId;
//   late String delivaryid;
//   late String usersID;

//   @override
//   void onInit() {
//     orderId = Get.arguments["orderId"];
//     usersID = Get.arguments["usersID"];
//     waypoints = Get.arguments["waypoints"];
//     delivaryImage =
//         myServices.sharedPreferences.getString("userimage").toString();
//     getOrdersStatus();
//     super.onInit();
//   }

//   @override
//   void dispose() {
//     Get.delete<GoogleMapsServices>();
//     timer?.cancel();
//     googleMapController.dispose();
//     super.dispose();
//   }

//   @override
//   void onClose() {
//     if (timer?.isActive == true) {
//       timer?.cancel();
//     } else {
//       print('Timer is stopped');
//     }
//     Get.delete<GoogleMapsServices>();
//     timer?.cancel();
//     super.onClose();
//   }

//   getOrdersStatus() async {
//     dataOrders.clear();
//     markers.clear();
//     polylines.clear();
//     orderslocationNames.clear();
//     waypoints.clear();
//     statusRequest = StatusRequest.loading;
//     update();
//     var response = await ordersData.getOrdersStatusData(
//         usersID: usersID, orderId: orderId);
//     debugPrint(
//         '==================== Delivary Orders Status Controller $response');
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == "success") {
//         List responsedata = response["data"];
//         dataOrders.addAll(
//             responsedata.map((e) => DelivaryOrdersDetailsModel.fromJson(e)));
//         currentStatus = dataOrders.first.ordersStatus!;
//         delivaryid = dataOrders.first.ordersDelivaery!;
//         // userImage = dataOrders.first.userImage!;
//         // userPhone = dataOrders.first.userPhone!;
//         // userName = dataOrders.first.userName!;
//         orderslocationNames =
//             separateStringByComma(dataOrders.first.orderslocationNames!);
//         stringWayPoints = dataOrders.first.orderslocationLatlng!;
//         userOrderLocation = LatLng(
//             double.parse(dataOrders.first.ordersAddressUserLat!),
//             double.parse(dataOrders.first.ordersAddressUserLong!));
//         // waypoints.add(userOrderLocation);

//         // waypoints.addAll(parseLatLngString(stringWayPoints));
//         // print("/////////////////////");
//         // print(orderslocationNames);
//         // print("/////////////////////");

//         if (currentStatus == 4) {
//           currentStatus++;
//           update();
//         }
//         if (currentStatus == 2) {
//           update();
//         }
//         // getLiveLocation();

//         // if (currentStatus == 4) {
//         //   goToRattingScreen();
//         // }
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//     }
//     update();
//   }

//   fetchLocationPeriodically() {
//     timer = Timer.periodic(const Duration(seconds: 10), (timer) {
//       getDeliveryCurrentLocation();
//     });
//   }

//   void getDeliveryCurrentLocation() async {
//     try {
//       var locationData = await locationServices.getLocation();
//       LatLng delivaryCurrentLocation =
//           LatLng(locationData.latitude!, locationData.longitude!);
//       delivaryOrderLocation = delivaryCurrentLocation;
//       uploadDelivaryLiveLocation(
//           lat: locationData.latitude.toString(),
//           long: locationData.longitude.toString());

//       LatLng delivryLocation =
//           LatLng(locationData.latitude!, locationData.longitude!);
//       var customDelivaryIcon = await checkDelivaryImage();
//       markers.remove(Marker(
//         markerId: const MarkerId("delivary"),
//         icon: customDelivaryIcon,
//       ));
//       markers.add(Marker(
//         markerId: const MarkerId("delivary"),
//         icon: customDelivaryIcon,
//         position: delivryLocation,
//       ));
//       update();
//     } on LocationServiceException catch (e) {
//       // Handle location service exception
//     } on LocationPermissionException catch (e) {
//       // Handle location permission exception
//     } catch (e) {
//       // Handle other exceptions
//     }
//   }

//   checkDelivaryImage() async {
//     if (dataOrders.first.userImage == "empty") {
//       var customAssetIcon =
//           BitmapDescriptor.fromBytes(await getImageFromRowData(
//         image: AppImageAsset.user,
//         width: 100,
//       ));
//       return customAssetIcon;
//     } else {
//       var customNetworkIcon = await getNetworkImageMarkerWithBorder(
//         "${AppLink.imageUser}/$delivaryImage",
//         borderColor: AppColor.primaryColor,
//       );
//       return customNetworkIcon;
//     }
//   }

//   uploadDelivaryLiveLocation(
//       {required String lat, required String long}) async {
//     var response = await ordersData.delivaryLiveLocationData(
//       delivaryid: delivaryid,
//       // lat: double.parse("25.123").toString(),
//       // long: double.parse("25.123").toString(),
//       lat: lat,
//       long: long,
//     );
//     debugPrint('==================== Delivary Live Location $response');
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == "success") {
//       } else {
//         // statusRequest = StatusRequest.failure;
//       }
//     }
//     update();
//   }

//   Future<void> setPolyline(List<LatLng> waypoints) async {
//     polylines.clear();
//     markers.clear();
//     String apiKey =
//         'AIzaSyByzPGdI90_wYhvdrbhNPE37Q9AMDXu2rk'; // Replace with your Google Maps API key
//     String origin = '${waypoints.first.latitude},${waypoints.first.longitude}';
//     String destination =
//         '${waypoints.last.latitude},${waypoints.last.longitude}';
//     String waypointsStr = waypoints
//         .sublist(1, waypoints.length - 1)
//         .map((point) => '${point.latitude},${point.longitude}')
//         .join('|');

//     String url =
//         'https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$destination&waypoints=$waypointsStr&key=$apiKey';

//     final response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       List<LatLng> routePoints =
//           _decodePoly(data['routes'][0]['overview_polyline']['points']);
//       drawRoute(routePoints);
//       // Add markers for each waypoint
//       for (int i = 0; i < waypoints.length; i++) {
//         addMarker(waypoints[i], 'marker_$i', i + 1);
//       }

//       // Fit all markers within the viewport
//       LatLngBounds bounds = getBoundsForMarkers(waypoints);
//       googleMapController
//           .animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
//     } else {
//       print('Failed to fetch route');
//     }
//   }

//   LatLngBounds getBoundsForMarkers(List<LatLng> markers) {
//     double minLat = markers.first.latitude;
//     double minLng = markers.first.longitude;
//     double maxLat = markers.first.latitude;
//     double maxLng = markers.first.longitude;

//     for (LatLng marker in markers) {
//       if (marker.latitude < minLat) minLat = marker.latitude;
//       if (marker.latitude > maxLat) maxLat = marker.latitude;
//       if (marker.longitude < minLng) minLng = marker.longitude;
//       if (marker.longitude > maxLng) maxLng = marker.longitude;
//     }

//     return LatLngBounds(
//       southwest: LatLng(minLat, minLng),
//       northeast: LatLng(maxLat, maxLng),
//     );
//   }

//   void drawRoute(List<LatLng> routePoints) {
//     String polylineIdVal = 'polyline';
//     polylines.add(Polyline(
//       polylineId: PolylineId(polylineIdVal),
//       visible: true,
//       points: routePoints,
//       color: AppColor.primaryColor,
//       width: 4,
//     ));
//     update();
//   }

//   void updateCurrentDelivaryLocation(
//       {required List<DelivaryOrdersDetailsModel> dataOrders}) async {
//     try {
//       // var locationData = await locationServices.getLocation();
//       // LatLng myCurrentLocation =
//       //     LatLng(locationData.latitude!, locationData.longitude!);
//       userOrderLocation = LatLng(
//           double.parse(dataOrders.first.ordersAddressUserLat!),
//           double.parse(dataOrders.first.ordersAddressUserLong!));
//       CameraPosition myCurrentLocationPosition = CameraPosition(
//         target: userOrderLocation,
//         zoom: 15,
//       );
//       googleMapController.animateCamera(
//           CameraUpdate.newCameraPosition(myCurrentLocationPosition));
//       update();
//     } on LocationServiceException catch (e) {
//       // to do
//     } on LocationPermissionException catch (e) {
//       // to do
//     } catch (e) {
//       // to do
//     }
//     update();
//   }

//   void addMarker(LatLng position, String markerId, int number) async {
//     var ordersMarker = BitmapDescriptor.fromBytes(await getImageFromRowData(
//         image: AppImageAsset.markerOrders, width: 100));
//     var userMarker = BitmapDescriptor.fromBytes(
//         await getImageFromRowData(image: AppImageAsset.markerUser, width: 100));
//     final MarkerId id = MarkerId(markerId);
//     final BitmapDescriptor markerIcon =
//         position == userOrderLocation ? userMarker : ordersMarker;
//     // : _createCustomMarkerIcon(number.toString(), Colors.red);
//     final Marker marker = Marker(
//       markerId: id,
//       position: position,
//       icon: markerIcon,
//       zIndex: 2,
//       infoWindow: InfoWindow(
//         title: 'Marker $number',
//       ),
//     );
//     markers.add(marker);

//     update();
//   }

//   Future<Uint8List> getImageFromRowData(
//       {required String image, required double width}) async {
//     var imageData = await rootBundle.load(image);
//     var imageCodec = await ui.instantiateImageCodec(
//         imageData.buffer.asUint8List(),
//         targetWidth: width.toInt());
//     var imageFrameInfo = await imageCodec.getNextFrame();
//     var imageBytData =
//         await imageFrameInfo.image.toByteData(format: ui.ImageByteFormat.png);
//     return imageBytData!.buffer.asUint8List();
//   }

//   Future<BitmapDescriptor> getNetworkImageMarkerWithBorder(String url,
//       {int width = 100,
//       int height = 100,
//       Color borderColor = Colors.blue,
//       double borderWidth = 5}) async {
//     final http.Response response = await http.get(Uri.parse(url));
//     final Uint8List bytes = response.bodyBytes;
//     ui.Codec codec = await ui.instantiateImageCodec(bytes,
//         targetWidth: width, targetHeight: height);
//     ui.FrameInfo fi = await codec.getNextFrame();

//     // Create a new picture recorder and canvas
//     final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
//     final ui.Canvas canvas = ui.Canvas(pictureRecorder);
//     final ui.Size size = ui.Size(width.toDouble(), height.toDouble());

//     // Draw the image into a circular clip path
//     final path = ui.Path()
//       ..addOval(Rect.fromLTWH(0, 0, size.width, size.height));
//     canvas.clipPath(path);

//     // Adjust the image size to fit within the border
//     final adjustedSize = size.width - 2 * borderWidth;
//     final imageRect =
//         Rect.fromLTWH(borderWidth, borderWidth, adjustedSize, adjustedSize);
//     paintImage(
//         canvas: canvas, rect: imageRect, image: fi.image, fit: BoxFit.fill);

//     // Draw the border
//     final paint = ui.Paint()
//       ..color = borderColor
//       ..style = ui.PaintingStyle.stroke
//       ..strokeWidth = borderWidth;
//     canvas.drawCircle(
//         size.center(Offset.zero), size.width / 2 - borderWidth / 2, paint);

//     // Convert canvas to image, then to bytes
//     final ui.Image image =
//         await pictureRecorder.endRecording().toImage(width, height);
//     final ByteData? byteData =
//         await image.toByteData(format: ui.ImageByteFormat.png);
//     final Uint8List imgBytes = byteData!.buffer.asUint8List();

//     return BitmapDescriptor.fromBytes(imgBytes);
//   }

//   List<LatLng> _decodePoly(String encoded) {
//     List<LatLng> poly = [];
//     int index = 0;
//     int len = encoded.length;
//     int lat = 0, lng = 0;

//     while (index < len) {
//       int b, shift = 0, result = 0;
//       do {
//         b = encoded.codeUnitAt(index++) - 63;
//         result |= (b & 0x1F) << shift;
//         shift += 5;
//       } while (b >= 0x20);
//       int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
//       lat += dlat;
//       shift = 0;
//       result = 0;
//       do {
//         b = encoded.codeUnitAt(index++) - 63;
//         result |= (b & 0x1F) << shift;
//         shift += 5;
//       } while (b >= 0x20);
//       int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
//       lng += dlng;

//       double latitude = lat / 1E5;
//       double longitude = lng / 1E5;
//       poly.add(LatLng(latitude, longitude));
//     }
//     return poly;
//   }
// }
