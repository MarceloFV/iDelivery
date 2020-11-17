import 'package:delivery_app/app/data/models/category.dart';
import 'package:delivery_app/app/data/models/product.dart';
import 'package:delivery_app/app/data/repository/product_repository.dart';
import 'package:delivery_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ProductRepository repository = ProductRepository();

  final _popularProducts = List<ProductModel>().obs;
  List<ProductModel> get popularProducts => _popularProducts;

  final _favoriteProducts = List<ProductModel>().obs;
  List<ProductModel> get favoriteProducts => _favoriteProducts;

  final _categories = List<CategoryModel>().obs;
  List<CategoryModel> get categories => _categories;

  @override
  void onInit() {
    _getFavoritesProducts();
    _getPopularProducts();
    _getCategories();
    super.onInit();
  }

  @override
  void onClose() {}

  _getPopularProducts() {
    _popularProducts.assignAll(repository.getPopularProducts());
  }

  _getFavoritesProducts() {
    _favoriteProducts.assignAll(repository.getFavoriteProduct());
  }

  _getCategories() {
    _categories.assignAll(repository.getCategories());
  }

  

  gotoProductPage(ProductModel product) {
    Get.toNamed(Routes.PRODUCT, arguments: {'product': product});
  }

  void gotoCartPage() {
    Get.toNamed(Routes.CART);
  }
}
