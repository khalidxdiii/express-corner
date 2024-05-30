class UsersModel {
  int? usersId;
  String? usersName;
  String? usersPassword;
  String? usersEmail;
  String? usersPhone;
  String? usersAge;
  String? usersGender;
  String? usersGov;
  String? usersCity;
  String? usersSecretqustion;
  String? usersVerifycode;
  String? usersApprove;
  String? usersType;
  String? usersImage;
  String? usersCreate;

  UsersModel(
      {this.usersId,
      this.usersName,
      this.usersPassword,
      this.usersEmail,
      this.usersPhone,
      this.usersAge,
      this.usersGender,
      this.usersGov,
      this.usersCity,
      this.usersSecretqustion,
      this.usersVerifycode,
      this.usersApprove,
      this.usersType,
      this.usersImage,
      this.usersCreate});

  UsersModel.fromJson(Map<String, dynamic> json) {
    usersId = json['users_id'];
    usersName = json['users_name'];
    usersPassword = json['users_password'];
    usersEmail = json['users_email'];
    usersPhone = json['users_phone'];
    usersAge = json['users_age'];
    usersGender = json['users_gender'];
    usersGov = json['users_gov'];
    usersCity = json['users_city'];
    usersSecretqustion = json['users_secretqustion'];
    usersVerifycode = json['users_verifycode'];
    usersApprove = json['users_approve'];
    usersType = json['users_type'];
    usersImage = json['users_image'];
    usersCreate = json['users_create'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['users_id'] = this.usersId;
    data['users_name'] = this.usersName;
    data['users_password'] = this.usersPassword;
    data['users_email'] = this.usersEmail;
    data['users_phone'] = this.usersPhone;
    data['users_age'] = this.usersAge;
    data['users_gender'] = this.usersGender;
    data['users_gov'] = this.usersGov;
    data['users_city'] = this.usersCity;
    data['users_secretqustion'] = this.usersSecretqustion;
    data['users_verifycode'] = this.usersVerifycode;
    data['users_approve'] = this.usersApprove;
    data['users_type'] = this.usersType;
    data['users_image'] = this.usersImage;
    data['users_create'] = this.usersCreate;
    return data;
  }
}
