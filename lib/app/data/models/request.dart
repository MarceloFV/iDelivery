

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:delivery_app/app/data/models/order.dart';

class RequestModel {
  List<OrderModel> orders;
  String storeId;
  String userId;

  RequestModel({ this.orders, this.storeId, this.userId});



  Map<String, dynamic> toMap() {
    return {
      'orders': orders?.map((x) => x?.toMap())?.toList(),
      'storeId': storeId,
      'userId': userId,
    };
  }

  factory RequestModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return RequestModel(
      orders: List<OrderModel>.from(map['orders']?.map((x) => OrderModel.fromMap(x))),
      storeId: map['storeId'],
      userId: map['userId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestModel.fromJson(String source) => RequestModel.fromMap(json.decode(source));
}
