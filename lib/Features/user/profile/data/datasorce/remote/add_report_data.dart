import '../../../../../../core/class/crud.dart';
import '../../../../../../linkapi.dart';

class AddReportData {
  Crud crud;
  AddReportData(this.crud);

  addReport({
    required String userId,
    required String username,
    required String email,
    required String phone,
    required String gov,
    required String city,
    required String subject,
  }) async {
    var response = await crud.postData(AppLink.reportAdd, {
      "id": userId,
      "username": username,
      "email": email,
      "phone": phone,
      "gov": gov,
      "city": city,
      "subject": subject,
    });
    return response.fold((l) => l, (r) => r);
  }
}
