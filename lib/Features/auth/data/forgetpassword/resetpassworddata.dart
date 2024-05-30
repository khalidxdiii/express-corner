import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);

  postData({
    required String password,
    required String email,
  }) async {
    var response = await crud.postData(AppLink.resetpassword, {
      "password": password,
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
