class MyFavoriteModel {
  int? favoriteId;
  int? favoriteUsersid;
  String? favoritePlaceid;
  String? favoriteType;

  MyFavoriteModel({
    this.favoriteId,
    this.favoriteUsersid,
    this.favoritePlaceid,
    this.favoriteType,
  });

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteUsersid = json['favorite_usersid'];
    favoritePlaceid = json['favorite_placeid'];
    favoriteType = json['favorite_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_id'] = this.favoriteId;
    data['favorite_usersid'] = this.favoriteUsersid;
    data['favorite_placeid'] = this.favoritePlaceid;
    data['favorite_type'] = this.favoriteType;
    return data;
  }
}
