import 'package:delivery_app/app/data/models/order.dart';

class RequestModel {
  List<OrderModel> orders;
  String storeId;
  String userId;

  RequestModel({ this.orders, this.storeId, this.userId});

  RequestModel.fromJson(Map<String, dynamic> json) {
    this.orders = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order'] = this.orders;
    data['storeId'] = this.storeId;
    data['userId'] = this.userId;
    return data;
  }
}
