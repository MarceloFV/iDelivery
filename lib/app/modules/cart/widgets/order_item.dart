import 'package:delivery_app/app/global_widgets/amount_selector.dart';
import 'package:delivery_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderItem extends StatelessWidget {
  // final Order order;
  final Order order;

  final controller = Get.find<CartController>();

   OrderItem({Key key, this.order}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        child: ExpansionTile(
          leading: Image.network(order.product.imgUrl),
          title: Text(
            order.product.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          trailing: Text(order.value.toString()),
          subtitle: Text(order.amount.toString()),
          children: [
            AmountSelector(
              onAdd: controller.onAmountAddPressed,
              onRemove: () => controller.searchOrderIndex(order),
              amount: order.amount,
            )
          ],
        ),
      ),
    );
  }
}
