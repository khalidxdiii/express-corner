import 'dart:io';

import '../../../../../../core/class/crud.dart';
import '../../../../../../linkapi.dart';

class DelivaryProfileData {
  Crud crud;
  DelivaryProfileData(this.crud);

  viewData({required String usersid}) async {
    var response = await crud.postData(AppLink.delivaryProfileView, {
      "deliveryid": usersid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  delivaryEditProfileData({required Map data, required File? file}) async {
    var response = await crud.addRequestWithImageOne(
        AppLink.delivaryProfileEdit, data, file);
    return response.fold((l) => l, (r) => r);
  }

  delivaryEditEmail(
      {required String userEmail, required String newEmail}) async {
    var response = await crud.postData(AppLink.delivaryProfileEditEmail, {
      "userEmail": userEmail,
      "newEmail": newEmail,
    });
    return response.fold((l) => l, (r) => r);
  }

  delivaryEditEmailVerifyCode(
      {required String userEmail,
      required String newEmail,
      required String verifyCode}) async {
    var response =
        await crud.postData(AppLink.delivaryProfileVerifyCodeAndEditEmail, {
      "userEmail": userEmail,
      "newEmail": newEmail,
      "verifycode": verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }

  delivaryEditEmailReSendCode(
      {required String userEmail, required String newEmail}) async {
    var response =
        await crud.postData(AppLink.delivaryProfileEditEmailReSendCode, {
      "userEmail": userEmail,
      "newEmail": newEmail,
    });
    return response.fold((l) => l, (r) => r);
  }

  delivaryEditPassword(
      {required String email,
      required String password,
      required String newPassword}) async {
    var response = await crud.postData(AppLink.delivaryProfileEditPassword, {
      "email": email,
      "password": password,
      "newPassword": newPassword,
    });
    return response.fold((l) => l, (r) => r);
  }
}
