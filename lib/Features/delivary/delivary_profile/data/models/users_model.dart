class UsersModel {
  int usersId;
  String usersName;
  String usersPassword;
  String usersEmail;
  String usersPhone;
  String usersAge;
  String usersGender;
  String usersGov;
  String usersCity;
  String usersSecretQuestion;
  String usersVerifyCode;
  String usersApprove;
  String usersType;
  String usersCreate;
  String? usersImage;

  UsersModel({
    required this.usersId,
    required this.usersName,
    required this.usersPassword,
    required this.usersEmail,
    required this.usersPhone,
    required this.usersAge,
    required this.usersGender,
    required this.usersGov,
    required this.usersCity,
    required this.usersSecretQuestion,
    required this.usersVerifyCode,
    required this.usersApprove,
    required this.usersType,
    required this.usersCreate,
    required this.usersImage,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      usersId: json['users_id'],
      usersName: json['users_name'],
      usersPassword: json['users_password'],
      usersEmail: json['users_email'],
      usersPhone: json['users_phone'],
      usersAge: json['users_age'],
      usersGender: json['users_gender'],
      usersGov: json['users_gov'],
      usersCity: json['users_city'],
      usersSecretQuestion: json['users_secretqustion'],
      usersVerifyCode: json['users_verifycode'],
      usersApprove: json['users_approve'],
      usersType: json['users_type'],
      usersCreate: json['users_create'],
      usersImage: json['users_image'] ?? "empty",
    );
  }
}
