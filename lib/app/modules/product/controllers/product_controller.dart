import 'package:delivery_app/app/data/models/product.dart';
import 'package:delivery_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:delivery_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  ProductModel product;

  final _amount = 1.obs;

  int get amount => _amount.value;

  @override
  void onInit() {
    product = Get.arguments['product'];
    super.onInit();
  }

  void onAddPressed() {
    CartController cartController;
    if (Get.isRegistered<CartController>())
      cartController = Get.find<CartController>();
    else
      cartController = Get.put(CartController(), permanent: true);
    cartController.createOrder(product, amount);
  }

  void onCartPressed() {
    Get.toNamed(Routes.CART);
  }

  void onBackPressed() {
    Get.back();
  }

  void onAmountAddPressed() => _amount.value++;

  void onAmountRemovePressed() {
    if (_amount.value > 0) _amount.value--;
  }
}
