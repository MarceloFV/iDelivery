import 'package:delivery_app/app/data/models/product.dart';
import 'package:delivery_app/app/data/models/store.dart';
import 'package:delivery_app/app/data/models/user.dart';
import 'package:delivery_app/app/data/repository/auth_repository.dart';
import 'package:delivery_app/app/data/repository/product_repository.dart';
import 'package:delivery_app/app/data/repository/store_repository.dart';
import 'package:delivery_app/app/modules/home/models/category.dart';
import 'package:delivery_app/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final AuthRepository authRepository;
  final ProductRepository productRepository;
  final StoreRepository storeRepository;
  HomeController({
    @required this.productRepository,
    @required this.authRepository,
    @required this.storeRepository,
  });

  final popularProducts = List<ProductModel>().obs;

  final favoriteProducts = List<ProductModel>().obs;
  final stores = List<StoreModel>().obs;

  var _categories = List<CategoryModel>();

  List<CategoryModel> get categories => _categories;

  UserModel user;

  @override
  void onInit() {
    user = Get.arguments['user'];
    _categories = categoryList;
    _fetchStores();
    // _fetchFavoritesProducts();
    // _fetchPopularProducts();
    super.onInit();
  }

  _fetchStores() async {
    stores.assignAll(await storeRepository.getStores());
  }

  // _fetchFavoritesProducts() async {
  //   favoriteProducts
  //       .assignAll(await productRepository.getFavoriteProduct(user));
  // }

  // _fetchPopularProducts() async {
  //   popularProducts.assignAll(await productRepository.getPopularProducts());
  // }

  onProductPressed(ProductModel product) {
    Get.toNamed(Routes.PRODUCT, arguments: {'product': product, 'user': user});
  }

  void onCartPressed() {
    Get.toNamed(Routes.CART, arguments: {'user': user});
  }

  final _moneyTextController =
      new MoneyMaskedTextController(leftSymbol: 'R\$ ');
  String maskedProductValue(double value) {
    _moneyTextController.updateValue(value);
    return _moneyTextController.text;
  }

  logout() async {
    await authRepository.logout();
    Get.offAllNamed(Routes.LOGIN);
  }

  onStorePressed(StoreModel store) {
    Get.toNamed(Routes.STORE, arguments: {'store': store, 'user':user});
    print(store.title);
  }
}
