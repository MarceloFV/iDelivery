import 'package:delivery_app/app/global_widgets/amount_selector.dart';
import 'package:delivery_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderItem extends StatelessWidget {
  final Order order;

  final controller = Get.find<CartController>();

  OrderItem({Key key, this.order}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        child: Theme(
          data: Theme.of(context).copyWith(accentColor: Colors.black),
          child: ExpansionTile(
            leading: Image.network(order.product.imgUrl),
            title: Text(
              order.product.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            trailing: Text(controller.convertToMaskedText(order.value)),
            subtitle: Text('x${order.amount.toString()}'),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 4, left: 12),
                    child: AmountSelector(
                      onAdd: () => controller.onAmountAddPressed(order),
                      onRemove: () => controller.onAmountRemovePressed(order),
                      amount: order.amount,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () => controller.onRemoveOrderPressed(order),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
