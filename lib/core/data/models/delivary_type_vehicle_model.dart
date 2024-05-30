class DelivaryTypeVehicleModel {
  int? delivaryTypeVehicleId;
  String? delivaryTypeVehicleName;

  DelivaryTypeVehicleModel(
      {this.delivaryTypeVehicleId, this.delivaryTypeVehicleName});

  DelivaryTypeVehicleModel.fromJson(Map<String, dynamic> json) {
    delivaryTypeVehicleId = json['delivaryTypeVehicle_id'];
    delivaryTypeVehicleName = json['delivaryTypeVehicle_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['delivaryTypeVehicle_id'] = this.delivaryTypeVehicleId;
    data['delivaryTypeVehicle_name'] = this.delivaryTypeVehicleName;
    return data;
  }
}