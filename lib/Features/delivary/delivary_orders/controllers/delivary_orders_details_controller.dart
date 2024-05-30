import 'package:express_corner/core/constant/app_icons_assets.dart';
import 'package:get/get.dart';

import '../data/models/delivary_orders_details_model.dart';
import '../presintaion/widgets/delivary_oders_details/delivary_orders_details_part_one.dart';
import '../presintaion/widgets/delivary_oders_details/delivary_orders_details_part_three.dart';
import '../presintaion/widgets/delivary_oders_details/delivary_orders_details_part_two.dart';

class DelivaryOrdersDetailsController extends GetxController {
  late DelivaryOrdersDetailsModel dataOrder;
  late String? status;
  late List<String> orderslocationNames;
  var pages = {
    {
      "title": "الطلبات",
      "icon": AppIconsAsset.ordersDetailsPart1,
      "iconActive": AppIconsAsset.ordersDetailsPart1Active,
      "page": const DelivaryOrdersDetailsPartOne()
    },
    {
      "title": "عنوان التوصيل",
      "icon": AppIconsAsset.ordersDetailsPart2,
      "iconActive": AppIconsAsset.ordersDetailsPart2Active,
      "page": const DelivaryOrdersDetailsPartTwo()
    },
    {
      "title": "الدفع",
      "icon": AppIconsAsset.ordersDetailsPart3,
      "iconActive": AppIconsAsset.ordersDetailsPart3Active,
      "page": const DelivaryOrdersDetailsPartThree()
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
