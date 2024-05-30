import '../../../../../../core/class/crud.dart';
import '../../../../../../linkapi.dart';

class RatingData {
  Crud crud;
  RatingData(this.crud);

  addUserRating({
    required String ordersID,
    required String userid,
    required String delivaryid,
    required String rating,
    required String comment,
  }) async {
    var response = await crud.postData(AppLink.ratingAdd, {
      "orderid": ordersID,
      "userid": userid,
      "delivaryid": delivaryid,
      "rating": rating,
      "comment": comment,
    });
    return response.fold((l) => l, (r) => r);
  }
}
