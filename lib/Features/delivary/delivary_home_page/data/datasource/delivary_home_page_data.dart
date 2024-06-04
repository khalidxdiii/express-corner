import '../../../../../../core/class/crud.dart';
import '../../../../../../linkapi.dart';

class DelivaryHomePageData {
  Crud crud;
  DelivaryHomePageData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.homepage, {});
    return response.fold((l) => l, (r) => r);
  }

  // searchData({required String search}) async {
  //   var response = await crud.postData(AppLink.searchItems, {
  //     "search": search,
  //   });
  //   return response.fold((l) => l, (r) => r);
  // }
}
