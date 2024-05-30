import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class SignUpVerifyCodeData {
  Crud crud;
  SignUpVerifyCodeData(this.crud);

  postData({required String email, required String verifyCode}) async {
    var response = await crud.postData(AppLink.signUpVerifyCode, {
      "email": email,
      "verifycode": verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }

  resendData({required String email}) async {
    var response =
        await crud.postData(AppLink.resendVerifyCode, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}
