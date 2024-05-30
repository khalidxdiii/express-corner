import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../core/class/handlingdataview.dart';
import '../../../../../../core/shared/defult_button.dart';
import '../../../controllers/address/add_map_controller.dart';

class AddressAddMapView extends StatelessWidget {
  const AddressAddMapView({super.key});

  @override
  Widget build(BuildContext context) {
    AddAdressMapController controllerPage = Get.put(AddAdressMapController());
    return Scaffold(
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
      //   child: CustomDefultButton(
      //     text: "Next",
      //     onPressed: () {
      //       controllerPage.goToAddressInfoPage();
      //     },
      //   ),
      // ),
      appBar: AppBar(
        title: const Text(
          "اضافه عنوان جديد",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "Almarai",
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
      body: Container(
          child: GetBuilder<AddAdressMapController>(
        builder: (controllerPage) => HandlingDataView(
          statusRequest: controllerPage.statusRequest,
          widget: Column(
            children: [
              if (controllerPage.kGooglePlex != null)
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      GoogleMap(
                        mapType: MapType.normal,
                        markers: controllerPage.marker.toSet(),
                        onTap: (latLng) {
                          controllerPage.addMarkers(latLng);
                        },
                        initialCameraPosition: controllerPage.kGooglePlex!,
                        onMapCreated: (GoogleMapController controllermap) {
                          controllerPage.completercontroller!
                              .complete(controllermap);
                        },
                      ),
                      Positioned(
                        bottom: 20,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: CustomDefultButton(
                            text: "التالى",
                            isPadding: true,
                            onPressed: () {
                              controllerPage.goToAddressDetailsPage();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      )),
    );
  }
}
