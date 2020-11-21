import 'package:delivery_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:delivery_app/app/modules/cart/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsSection extends StatelessWidget {
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Seu pedido'),
          SizedBox(
            height: 16,
          ),
          Obx(() => Column(
                children: controller.orderList
                    .map(
                      (order) => OrderItem(
                        order: order,
                      ),
                    )
                    .toList(),
              )),
        ],
      ),
    );
  }
}
