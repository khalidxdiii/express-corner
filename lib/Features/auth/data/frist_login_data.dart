import 'dart:io';

import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class FirstLoginData {
  Crud crud;
  FirstLoginData(this.crud);

  userUpdateType({
    required String email,
    required String userType,
  }) async {
    var response = await crud.postData(AppLink.firstLoginUser, {
      "email": email,
      "userType": userType,
    });
    return response.fold((l) => l, (r) => r);
  }

  delivaryUpdateType({
    required String email,
    required String userType,
    required String typeVichele,
    required String expertise,
    required File imageVichele,
    required File imageDelivaryId,
    required File imageDrivingLicense,
  }) async {
    var response = await crud.addRequestWithImages(
      AppLink.firstLoginDelivary,
      {
        "email": email,
        "userType": userType,
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
