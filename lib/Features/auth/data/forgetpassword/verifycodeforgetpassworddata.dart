import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class VerifyCodeForgetPasswordData {
  Crud crud;
  VerifyCodeForgetPasswordData(this.crud);

  postData({
    required String verifycode,
    required String email,
  }) async {
    var response = await crud.postData(AppLink.verifycodeforgetpassword, {
      "verifycode": verifycode,
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
