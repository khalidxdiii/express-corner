import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);

  postData({
    required String username,
    required String password,
    required String email,
    required String phone,
    required String age,
    required String gender,
    required String gov,
    required String city,
    required String secretqustion,
  }) async {
    var response = await crud.postData(AppLink.signUp, {
      "username": username,
      "password": password,
      "email": email,
      "phone": phone,
      "age": age,
      "gender": gender,
      "gov": gov,
      "city": city,
      "secretqustion": secretqustion,
    });
    return response.fold((l) => l, (r) => r);
  }
}
