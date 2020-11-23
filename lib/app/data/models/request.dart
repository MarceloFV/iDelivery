

import 'package:flutter/foundation.dart';

import 'package:delivery_app/app/data/models/order.dart';

class RequestModel {
  List<OrderModel> orders;
  String storeId;
  String userId;

  RequestModel({ this.orders, this.storeId, this.userId});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders'] = this.orders;
    data['storeId'] = this.storeId;
    data['userId'] = this.userId;
    return data;
  }

  RequestModel copyWith({
    List<OrderModel> orders,
    String storeId,
    String userId,
  }) {
    return RequestModel(
      orders: orders ?? this.orders,
      storeId: storeId ?? this.storeId,
      userId: userId ?? this.userId,
    );
  }


  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is RequestModel &&
      listEquals(o.orders, orders) &&
      o.storeId == storeId &&
      o.userId == userId;
  }

  @override
  int get hashCode => orders.hashCode ^ storeId.hashCode ^ userId.hashCode;
}
