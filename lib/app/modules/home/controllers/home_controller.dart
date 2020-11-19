import 'package:delivery_app/app/controllers/app_controller.dart';
import 'package:delivery_app/app/data/models/category.dart';
import 'package:delivery_app/app/data/models/product.dart';
import 'package:delivery_app/app/data/models/user.dart';
import 'package:delivery_app/app/data/repository/product_repository.dart';
import 'package:delivery_app/app/data/repository/user_repository.dart';
import 'package:delivery_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ProductRepository productRepository = ProductRepository();
  final UserRepository userRepository = UserRepository();

  final _popularProducts = List<ProductModel>().obs;
  List<ProductModel> get popularProducts => _popularProducts;

  final _favoriteProducts = List<ProductModel>().obs;
  List<ProductModel> get favoriteProducts => _favoriteProducts;

  final _categories = List<CategoryModel>().obs;
  List<CategoryModel> get categories => _categories;

  AppController appController = Get.find<AppController>();

  UserModel user;

  @override
  void onInit() {
    _getFavoritesProducts();
    _getPopularProducts();
    _getCategories();
    user = appController.user;
    super.onInit();
  }

  @override
  void onClose() {}


  _getPopularProducts() {
    _popularProducts.assignAll(productRepository.getPopularProducts());
  }

  _getFavoritesProducts() {
    _favoriteProducts.assignAll(productRepository.getFavoriteProduct());
  }

  _getCategories() {
    _categories.assignAll(productRepository.getCategories());
  }

  gotoProductPage(ProductModel product) {
    Get.toNamed(Routes.PRODUCT);
  }

  void gotoCartPage() {
    Get.toNamed(Routes.CART);
  }
}
