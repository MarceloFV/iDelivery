
import 'package:delivery_app/app/data/models/product.dart';

class OrderModel {
  int amount;
  ProductModel product;
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
}
