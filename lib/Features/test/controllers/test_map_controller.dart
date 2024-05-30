// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';

// class MapController extends GetxController {
//   GoogleMapController? mapController;
//   RxSet<Polyline> polylines = <Polyline>{}.obs;
//   RxSet<Marker> markers = <Marker>{}.obs;

//   void setMapController(GoogleMapController controller) {
//     mapController = controller;
//   }

//   void drawRoute(List<LatLng> routePoints) {
//     final String polylineIdVal = 'polyline_${polylines.length}';
//     polylines.add(Polyline(
//       polylineId: PolylineId(polylineIdVal),
//       visible: true,
//       points: routePoints,
//       color: Colors.blue,
//       width: 4,
//     ));
//     update();
//   }

//   void addMarker(LatLng position, String markerId, int number) {
//     BitmapDescriptor customIcon = _createCustomMarkerIcon(number.toString());
//     markers.add(Marker(
//       markerId: MarkerId(markerId),
//       position: position,
//       icon: customIcon,
//     ));
//     update();
//   }

//   BitmapDescriptor _createCustomMarkerIcon(String number) {
//     return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue);
//     // You can use any method to generate a custom marker icon here
//     // For simplicity, this example uses the default blue marker with text
//   }

//   Future<void> setPolyline(List<LatLng> waypoints) async {
//     PolylinePoints polylinePoints = PolylinePoints();
//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//       'AIzaSyByzPGdI90_wYhvdrbhNPE37Q9AMDXu2rk', // Google Maps API Key
//       PointLatLng(waypoints.first.latitude, waypoints.first.longitude),
//       PointLatLng(waypoints.last.latitude, waypoints.last.longitude),
//       travelMode: TravelMode.driving,
//       wayPoints: waypoints
//           .sublist(1, waypoints.length - 1)
//           .map(
//               (e) => PolylineWayPoint(location: "${e.latitude},${e.longitude}"))
//           .toList(),
//     );

//     if (result.status == 'OK') {
//       drawRoute(
//           result.points.map((e) => LatLng(e.latitude, e.longitude)).toList());
//       // Add markers for each waypoint
//       for (int i = 0; i < waypoints.length; i++) {
//         addMarker(waypoints[i], 'marker_$i', i + 1);
//       }
//     } else {
//       print('Failed to fetch route: ${result.errorMessage}');
//     }
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class MapController extends GetxController {
  GoogleMapController? mapController;
  RxSet<Polyline> polylines = <Polyline>{}.obs;
  RxSet<Marker> markers = <Marker>{}.obs;

  void setMapController(GoogleMapController controller) {
    mapController = controller;
  }

  void drawRoute(List<LatLng> routePoints) {
    final String polylineIdVal = 'polyline_${polylines.length}';
    polylines.add(Polyline(
      polylineId: PolylineId(polylineIdVal),
      visible: true,
      points: routePoints,
      color: Colors.blue,
      width: 4,
    ));
    update();
  }

  void addMarker(LatLng position, String markerId, int number) {
    final MarkerId id = MarkerId(markerId);
    final BitmapDescriptor markerIcon =
        _createCustomMarkerIcon(number.toString(), Colors.red);
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
    return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
  }

  Future<void> setPolyline(List<LatLng> waypoints) async {
    polylines.clear();
    markers.clear();
    String apiKey =
        'AIzaSyByzPGdI90_wYhvdrbhNPE37Q9AMDXu2rk'; // Replace with your actual Google Maps API key
    String origin = '${waypoints.first.latitude},${waypoints.first.longitude}';
    String destination =
        '${waypoints.last.latitude},${waypoints.last.longitude}';
    String waypointsStr = waypoints
        .sublist(1, waypoints.length - 1)
        .map((point) => '${point.latitude},${point.longitude}')
        .join('|');

    // Update to the Routes API endpoint
    String url =
        'https://maps.googleapis.com/maps/api/route/json?origin=$origin&destination=$destination&waypoints=$waypointsStr&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<LatLng> routePoints = _decodePoly(data['routes'][0]
              ['overview_polyline'][
          'points']); // Make sure the path to polyline points is updated based on Routes API response structure
      drawRoute(routePoints);
      // Add markers for each waypoint
      for (int i = 0; i < waypoints.length; i++) {
        addMarker(waypoints[i], 'marker_$i', i + 1);
      }

      // Fit all markers within the viewport
      LatLngBounds bounds = getBoundsForMarkers(waypoints);
      mapController?.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
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
