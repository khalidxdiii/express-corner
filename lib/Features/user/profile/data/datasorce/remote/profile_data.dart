import 'dart:io';

import '../../../../../../core/class/crud.dart';
import '../../../../../../linkapi.dart';

class ProfileData {
  Crud crud;
  ProfileData(this.crud);

  viewData({required String usersid}) async {
    var response = await crud.postData(AppLink.profileView, {
      "usersid": usersid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  editData({required Map data, required File? file}) async {
    var response =
        await crud.addRequestWithImageOne(AppLink.profileEdit, data, file);
    return response.fold((l) => l, (r) => r);
  }

  editEmail({required String userEmail, required String newEmail}) async {
    var response = await crud.postData(AppLink.profileEditEmail, {
      "userEmail": userEmail,
      "newEmail": newEmail,
    });
    return response.fold((l) => l, (r) => r);
  }

  editEmailVerifyCode(
      {required String userEmail,
      required String newEmail,
      required String verifyCode}) async {
    var response = await crud.postData(AppLink.profileVerifyCodeAndEditEmail, {
      "userEmail": userEmail,
      "newEmail": newEmail,
      "verifycode": verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }

  editEmailReSendCode(
      {required String userEmail, required String newEmail}) async {
    var response = await crud.postData(AppLink.profileEditEmailReSendCode, {
      "userEmail": userEmail,
      "newEmail": newEmail,
    });
    return response.fold((l) => l, (r) => r);
  }

  editPassword(
      {required String email,
      required String password,
      required String newPassword}) async {
    var response = await crud.postData(AppLink.profileEditPassword, {
      "email": email,
      "password": password,
      "newPassword": newPassword,
    });
    return response.fold((l) => l, (r) => r);
  }
}
