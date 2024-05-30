class DelivaryRejectOrdersModel {
  int? rejectOrdersId;
  int? rejectOrdersOrderId;
  int? rejectOrdersDelivaryId;

  DelivaryRejectOrdersModel(
      {this.rejectOrdersId,
      this.rejectOrdersOrderId,
      this.rejectOrdersDelivaryId});

  DelivaryRejectOrdersModel.fromJson(Map<String, dynamic> json) {
    rejectOrdersId = json['rejectOrders_id'];
    rejectOrdersOrderId = json['rejectOrders_orderId'];
    rejectOrdersDelivaryId = json['rejectOrders_delivaryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rejectOrders_id'] = this.rejectOrdersId;
    data['rejectOrders_orderId'] = this.rejectOrdersOrderId;
    data['rejectOrders_delivaryId'] = this.rejectOrdersDelivaryId;
    return data;
  }
}
