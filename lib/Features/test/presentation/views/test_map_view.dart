// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// import '../../../user/orders/data/models/orders_details_model.dart';
// import '../../controllers/test_map_controller.dart';

// class TestSearchView1 extends StatelessWidget {
//   TestSearchView1({super.key});
//   final GoogleMapsServicesTest mapServices = Get.put(GoogleMapsServicesTest());
//   List<OrdersDetailsModel> ordersList = [
//     OrdersDetailsModel(
//       ordersAddressUserLat: "37.4219983",
//       ordersAddressUserLong: "-122.084",
//       ordersToAddressLat: "37.42796133580664",
//       ordersToAddressLong: "-122.085749655962",
//     ),
//   ];
//   void displayRoute() async {
//     List<LatLng> routePoints =
//         await mapServices.getRouteData(dataOrders: ordersList);
//     mapServices.displayRouteForLatLngList(routePoints);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Map Example')),
//       body: GoogleMap(
//         initialCameraPosition: mapServices.initialCameraPosition,
//         onMapCreated: (controller) {
//           mapServices.googleMapController = controller;
//           displayRoute(); // Display the route when the map is created
//         },
//         markers: mapServices.markers,
//         polylines: mapServices.polylines,
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: displayRoute,
//         tooltip: 'Show Route',
//         child: Icon(Icons.route),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controllers/test_map_controller.dart';

class TestSearchView1 extends StatelessWidget {
  const TestSearchView1({super.key});

  @override
  Widget build(BuildContext context) {
    final MapController controller = Get.put(MapController());
    return Scaffold(
      appBar: AppBar(title: Text('Multiple Points Route')),
      body: GetBuilder<MapController>(
        builder: (controller) => GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(34.052235, -118.243683), // Example: Los Angeles
            zoom: 12,
          ),
          onMapCreated: controller.setMapController,
          polylines: controller.polylines.value,
          markers: controller.markers.value,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Example coordinates for the route
          List<LatLng> waypoints = [
            LatLng(34.052235, -118.243683), // Start
            LatLng(34.140678, -118.132256), // Waypoint
            LatLng(34.129045, -118.285123), // Waypoint
            LatLng(34.025917, -118.779757), // End
          ];
          controller.setPolyline(waypoints);
          controller.update();
        },
        child: Icon(Icons.directions),
      ),
    );
  }
}
