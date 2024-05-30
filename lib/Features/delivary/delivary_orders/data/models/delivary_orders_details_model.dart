class DelivaryOrdersDetailsModel {
  int? ordersId;
  int? ordersUsersid;
  String? ordersDelivaery;
  String? ordersPlaceid;
  int? ordersType;
  int? ordersPricedelivary;
  int? ordersPrice;
  int? ordersTotalprice;
  int? ordersStatus;
  String? ordersNotes;
  int? ordersCoupon;
  int? ordersPaymentmethod;
  String? ordersAddressUserGov;
  String? ordersAddressUserCity;
  String? ordersAddressUserDetails;
  String? ordersAddressUserType;
  String? ordersAddressUserLat;
  String? ordersAddressUserLong;
  String? ordersToAddressName;
  String? ordersDatetime;
  String? userName;
  String? userPhone;
  String? userGov;
  String? userCity;
  String? userImage;
  String? orderslocationNames;
  String? orderslocationLatlng;
  String? ordersitemdetails;
  String? ordersImages;
  String? userRating;
  String? userComment;
  String? userIsRating;

  DelivaryOrdersDetailsModel(
      {this.ordersId,
      this.ordersUsersid,
      this.ordersDelivaery,
      this.ordersPlaceid,
      this.ordersType,
      this.ordersPricedelivary,
      this.ordersPrice,
      this.ordersTotalprice,
      this.ordersStatus,
      this.ordersNotes,
      this.ordersCoupon,
      this.ordersPaymentmethod,
      this.ordersAddressUserGov,
      this.ordersAddressUserCity,
      this.ordersAddressUserDetails,
      this.ordersAddressUserType,
      this.ordersAddressUserLat,
      this.ordersAddressUserLong,
      this.ordersToAddressName,
      this.ordersDatetime,
      this.userName,
      this.userPhone,
      this.userGov,
      this.userCity,
      this.userImage,
      this.orderslocationNames,
      this.orderslocationLatlng,
      this.ordersitemdetails,
      this.ordersImages,
      this.userRating,
      this.userComment,
      this.userIsRating});

  DelivaryOrdersDetailsModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersDelivaery = json['orders_delivaery'];
    ordersPlaceid = json['orders_placeid'];
    ordersType = json['orders_type'];
    ordersPricedelivary = json['orders_pricedelivary'];
    ordersPrice = json['orders_price'];
    ordersTotalprice = json['orders_totalprice'];
    ordersStatus = json['orders_status'];
    ordersNotes = json['orders_notes'];
    ordersCoupon = json['orders_coupon'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersAddressUserGov = json['orders_addressUserGov'];
    ordersAddressUserCity = json['orders_addressUserCity'];
    ordersAddressUserDetails = json['orders_addressUserDetails'];
    ordersAddressUserType = json['orders_addressUserType'];
    ordersAddressUserLat = json['orders_addressUserLat'];
    ordersAddressUserLong = json['orders_addressUserLong'];
    ordersToAddressName = json['orders_toAddressName'];
    ordersDatetime = json['orders_datetime'];
    userName = json['userName'];
    userPhone = json['userPhone'];
    userGov = json['userGov'];
    userCity = json['userCity'];
    userImage = json['userImage'];
    orderslocationNames = json['orderslocation_names'];
    orderslocationLatlng = json['orderslocation_latlng'];
    ordersitemdetails = json['ordersitemdetails'];
    ordersImages = json['orders_images'];
    userRating = json['userRating'] ?? "0.0";
    userComment = json['userComment'] ?? "لم يتم التقييم بعد من قبل المستخدم";
    userIsRating = json['userIsRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_usersid'] = this.ordersUsersid;
    data['orders_delivaery'] = this.ordersDelivaery;
    data['orders_placeid'] = this.ordersPlaceid;
    data['orders_type'] = this.ordersType;
    data['orders_pricedelivary'] = this.ordersPricedelivary;
    data['orders_price'] = this.ordersPrice;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_status'] = this.ordersStatus;
    data['orders_notes'] = this.ordersNotes;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_paymentmethod'] = this.ordersPaymentmethod;
    data['orders_addressUserGov'] = this.ordersAddressUserGov;
    data['orders_addressUserCity'] = this.ordersAddressUserCity;
    data['orders_addressUserDetails'] = this.ordersAddressUserDetails;
    data['orders_addressUserType'] = this.ordersAddressUserType;
    data['orders_addressUserLat'] = this.ordersAddressUserLat;
    data['orders_addressUserLong'] = this.ordersAddressUserLong;
    data['orders_toAddressName'] = this.ordersToAddressName;
    data['orders_datetime'] = this.ordersDatetime;
    data['userName'] = this.userName;
    data['userPhone'] = this.userPhone;
    data['userGov'] = this.userGov;
    data['userCity'] = this.userCity;
    data['userImage'] = this.userImage;
    data['orderslocation_names'] = this.orderslocationNames;
    data['orderslocation_latlng'] = this.orderslocationLatlng;
    data['ordersitemdetails'] = this.ordersitemdetails;
    data['orders_images'] = this.ordersImages;
    data['userRating'] = this.userRating;
    data['userComment'] = this.userComment;
    data['userIsRating'] = this.userIsRating;
    return data;
  }
}
