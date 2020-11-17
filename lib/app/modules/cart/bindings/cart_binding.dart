import 'package:get/get.dart';

import 'package:delivery_app/app/modules/cart/controllers/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    if (Get.isRegistered<CartController>())
      Get.find<CartController>();
    else
      Get.put(CartController(), permanent: true);
  }
}
