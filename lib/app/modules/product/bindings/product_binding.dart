import 'package:get/get.dart';

import 'package:delivery_app/app/modules/product/controllers/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<ProductController>(
      
    //   () => ProductController(),
    //   // fenix: true // Forma utilizada para usar o get.put ou get.find caso esteja instanciado sem dar error
    // );
    Get.put<ProductController>(
       ProductController(),
    );
  }
}
