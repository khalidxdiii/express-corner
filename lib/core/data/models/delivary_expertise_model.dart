class DelivaryExpertiseModel {
  int? delivaryExpertiseId;
  String? delivaryExpertiseName;

  DelivaryExpertiseModel(
      {this.delivaryExpertiseId, this.delivaryExpertiseName});

  DelivaryExpertiseModel.fromJson(Map<String, dynamic> json) {
    delivaryExpertiseId = json['delivaryExpertise_id'];
    delivaryExpertiseName = json['delivaryExpertise_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['delivaryExpertise_id'] = this.delivaryExpertiseId;
    data['delivaryExpertise_name'] = this.delivaryExpertiseName;
    return data;
  }
}
