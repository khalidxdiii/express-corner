class DelivaryRatingsModel {
  String? userName;
  String? userCity;
  String? userGov;
  String? userImage;
  int? ratingId;
  int? ratingOrderid;
  int? ratingUserid;
  int? ratingDelivaryid;
  String? ratingUserRating;
  String? ratingComment;
  String? ratingIsRating;

  DelivaryRatingsModel(
      {this.userName,
      this.userCity,
      this.userGov,
      this.userImage,
      this.ratingId,
      this.ratingOrderid,
      this.ratingUserid,
      this.ratingDelivaryid,
      this.ratingUserRating,
      this.ratingComment,
      this.ratingIsRating});

  DelivaryRatingsModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    userCity = json['userCity'];
    userGov = json['userGov'];
    userImage = json['userImage'];
    ratingId = json['rating_id'];
    ratingOrderid = json['rating_orderid'];
    ratingUserid = json['rating_userid'];
    ratingDelivaryid = json['rating_delivaryid'];
    ratingUserRating = json['rating_userRating'];
    ratingComment = json['rating_comment'];
    ratingIsRating = json['rating_isRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['userCity'] = this.userCity;
    data['userGov'] = this.userGov;
    data['userImage'] = this.userImage;
    data['rating_id'] = this.ratingId;
    data['rating_orderid'] = this.ratingOrderid;
    data['rating_userid'] = this.ratingUserid;
    data['rating_delivaryid'] = this.ratingDelivaryid;
    data['rating_userRating'] = this.ratingUserRating;
    data['rating_comment'] = this.ratingComment;
    data['rating_isRating'] = this.ratingIsRating;
    return data;
  }
}
