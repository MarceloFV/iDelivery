import 'package:delivery_app/app/data/models/product.dart';
import 'package:delivery_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class LCartController extends GetxController {
  

  final _productList = <ProductModel>[].obs;

  int get productLenght => _productList.length;

  int amount = 0;

  void addProduct(ProductModel product, int amount) {
    _productList.add(product);
  }

  void onProductPressed(ProductModel product) {
    Get.toNamed(Routes.PRODUCT, arguments: product);
  }

 
}
