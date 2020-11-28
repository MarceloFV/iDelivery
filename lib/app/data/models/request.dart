import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:delivery_app/app/data/models/order.dart';

class RequestModel {
  List<OrderModel> orders;
  String storeId;
  String userId;
  // Address userAdress;
  // String userName; //TODO: Implement adress

  RequestModel({this.orders, this.storeId, this.userId});

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is RequestModel &&
        listEquals(o.orders, orders) &&
        o.storeId == storeId &&
        o.userId == userId;
    // o.userAdress == userAdress &&
    // o.userName == userName;
  }

  @override
  int get hashCode {
    return orders.hashCode ^ storeId.hashCode ^ userId.hashCode;
    // userAdress.hashCode ^
    // userName.hashCode;
  }

  Map<String, dynamic> toMap() {
    return {
      'orders': orders?.map((x) => x?.toMap())?.toList(),
      'storeId': storeId,
      'userId': userId,
      // 'userAdress': userAdress?.toMap(),
      // 'userName': userName,
    };
  }

  factory RequestModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return RequestModel(
      orders: List<OrderModel>.from(
          map['orders']?.map((x) => OrderModel.fromMap(x))),
      storeId: map['storeId'],
      userId: map['userId'],
      // userAdress: Address.fromMap(map['userAdress']),
      // userName: map['userName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestModel.fromJson(String source) =>
      RequestModel.fromMap(json.decode(source));
}
