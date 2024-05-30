import '../../../../../../core/class/crud.dart';
import '../../../../../../linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);

  addFavorite(
      {required String usersId,
      required String placeid,
      required String type}) async {
    var response = await crud.postData(AppLink.favoriteAdd, {
      "usersid": usersId,
      "placeid": placeid,
      "type": type,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteFavorite({required String usersId, required String placeid}) async {
    var response = await crud.postData(AppLink.favoriteRemove, {
      "usersid": usersId,
      "placeid": placeid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
