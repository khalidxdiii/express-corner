class CityModel {
  int? governmentId;
  String? governmentName;
  String? cityName;

  CityModel({this.governmentId, this.governmentName, this.cityName});

  CityModel.fromJson(Map<String, dynamic> json) {
    governmentId = json['government_id'];
    governmentName = json['government_name'];
    cityName = json['city_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['government_id'] = this.governmentId;
    data['government_name'] = this.governmentName;
    data['city_name'] = this.cityName;
    return data;
  }
}
