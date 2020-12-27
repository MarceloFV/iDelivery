import 'dart:convert';

import 'package:delivery_app/app/data/models/product.dart';
import 'package:delivery_app/app/data/models/store.dart';

class OrderModel {
  ProductModel product;
  int amount;
  String message;
  double value;
  StoreModel store;
  
  OrderModel({
    this.product,
    this.amount,
    this.message,
    this.value,
    this.store,
  });


  Map<String, dynamic> toMap() {
    return {
      'product': product?.toMap(),
      'amount': amount,
      'message': message,
      'value': value,
      'store': store?.toMap(),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return OrderModel(
      product: ProductModel.fromMap(map['product']),
      amount: map['amount'],
      message: map['message'],
      value: map['value'],
      store: StoreModel.fromMap(map['store']),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(json.decode(source));

  OrderModel copyWith({
    ProductModel product,
    int amount,
    String message,
    double value,
    StoreModel store,
  }) {
    return OrderModel(
      product: product ?? this.product,
      amount: amount ?? this.amount,
      message: message ?? this.message,
      value: value ?? this.value,
      store: store ?? this.store,
    );
  }


  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is OrderModel &&
      o.product == product &&
      o.amount == amount &&
      o.message == message &&
      o.value == value &&
      o.store == store;
  }

  @override
  int get hashCode {
    return product.hashCode ^
      amount.hashCode ^
      message.hashCode ^
      value.hashCode ^
      store.hashCode;
  }

  @override
  String toString() {
    return 'OrderModel(product: $product, amount: $amount, message: $message, value: $value, store: $store)';
  }
}
