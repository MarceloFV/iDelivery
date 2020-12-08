import 'package:delivery_app/app/data/models/product.dart';
import 'package:delivery_app/app/data/models/store.dart';
import 'package:delivery_app/app/data/models/user.dart';
import 'package:delivery_app/app/data/repository/product_repository.dart';
import 'package:delivery_app/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class StoreController extends GetxController {
  final ProductRepository productRepository;

  StoreModel store;
  UserModel user;

  final menu = <ProductModel>[].obs;

  StoreController({@required this.productRepository});

  @override
  void onInit() {
    store = Get.arguments['store'];
    user = Get.arguments['user'];
    _fetchMenu();
    super.onInit();
  }

  _fetchMenu() async {
    menu.assignAll(await productRepository.getProductsFromStore(store));
  }

  onProductCardPressed(ProductModel product) {
    //TODO: Implement onProductCardPressed;
    Get.toNamed(Routes.PRODUCT, arguments: {
      'product': product,
      'store': store,
      'user': user,
    });
  }

  onFavoritePressed() {
    //TODO: Implement onFavoritePressed;
    print('favoritar');
  }
}
