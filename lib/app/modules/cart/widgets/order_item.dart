import 'package:delivery_app/app/data/models/order.dart';
import 'package:delivery_app/app/global_widgets/amount_selector.dart';
import 'package:delivery_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderItem extends StatelessWidget {
  final OrderModel order;

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
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: (order.product.imgUrl != null)
                  ? Image.network(
                      order.product.imgUrl,
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/images/not-found.jpg',
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
            ),
            title: Text(
              order.product.title,
              style: GoogleFonts.catamaran(fontSize: 18),
            ),
            trailing: Text(
              controller.convertToMaskedText(order.value),
              style: GoogleFonts.markaziText(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'x ${order.amount.toString()}',
              style: GoogleFonts.markaziText(),
            ),
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
