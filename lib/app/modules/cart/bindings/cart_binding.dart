import 'package:get/get.dart';

import 'package:delivery_app/app/modules/cart/controllers/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(
      () => CartController(),
      // fenix: true // Forma utilizada para usar o get.put ou get.find caso esteja instanciado sem dar error
    );
  }
}
