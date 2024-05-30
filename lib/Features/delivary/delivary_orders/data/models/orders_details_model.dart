class OrdersDetailsModel {
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
  String? ordersitemdetails;
  String? orderslocationLatlng;

  String? ordersImages;

  OrdersDetailsModel(
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
      this.ordersitemdetails,
      this.orderslocationLatlng,
      this.ordersImages});

  OrdersDetailsModel.fromJson(Map<String, dynamic> json) {
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
    ordersitemdetails = json['ordersitemdetails'];
    orderslocationLatlng = json['orderslocation_latlng'];

    ordersImages = json['orders_images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = ordersId;
    data['orders_usersid'] = ordersUsersid;
    data['orders_delivaery'] = ordersDelivaery;
    data['orders_type'] = ordersType;
    data['orders_pricedelivary'] = ordersPricedelivary;
    data['orders_price'] = ordersPrice;
    data['orders_totalprice'] = ordersTotalprice;
    data['orders_status'] = ordersStatus;
    data['orders_notes'] = ordersNotes;
    data['orders_coupon'] = ordersCoupon;
    data['orders_paymentmethod'] = ordersPaymentmethod;
    data['orders_addressUserGov'] = ordersAddressUserGov;
    data['orders_addressUserCity'] = ordersAddressUserCity;
    data['orders_addressUserDetails'] = ordersAddressUserDetails;
    data['orders_addressUserType'] = ordersAddressUserType;
    data['orders_addressUserLat'] = ordersAddressUserLat;
    data['orders_addressUserLong'] = ordersAddressUserLong;
    data['orders_toAddressName'] = ordersToAddressName;
    data['orders_toAddressDetails'] = ordersToAddressDetails;
    data['orders_toAddressLat'] = ordersToAddressLat;
    data['orders_toAddressLong'] = ordersToAddressLong;
    data['orders_datetime'] = ordersDatetime;
    data['deliveryName'] = deliveryName;
    data['deliveryPhone'] = deliveryPhone;
    data['deliveryGov'] = deliveryGov;
    data['deliveryCity'] = deliveryCity;
    data['deliveryTypeVehicle'] = deliveryTypeVehicle;
    data['deliveryExpertise'] = deliveryExpertise;
    data['deliveryImage'] = deliveryImage;
    data['orderslocation_names'] = orderslocationNames;
    data['ordersitemdetails'] = ordersitemdetails;
    data['orderslocation_latlng'] = orderslocationLatlng;

    data['orders_images'] = ordersImages;
    return data;
  }
}
