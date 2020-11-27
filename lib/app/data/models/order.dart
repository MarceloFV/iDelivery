
import 'dart:convert';

import 'package:delivery_app/app/data/models/product.dart';

class OrderModel {
  ProductModel product;
  int amount;
  String message;
  double value;

  OrderModel({this.product, this.amount, this.message, this.value});

  OrderModel copyWith({
    ProductModel product,
    int amount,
    String message,
    double value,
  }) {
    return OrderModel(
      product: product ?? this.product,
      amount: amount ?? this.amount,
      message: message ?? this.message,
      value: value ?? this.value,
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is OrderModel &&
      o.amount == amount &&
      o.product == product &&
      o.message == message &&
      o.value == value;
  }

  @override
  int get hashCode {
    return amount.hashCode ^
      product.hashCode ^
      message.hashCode ^
      value.hashCode;
  }

  Map<String, dynamic> toMap() {
    return {
      'product': product?.toMap(),
      'amount': amount,
      'message': message,
      'value': value,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return OrderModel(
      product: ProductModel.fromMap(map['product']),
      amount: map['amount'],
      message: map['message'],
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(json.decode(source));
}
