class GovModel {
  int? governmentId;
  String? governmentName;

  GovModel({this.governmentId, this.governmentName});

  GovModel.fromJson(Map<String, dynamic> json) {
    governmentId = json['government_id'];
    governmentName = json['government_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['government_id'] = this.governmentId;
    data['government_name'] = this.governmentName;
    return data;
  }
}
