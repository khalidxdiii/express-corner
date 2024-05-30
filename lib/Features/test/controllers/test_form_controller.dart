import 'package:get/get.dart';

class TestOrderController extends GetxController {
  var places = <PlaceOrder>[].obs;

  void addNewOrder(int index, String order) {
    places[index].orders.add(order);
    places.refresh();
  }

  void addNewPlace(String placeName) {
    places.add(PlaceOrder(placeName: placeName));
  }
}


class PlaceOrder {
  String placeName;
  List<String> orders;

  PlaceOrder({required this.placeName, this.orders = const []});
}
