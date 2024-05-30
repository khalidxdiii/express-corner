import 'package:express_corner/core/constant/app_icons_assets.dart';
import 'package:get/get.dart';

import '../data/models/current_orders_withdelivary_model.dart';
import '../presintaion/widgets/oders_details/orders_details_part_one.dart';
import '../presintaion/widgets/oders_details/orders_details_part_three.dart';
import '../presintaion/widgets/oders_details/orders_details_part_two.dart';

class OrdersDetailsController extends GetxController {
  late OrdersWithDelivaryModel dataOrder;
  late String? status;
  late List<String> orderslocationNames;
  var pages = {
    {
      "title": "الطلبات",
      "icon": AppIconsAsset.ordersDetailsPart1,
      "iconActive": AppIconsAsset.ordersDetailsPart1Active,
      "page": const OrdersDetailsPartOne()
    },
    {
      "title": "عنوان التوصيل",
      "icon": AppIconsAsset.ordersDetailsPart2,
      "iconActive": AppIconsAsset.ordersDetailsPart2Active,
      "page": const OrdersDetailsPartTwo()
    },
    {
      "title": "الدفع",
      "icon": AppIconsAsset.ordersDetailsPart3,
      "iconActive": AppIconsAsset.ordersDetailsPart3Active,
      "page": const OrdersDetailsPartThree()
    }
  };

  int currentPage = 0;
  changePage(int index) {
    currentPage = index;
    update();
  }

  late List<String> items = [];

  List<String> separateStringByComma(String inputString) {
    return inputString.split(',');
  }

  @override
  void onInit() {
    dataOrder = Get.arguments["dataOrderDetails"];
    status = Get.arguments["status"];
    items = dataOrder.ordersitemdetails!.split(', ');
    orderslocationNames = separateStringByComma(dataOrder.orderslocationNames!);
    super.onInit();
  }
}
