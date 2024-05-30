class NotificationModel {
  int? notificationId;
  int? notificationUsersid;
  String? notificationTitle;
  String? notificationBody;
  String? notificationData;
  String? notificationType;
  int? notificationIsread;
  String? notificationDatetime;

  NotificationModel(
      {this.notificationId,
      this.notificationUsersid,
      this.notificationTitle,
      this.notificationBody,
      this.notificationData,
      this.notificationType,
      this.notificationIsread,
      this.notificationDatetime});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    notificationUsersid = json['notification_usersid'];
    notificationTitle = json['notification_title'];
    notificationBody = json['notification_body'];
    notificationData = json['notification_data'];
    notificationType = json['notification_type'];
    notificationIsread = json['notification_isread'];
    notificationDatetime = json['notification_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notification_id'] = this.notificationId;
    data['notification_usersid'] = this.notificationUsersid;
    data['notification_title'] = this.notificationTitle;
    data['notification_body'] = this.notificationBody;
    data['notification_data'] = this.notificationData;
    data['notification_type'] = this.notificationType;
    data['notification_isread'] = this.notificationIsread;
    data['notification_datetime'] = this.notificationDatetime;
    return data;
  }
}
