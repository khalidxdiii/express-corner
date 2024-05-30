class AddressModel {
  String? addressId;
  String? addressUsersid;
  String? addressGov;
  String? addressCity;
  String? addressDetails;
  String? addressType;
  String? addressLat;
  String? addressLong;

  AddressModel(
      {this.addressId,
      this.addressUsersid,
      this.addressGov,
      this.addressCity,
      this.addressDetails,
      this.addressType,
      this.addressLat,
      this.addressLong});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'].toString();
    addressUsersid = json['address_usersid'];
    addressGov = json['address_gov'];
    addressCity = json['address_city'];
    addressDetails = json['address_details'];
    addressType = json['address_type'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['address_usersid'] = this.addressUsersid;
    data['address_gov'] = this.addressGov;
    data['address_city'] = this.addressCity;
    data['address_details'] = this.addressDetails;
    data['address_type'] = this.addressType;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    return data;
  }
}
