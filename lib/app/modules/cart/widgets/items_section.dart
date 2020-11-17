import 'package:delivery_app/app/modules/cart/widgets/order_item.dart';
import 'package:flutter/material.dart';

class ItemsSection extends StatelessWidget {
  // final List<Order> orderList; // Substituir por esse
  final List orderList;

  const ItemsSection({Key key, this.orderList}) : super(key: key);
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
          Column(
            children: orderList
                .map(
                  (order) => OrderItem(
                    order: order,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
