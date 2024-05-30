import '../../../../../../core/class/crud.dart';
import '../../../../../../linkapi.dart';

class DelivaryRatingsData {
  Crud crud;
  DelivaryRatingsData(this.crud);

  getAllDelivaryRatings({required String deliveryid}) async {
    var response = await crud.postData(AppLink.delivaryGetAllRatings, {
      "deliveryid": deliveryid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
