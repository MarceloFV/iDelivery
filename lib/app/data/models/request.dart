import 'dart:convert';

import 'package:delivery_app/app/data/models/address.dart';
import 'package:delivery_app/app/data/models/order.dart';
import 'package:delivery_app/app/data/models/product.dart';

class RequestModel {
  List<OrderModel> orders;
  RequestUserModel user;

  RequestModel({
    this.orders,
    this.user,
  });

  Map<String, dynamic> toMap() {
    return {
      'orders': orders?.map((x) => x?.toMap())?.toList(),
      'user': user?.toMap(),
    };
  }

  factory RequestModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return RequestModel(
      orders: List<OrderModel>.from(
          map['orders']?.map((x) => OrderModel.fromMap(x))),
      user: RequestUserModel.fromMap(map['user']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestModel.fromJson(String source) =>
      RequestModel.fromMap(json.decode(source));
}

class RequestUserModel {
  final String name;
  final String phone;
  final AddressModel address;

  RequestUserModel({
    this.name,
    this.phone,
    this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'address': address?.toMap(),
    };
  }

  factory RequestUserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return RequestUserModel(
      name: map['name'],
      phone: map['phone'],
      address: AddressModel.fromMap(map['address']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestUserModel.fromJson(String source) =>
      RequestUserModel.fromMap(json.decode(source));
}

class RequestOrderModel {
  ProductModel product;
  int amount;
  String message;
  double value;
  
  RequestOrderModel({
    this.product,
    this.amount,
    this.message,
    this.value,
  });
  
}
