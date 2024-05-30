class GenderModel {
  int? genderId;
  String? genderType;

  GenderModel({this.genderId, this.genderType});

  GenderModel.fromJson(Map<String, dynamic> json) {
    genderId = json['gender_id'];
    genderType = json['gender_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gender_id'] = this.genderId;
    data['gender_type'] = this.genderType;
    return data;
  }
}
