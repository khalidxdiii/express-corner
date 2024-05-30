class DelivaryInfoModel {
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
  int? delivaryProfileId;
  int? delivaryProfileDelivaryId;
  String? delivaryProfileTypeVichele;
  String? delivaryProfileExpertise;
  String? delivaryProfileImageVichele;
  String? delivaryProfileImageDelivaryId;
  String? delivaryProfileImageDrivingLicense;
  String? delivaryProfileTempImageVichele;
  String? delivaryProfileTempImageDelivaryId;
  String? delivaryProfileTempImageDrivingLicense;
  String? delivaryProfileIsWaitEditApprove;
  String? delivaryProfileLastEdit;
  String? delivaryStatus;
  String? averageRating;
  String? totalRatings;

  DelivaryInfoModel(
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
      this.usersCreate,
      this.delivaryProfileId,
      this.delivaryProfileDelivaryId,
      this.delivaryProfileTypeVichele,
      this.delivaryProfileExpertise,
      this.delivaryProfileImageVichele,
      this.delivaryProfileImageDelivaryId,
      this.delivaryProfileImageDrivingLicense,
      this.delivaryProfileTempImageVichele,
      this.delivaryProfileTempImageDelivaryId,
      this.delivaryProfileTempImageDrivingLicense,
      this.delivaryProfileIsWaitEditApprove,
      this.delivaryProfileLastEdit,
      this.delivaryStatus,
      this.averageRating,
      this.totalRatings});

  DelivaryInfoModel.fromJson(Map<String, dynamic> json) {
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
    delivaryProfileId = json['delivaryProfile_id'];
    delivaryProfileDelivaryId = json['delivaryProfile_delivaryId'];
    delivaryProfileTypeVichele = json['delivaryProfile_typeVichele'];
    delivaryProfileExpertise = json['delivaryProfile_expertise'];
    delivaryProfileImageVichele = json['delivaryProfile_imageVichele'];
    delivaryProfileImageDelivaryId = json['delivaryProfile_imageDelivaryId'];
    delivaryProfileImageDrivingLicense =
        json['delivaryProfile_imageDrivingLicense'];
    delivaryProfileTempImageVichele = json['delivaryProfile_tempImageVichele'];
    delivaryProfileTempImageDelivaryId =
        json['delivaryProfile_tempImageDelivaryId'];
    delivaryProfileTempImageDrivingLicense =
        json['delivaryProfile_tempImageDrivingLicense'];
    delivaryProfileIsWaitEditApprove =
        json['delivaryProfile_isWaitEditApprove'];
    delivaryProfileLastEdit = json['delivaryProfile_lastEdit'];
    delivaryStatus = json['delivaryStatus'];
    averageRating = json['averageRating'];
    totalRatings = json['totalRatings'];
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
    data['delivaryProfile_id'] = this.delivaryProfileId;
    data['delivaryProfile_delivaryId'] = this.delivaryProfileDelivaryId;
    data['delivaryProfile_typeVichele'] = this.delivaryProfileTypeVichele;
    data['delivaryProfile_expertise'] = this.delivaryProfileExpertise;
    data['delivaryProfile_imageVichele'] = this.delivaryProfileImageVichele;
    data['delivaryProfile_imageDelivaryId'] =
        this.delivaryProfileImageDelivaryId;
    data['delivaryProfile_imageDrivingLicense'] =
        this.delivaryProfileImageDrivingLicense;
    data['delivaryProfile_tempImageVichele'] =
        this.delivaryProfileTempImageVichele;
    data['delivaryProfile_tempImageDelivaryId'] =
        this.delivaryProfileTempImageDelivaryId;
    data['delivaryProfile_tempImageDrivingLicense'] =
        this.delivaryProfileTempImageDrivingLicense;
    data['delivaryProfile_isWaitEditApprove'] =
        this.delivaryProfileIsWaitEditApprove;
    data['delivaryProfile_lastEdit'] = this.delivaryProfileLastEdit;
    data['delivaryStatus'] = this.delivaryStatus;
    data['averageRating'] = this.averageRating;
    data['totalRatings'] = this.totalRatings;
    return data;
  }
}
