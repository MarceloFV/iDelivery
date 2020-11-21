import 'package:delivery_app/app/data/models/product.dart';
import 'package:delivery_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:delivery_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  ProductModel product;
  TextEditingController messageTextController = TextEditingController();

  final _amount = 1.obs;

  int get amount => _amount.value;

  @override
  void onInit() {
    product = Get.arguments['product'];
    super.onInit();
  }

  void onAmountAddPressed() => _amount.value++;

  void onAmountRemovePressed() {
    if (_amount.value > 1) _amount.value--;
  }

  void onAddPressed() {
    Get.snackbar(
      'Sucesso!',
      'Produto adicionado ao carrinho',
      backgroundColor: Colors.blue,
      snackPosition: SnackPosition.BOTTOM,
      dismissDirection: SnackDismissDirection.HORIZONTAL,
    );
    var cartController;
    if (Get.isRegistered<CartController>())
      cartController = Get.find<CartController>();
    else
      cartController = Get.put(CartController(), permanent: true);
    cartController.addProductToCart(
        product, messageTextController.text, amount);
  }

  void onCartPressed() {
    Get.toNamed(Routes.CART);
  }

  void onBackPressed() {
    Get.back();
  }

  String fetchMaskedProductValue() {
    final _moneyTextController =
        new MoneyMaskedTextController(leftSymbol: 'R\$ ');
    _moneyTextController.updateValue(product.value);
    return _moneyTextController.text;
  }
}
