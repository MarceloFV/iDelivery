import 'package:delivery_app/app/data/models/product.dart';
import 'package:delivery_app/app/data/models/user.dart';
import 'package:delivery_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:delivery_app/app/routes/app_pages.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  ProductModel product;
  UserModel user;

  final _amount = 1.obs;

  int get amount => _amount.value;

  @override
  void onInit() {
    product = Get.arguments['product'];
    user = Get.arguments['user'];
    super.onInit();
  }

  void onAmountAddPressed() => _amount.value++;

  void onAmountRemovePressed() {
    if (_amount.value > 1) _amount.value--;
  }

  void onAddPressed() {
    CartController cartController;
    if (Get.isRegistered<CartController>())
      cartController = Get.find<CartController>();
    else
      cartController = Get.put(CartController(), permanent: true);
    cartController.addProductToCart(product, amount);
  }

  void onCartPressed() {
    Get.toNamed(Routes.CART, arguments: {'user': user});
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
