import '../../../../../../core/class/crud.dart';
import '../../../../../../linkapi.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);

  getData({required String usersid}) async {
    var response =
        await crud.postData(AppLink.notification, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  readNorification({required String usersid, required String notificationID}) async {
    var response = await crud.postData(AppLink.notificationRead, {
      "usersid": usersid,
      "notificationID": notificationID,
    });
    return response.fold((l) => l, (r) => r);
  }
}
