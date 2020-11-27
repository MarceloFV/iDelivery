import 'package:delivery_app/app/data/models/product.dart';
import 'package:delivery_app/app/data/providers/product_provider.dart';
import 'package:meta/meta.dart';

class ProductRepository {
  final ProductProvider provider;

  ProductRepository({@required this.provider}) : assert(provider != null);

  Future<List<ProductModel>> getAllProducts() => provider.getAllProducts();

  Future<List<ProductModel>> getAllAvailableProducts() =>
      provider.getAllAvailableProducts();

  Future<List<ProductModel>> getPopularProducts() =>
      provider.getPopularProducts();

  Future<List<ProductModel>> getFavoriteProduct() =>
      provider.getFavoriteProduct();

  Future<List<ProductModel>> getProductByCategory(CategoryType category) =>
      provider.getProductsByCategory(category); // change to CategoryType
}
