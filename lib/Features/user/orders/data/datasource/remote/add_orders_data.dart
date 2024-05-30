import 'dart:io';

import '../../../../../../core/class/crud.dart';
import '../../../../../../linkapi.dart';

class AddOrdersData {
  Crud crud;
  AddOrdersData(this.crud);

  viewData({
    required String usersid,
  }) async {
    var response = await crud.postData(AppLink.ordersView, {
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }

  addOrdersData({
    required String usersid,
    required String addressid,
    required String orderPlaceId,
    required String orderstype,
    required String pricedelivary,
    required String ordersprice,
    required String locationName,
    required String itemDetails,
    required String orderNotes,
    required String addressUserGov,
    required String addressUserCity,
    required String addressUserDetails,
    required String addressUserType,
    required String addressUserLat,
    required String addressUserLong,
    required String toAddressName,
    // required String toAddressDetails,
    // required String toAddressLat,
    // required String toAddressLong,
    // required List<File> file,
    required File? file,

    //
    required String ordersLocationCoordinates,
  }) async {
    var response = await crud.addRequestWithImageOne(
      AppLink.ordersAdd,
      {
        "usersid": usersid,
        "addressid": addressid,
        "placeid": orderPlaceId,
        "orderstype": orderstype,
        "pricedelivary": pricedelivary,
        "ordersprice": ordersprice,
        "paymentmethod": "0",
        "orderslocationname": locationName,
        "ordersitemdetails": itemDetails,
        "orderNotes": orderNotes,
        "addressUserGov": addressUserGov,
        "addressUserCity": addressUserCity,
        "addressUserDetails": addressUserDetails,
        "addressUserType": addressUserType,
        "addressUserLat": addressUserLat,
        "addressUserLong": addressUserLong,
        "toAddressName": toAddressName,
        // "toAddressDetails": toAddressDetails,
        // "toAddressLat": toAddressLat,
        // "toAddressLong": toAddressLong,

        //
        "ordersLocationCoordinates": ordersLocationCoordinates.toString(),
      },
      file,
    );
    return response.fold((l) => l, (r) => r);
  }

  uploadMultipleImage({
    required List<File> file,
  }) async {
    var response =
        await crud.addRequestWithMultiple(AppLink.ordersAdd, {}, file);
    return response.fold((l) => l, (r) => r);
  }
}
