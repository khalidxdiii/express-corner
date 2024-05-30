import '../../../../../../core/class/crud.dart';
import '../../../../../../linkapi.dart';

class OrdersData {
  Crud crud;
  OrdersData(this.crud);

  pindingData({required String usersID}) async {
    var response =
        await crud.postData(AppLink.ordersPinding, {"usersid": usersID});
    return response.fold((l) => l, (r) => r);
  }

  deletePindingData({required String orderID}) async {
    var response =
        await crud.postData(AppLink.ordersDelete, {"ordersid": orderID});
    return response.fold((l) => l, (r) => r);
  }

  currentOrdersData({required String usersID}) async {
    var response =
        await crud.postData(AppLink.ordersCurrent, {"usersid": usersID});
    return response.fold((l) => l, (r) => r);
  }

  archiveData({required String usersID}) async {
    var response =
        await crud.postData(AppLink.ordersArchive, {"usersid": usersID});
    return response.fold((l) => l, (r) => r);
  }

  archiveRating(
      {required String ordersID,
      required String rating,
      required String comment}) async {
    var response = await crud.postData(AppLink.ratingAdd, {
      "orderid": ordersID,
      "rating": rating,
      "comment": comment,
    });
    return response.fold((l) => l, (r) => r);
  }

  getOrdersStatusData(
      {required String usersID, required String orderId}) async {
    var response = await crud.postData(
        AppLink.ordersStatus, {"usersid": usersID, "orderId": orderId});
    return response.fold((l) => l, (r) => r);
  }

  getDelivaryLiveLocationData({
    required String delivaryid,
  }) async {
    var response = await crud.postData(
        AppLink.ordersGetDelivaryLiveLocation, {"delivaryId": delivaryid});
    return response.fold((l) => l, (r) => r);
  }

  delivaryLiveLocationData(
      {required String delivaryid,
      required String lat,
      required String long}) async {
    var response = await crud.postData(AppLink.ordersDelivaryLiveLocation,
        {"delivaryid": delivaryid, "lat": lat, "long": long});
    return response.fold((l) => l, (r) => r);
  }
}
