import '../../../../../../core/class/crud.dart';
import '../../../../../../linkapi.dart';

class MyFavoriteDate {
  Crud crud;
  MyFavoriteDate(this.crud);

  getData({required String usersId}) async {
    var response = await crud.postData(AppLink.favoriteView, {
      "usersid": usersId,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData({required String favId}) async {
    var response = await crud.postData(AppLink.deleteFromMyFavorite, {
      "favoriteid": favId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
