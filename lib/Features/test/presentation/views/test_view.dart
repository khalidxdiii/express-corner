import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/test_form_controller.dart';

class OrderFormWidget extends StatelessWidget {
  final TestOrderController controller = Get.put(TestOrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dynamic Order Form')),
      body: Obx(() => ListView.builder(
            itemCount: controller.places.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(controller.places[index].placeName),
                subtitle: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.places[index].orders.length,
                  itemBuilder: (context, orderIndex) {
                    return Text(controller.places[index].orders[orderIndex]);
                  },
                ),
                trailing: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => controller.addNewOrder(index, 'New Order ${controller.places[index].orders.length + 1}'),
                ),
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.addNewPlace('New Place ${controller.places.length + 1}'),
        child: Icon(Icons.add_location),
      ),
    );
  }
}
