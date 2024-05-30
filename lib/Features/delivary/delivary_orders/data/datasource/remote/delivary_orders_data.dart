import '../../../../../../core/class/crud.dart';
import '../../../../../../linkapi.dart';

class DelivaryOrdersData {
  Crud crud;
  DelivaryOrdersData(this.crud);

  approveOrderData(
      {required String orderid,
      required String usersid,
      required String deliveryid}) async {
    var response = await crud.postData(AppLink.delivaryOrdersApprove, {
      "orderid": orderid,
      "usersid": usersid,
      "deliveryid": deliveryid,
    });
    return response.fold((l) => l, (r) => r);
  }

  pindingData() async {
    var response = await crud.postData(AppLink.delivaryOrdersPindingView, {});
    return response.fold((l) => l, (r) => r);
  }

  rejectPindingData(
      {required String orderid, required String deliveryid}) async {
    var response = await crud.postData(AppLink.delivaryRejectOrder,
        {"orderid": orderid, "deliveryid": deliveryid});
    return response.fold((l) => l, (r) => r);
  }

  getAllRejectPindingData({required String deliveryid}) async {
    var response = await crud.postData(
        AppLink.delivaryGetAllRejectOrderView, {"deliveryid": deliveryid});
    return response.fold((l) => l, (r) => r);
  }

  acceptedOrdersData({required String deliveryid}) async {
    var response = await crud.postData(
        AppLink.delivaryOrdersAcceptedView, {"deliveryid": deliveryid});
    return response.fold((l) => l, (r) => r);
  }

  archiveData({required String deliveryid}) async {
    var response = await crud.postData(
        AppLink.delivaryOrdersArchiveView, {"deliveryid": deliveryid});
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
        AppLink.delivaryOrdersStatus, {"usersid": usersID, "orderId": orderId});
    return response.fold((l) => l, (r) => r);
  }

  getDelivaryLiveLocationData({
    required String delivaryid,
  }) async {
    var response = await crud.postData(
        AppLink.ordersGetDelivaryLiveLocation, {"delivaryId": delivaryid});
    return response.fold((l) => l, (r) => r);
  }

  getDelivaryAcceptedOrdersApproveData({
    required String deliveryid,
  }) async {
    var response = await crud
        .postData(AppLink.delivaryAccepted, {"deliveryid": deliveryid});
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

  orderStatusFirstDestinationData(
      {required String orderid, required String usersid}) async {
    var response = await crud.postData(AppLink.delivaryOrderFirstDestination,
        {"orderid": orderid, "usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  orderStatusOnTheWayData(
      {required String orderid, required String usersid}) async {
    var response = await crud.postData(AppLink.delivaryOrderOnTheWay,
        {"orderid": orderid, "usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  orderStatusDoneData(
      {required String orderid,
      required String usersid,
      required String deliveryid}) async {
    var response = await crud.postData(AppLink.delivaryOrderDone, {
      "orderid": orderid,
      "usersid": usersid,
      "deliveryid": deliveryid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
