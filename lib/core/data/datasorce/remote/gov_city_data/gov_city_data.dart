import '../../../../class/crud.dart';
import '../../../../../linkapi.dart';

class GovCityData {
  Crud crud;
  GovCityData(this.crud);

  govAdd({
    required String govName,
  }) async {
    var response = await crud.postData(AppLink.govAdd, {
      "name": govName,
    });
    return response.fold((l) => l, (r) => r);
  }

  govView() async {
    var response = await crud.postData(AppLink.govView, {});
    return response.fold((l) => l, (r) => r);
  }

  cityAdd({
    required String cityName,
    required String govId,
  }) async {
    var response = await crud.postData(AppLink.cityAdd, {
      "cityName": cityName,
      "govId": govId,
    });
    return response.fold((l) => l, (r) => r);
  }

  cityView({
    required String govId,
  }) async {
    var response = await crud.postData(AppLink.cityView, {
      "govId": govId,
    });
    return response.fold((l) => l, (r) => r);
  }

  genderView() async {
    var response = await crud.postData(AppLink.genderView, {});
    return response.fold((l) => l, (r) => r);
  }
}
