import 'package:delivery_app/app/global_widgets/custom_app_bar.dart';
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
      appBar: CustomAppBar(
        title: 'Seu carrinho está pronto',
        onBackPressed: controller.onBackPressed,
      ),
      body: _body(),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  _body() => ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          Obx(() => AdressSection(
                adress: controller.userAdress,
                onAdressPressed: controller.onAdressPressed,
              )),
          SizedBox(
            height: 24,
          ),
          ItemsSection(),
          SizedBox(
            height: 20,
          ),
        ],
      );

  _bottomNavBar() => Container(
        height: 130,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Obx(() => FinalValueSection(
                        frete: controller
                            .convertToMaskedText(controller.shipValue),
                        total: controller
                            .convertToMaskedText(controller.finalValue),
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  CustomBlueButton(
                    text: 'Confirmar pedido',
                    function: (){},
                    // function: controller.onConfirmOrderPressed,
                    //TODO: Implement confirmOrder
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
