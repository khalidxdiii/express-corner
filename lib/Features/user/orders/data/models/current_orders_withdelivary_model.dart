class OrdersWithDelivaryModel {
  int? ordersId;
  int? ordersUsersid;
  String? ordersDelivaery;
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
  String? ordersToAddressDetails;
  String? ordersToAddressLat;
  String? ordersToAddressLong;
  String? ordersDatetime;
  String? deliveryName;
  String? deliveryPhone;
  String? deliveryGov;
  String? deliveryCity;
  String? deliveryTypeVehicle;
  String? deliveryExpertise;
  String? deliveryImage;
  String? orderslocationNames;
  String? orderslocationLatlng;
  String? ordersitemdetails;
  String? userRating;
  String? userComment;
  String? userIsRating;
  String? ordersImages;

  OrdersWithDelivaryModel(
      {this.ordersId,
      this.ordersUsersid,
      this.ordersDelivaery,
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
      this.ordersToAddressDetails,
      this.ordersToAddressLat,
      this.ordersToAddressLong,
      this.ordersDatetime,
      this.deliveryName,
      this.deliveryPhone,
      this.deliveryGov,
      this.deliveryCity,
      this.deliveryTypeVehicle,
      this.deliveryExpertise,
      this.deliveryImage,
      this.orderslocationNames,
      this.orderslocationLatlng,
      this.ordersitemdetails,
      this.userRating,
      this.userComment,
      this.userIsRating,
      this.ordersImages});

  OrdersWithDelivaryModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersDelivaery = json['orders_delivaery'];
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
    ordersToAddressDetails = json['orders_toAddressDetails'];
    ordersToAddressLat = json['orders_toAddressLat'];
    ordersToAddressLong = json['orders_toAddressLong'];
    ordersDatetime = json['orders_datetime'];
    deliveryName = json['deliveryName'];
    deliveryPhone = json['deliveryPhone'];
    deliveryGov = json['deliveryGov'];
    deliveryCity = json['deliveryCity'];
    deliveryTypeVehicle = json['deliveryTypeVehicle'];
    deliveryExpertise = json['deliveryExpertise'];
    deliveryImage = json['deliveryImage'];
    orderslocationNames = json['orderslocation_names'];
    orderslocationLatlng = json['orderslocation_latlng'];
    ordersitemdetails = json['ordersitemdetails'];
    userRating = json['userRating'] ?? "0.0";
    userComment = json['userComment'] ?? 'لم تضع تقييمك بعد !!';
    userIsRating = json['userIsRating'] ?? "0";
    ordersImages = json['orders_images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_usersid'] = this.ordersUsersid;
    data['orders_delivaery'] = this.ordersDelivaery;
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
    data['orders_toAddressDetails'] = this.ordersToAddressDetails;
    data['orders_toAddressLat'] = this.ordersToAddressLat;
    data['orders_toAddressLong'] = this.ordersToAddressLong;
    data['orders_datetime'] = this.ordersDatetime;
    data['deliveryName'] = this.deliveryName;
    data['deliveryPhone'] = this.deliveryPhone;
    data['deliveryGov'] = this.deliveryGov;
    data['deliveryCity'] = this.deliveryCity;
    data['deliveryTypeVehicle'] = this.deliveryTypeVehicle;
    data['deliveryExpertise'] = this.deliveryExpertise;
    data['deliveryImage'] = this.deliveryImage;
    data['orderslocation_names'] = this.orderslocationNames;
    data['orderslocation_latlng'] = this.orderslocationLatlng;
    data['ordersitemdetails'] = this.ordersitemdetails;
    data['userRating'] = this.userRating;
    data['userComment'] = this.userComment;
    data["userIsRating"] = this.userIsRating;
    data['orders_images'] = this.ordersImages;
    return data;
  }
}
