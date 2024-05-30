class DelivaryAcceptedOrdersModel {
  int? delivaryAcceptedOrdersId;
  int? delivaryAcceptedOrdersDelivaryId;
  int? delivaryAcceptedOrdersOrderId;
  String? delivaryAcceptedOrdersDelivaryApprove;

  DelivaryAcceptedOrdersModel(
      {this.delivaryAcceptedOrdersId,
      this.delivaryAcceptedOrdersDelivaryId,
      this.delivaryAcceptedOrdersOrderId,
      this.delivaryAcceptedOrdersDelivaryApprove});

  DelivaryAcceptedOrdersModel.fromJson(Map<String, dynamic> json) {
    delivaryAcceptedOrdersId = json['delivaryAcceptedOrders_id'];
    delivaryAcceptedOrdersDelivaryId =
        json['delivaryAcceptedOrders_delivaryId'];
    delivaryAcceptedOrdersOrderId = json['delivaryAcceptedOrders_orderId'];
    delivaryAcceptedOrdersDelivaryApprove =
        json['delivaryAcceptedOrders_delivaryApprove'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['delivaryAcceptedOrders_id'] = this.delivaryAcceptedOrdersId;
    data['delivaryAcceptedOrders_delivaryId'] =
        this.delivaryAcceptedOrdersDelivaryId;
    data['delivaryAcceptedOrders_orderId'] = this.delivaryAcceptedOrdersOrderId;
    data['delivaryAcceptedOrders_delivaryApprove'] =
        this.delivaryAcceptedOrdersDelivaryApprove;
    return data;
  }
}
