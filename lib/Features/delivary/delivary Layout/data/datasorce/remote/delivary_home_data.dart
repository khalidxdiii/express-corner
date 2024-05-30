import '../../../../../../core/class/crud.dart';
import '../../../../../../linkapi.dart';

class DelivaryHomeDataData {
  Crud crud;
  DelivaryHomeDataData(this.crud);

  getDelivaryInfo({required String deliveryid}) async {
    var response = await crud.postData(AppLink.delivaryGetInfo, {
      "deliveryid": deliveryid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
