import 'package:delivery_app/app/global_widgets/custom_blue_button.dart';
import 'package:delivery_app/app/modules/cart/widgets/adress_section.dart';
import 'package:delivery_app/app/modules/cart/widgets/items_section.dart';
import 'package:delivery_app/app/modules/cart/widgets/final_value_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app/app/modules/cart/controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavBar(),
      appBar: _appBar(),
      body: _body(),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        'Seu carrinho está pronto',
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
      leading: IconButton(
        onPressed: () => controller.onBackPressed(),
        icon: Icon(Icons.arrow_back_ios),
        color: Colors.black,
        iconSize: 12,
      ),
    );
  }

  _body() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 24),
      children: [
        AdressSection(
          adress: controller.getUserCurrentAdress(),
        ),
        SizedBox(
          height: 24,
        ),
        ItemsSection(),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  _bottomNavBar() {
    return Container(
      height: 130,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FinalValueSection(
                  frete: controller.convertToMaskedText(controller.shipValue),
                  total: controller.convertToMaskedText(controller.finalValue),
                ),
                SizedBox(
                  height: 25,
                ),
                CustomBlueButton(
                  text: 'Confirmar pedido',
                  function: controller.onConfirmOrderPressed,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
