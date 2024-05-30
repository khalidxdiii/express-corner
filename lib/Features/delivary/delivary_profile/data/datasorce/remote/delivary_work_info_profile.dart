import 'dart:io';

import '../../../../../../core/class/crud.dart';
import '../../../../../../linkapi.dart';

class DelivaryWorkInfoProfileData {
  Crud crud;
  DelivaryWorkInfoProfileData(this.crud);

  getDelivaryWorkInfoData({required String deliveryid}) async {
    var response =
        await crud.postData(AppLink.delivaryGetDelivaryWorkProfileData, {
      "deliveryid": deliveryid,
    });
    return response.fold((l) => l, (r) => r);
  }

  getAllDelivaryExpertiesData() async {
    var response = await crud.postData(AppLink.delivaryGetAllExpertiesData, {});
    return response.fold((l) => l, (r) => r);
  }

  getAllDelivaryTypeVehicleData() async {
    var response =
        await crud.postData(AppLink.delivaryGetAllTypeVehicleData, {});
    return response.fold((l) => l, (r) => r);
  }

  delivaryEditProfileData({
    required String delivaryId,
    required String typeVichele,
    required String expertise,
    required File? imageVichele,
    required File? imageDelivaryId,
    required File? imageDrivingLicense,
  }) async {
    var response = await crud.addRequestWithImages(
      AppLink.delivaryEditProfileWorkInfoData,
      {
        "delivaryId": delivaryId,
        "typeVichele": typeVichele,
        "expertise": expertise,
      },
      imageVichele: imageVichele,
      imageDelivaryId: imageDelivaryId,
      imageDrivingLicense: imageDrivingLicense,
    );
    return response.fold((l) => l, (r) => r);
  }
}
