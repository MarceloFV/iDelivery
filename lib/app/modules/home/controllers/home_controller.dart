import 'package:delivery_app/app/data/models/product.dart';
import 'package:delivery_app/app/data/models/user.dart';
import 'package:delivery_app/app/data/repository/product_repository.dart';
import 'package:delivery_app/app/global_controllers/app_controller.dart';
import 'package:delivery_app/app/modules/home/models/category.dart';
import 'package:delivery_app/app/routes/app_pages.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ProductRepository productRepository;
  HomeController(this.productRepository);
  
  final popularProducts = List<ProductModel>().obs;

  final favoriteProducts = List<ProductModel>().obs;

  var _categories = List<CategoryModel>();

  List<CategoryModel> get categories => _categories;

  AppController appController = Get.find<AppController>();

  UserModel user;

  @override
  void onInit() {
    _categories = categoryList;
    _fetchFavoritesProducts();
    _fetchPopularProducts();
    user = appController.user;
    super.onInit();
  }

  @override
  void onClose() {}

  _fetchFavoritesProducts() async {
    favoriteProducts.assignAll(await productRepository.getFavoriteProduct());
  }

  _fetchPopularProducts() async {
    popularProducts.assignAll(await productRepository.getPopularProducts());
  }

  gotoProductPage(ProductModel product) {
    Get.toNamed(Routes.PRODUCT, arguments: {'product': product});
  }

  void gotoCartPage() {
    Get.toNamed(Routes.CART);
  }

  final _moneyTextController =
      new MoneyMaskedTextController(leftSymbol: 'R\$ ');
  String maskedProductValue(double value) {
    _moneyTextController.updateValue(value);
    return _moneyTextController.text;
  }
}
