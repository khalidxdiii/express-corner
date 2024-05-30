import '../../../../../../core/class/crud.dart';
import '../../../../../../linkapi.dart';

class DelivarySittingData {
  Crud crud;
  DelivarySittingData(this.crud);

  getDelivaryStatusType({required String deliveryid}) async {
    var response = await crud.postData(AppLink.delivaryGetDelivaryStatusType, {
      "deliveryid": deliveryid,
    });
    return response.fold((l) => l, (r) => r);
  }

  changeDelivaryStatusType(
      {required String deliveryid,
      required String newDelivaryStatusType}) async {
    var response = await crud.postData(AppLink.delivaryChangeDelivaryStatusType,
        {"deliveryid": deliveryid, "status": newDelivaryStatusType});
    return response.fold((l) => l, (r) => r);
  }
}
