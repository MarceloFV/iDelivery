import 'package:delivery_app/app/data/models/product.dart';
import 'package:delivery_app/app/data/models/store.dart';
import 'package:delivery_app/app/data/providers/product_provider.dart';
import 'package:meta/meta.dart';

class ProductRepository {
  final ProductProvider provider;

  ProductRepository({@required this.provider}) : assert(provider != null);

  Future<List<ProductModel>> getProductsFromStore(StoreModel store) =>
      provider.getProductsFromStore(store);
}
