import 'package:delivery_app/app/data/models/product.dart';
import 'package:delivery_app/app/modules/layout/controllers/layout_cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductTile extends GetView<LCartController> {
  final ProductModel product;

  ProductTile({this.product});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(product.title ?? 'title'),
        subtitle: Text(product.description ?? "Desc"),
        trailing: Text(product.value.toString() ?? '30'),
        onTap: () => controller.onProductPressed(product),
      ),
    );
  }
}
