class DelivaryLiveLocationModel {
  int? liveLocationId;
  int? liveLocationDelivaryId;
  String? liveLocationLat;
  String? liveLocationLong;

  DelivaryLiveLocationModel(
      {this.liveLocationId,
      this.liveLocationDelivaryId,
      this.liveLocationLat,
      this.liveLocationLong});

  DelivaryLiveLocationModel.fromJson(Map<String, dynamic> json) {
    liveLocationId = json['liveLocation_id'];
    liveLocationDelivaryId = json['liveLocation_delivaryId'];
    liveLocationLat = json['liveLocation_lat'];
    liveLocationLong = json['liveLocation_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['liveLocation_id'] = this.liveLocationId;
    data['liveLocation_delivaryId'] = this.liveLocationDelivaryId;
    data['liveLocation_lat'] = this.liveLocationLat;
    data['liveLocation_long'] = this.liveLocationLong;
    return data;
  }
}
