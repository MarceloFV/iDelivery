import 'package:delivery_app/app/modules/layout/controllers/layout_cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends GetView<LCartController> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
        () => Text(
          controller.productLenght.toString(),
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
