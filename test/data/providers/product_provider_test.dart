import 'package:delivery_app/app/data/models/product.dart';
import 'package:delivery_app/app/data/providers/mocks/mocked_product_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  MockedProductProvider provider = MockedProductProvider();

  group('Getting products from the server', () {
    test('fetch all products', () async {
      var actual = await provider.getAllProducts();
      var matcher = simpleProductList;
      expect(actual, matcher);
    });
    test('fetch favorite products', () async {
      var actual = await provider.getFavoriteProduct();
      var list = [for(var i=0; i<3; i+=1) simpleProductList[i]];
      var matcher = simpleProductList
          .where((element) => element.isFavorite == true)
          .toList();
      expect(actual, list);
      expect(actual, matcher);
    });
    test('fetch popular products', () async {
      var actual = await provider.getPopularProducts();
      var list = [for(var i=3; i<7; i+=1) simpleProductList[i]];
      var matcher = simpleProductList
          .where((element) => element.likes >= 40)
          .toList();
      expect(actual, list);
      expect(actual, matcher);
    });
    test('fetch popular products', () async {
      var actual = await provider.getAllAvailableProducts();
      var list = [for(var i=0; i<2; i+=1) simpleProductList[i]];
      var matcher = simpleProductList
          .where((element) => element.isAvailable == true)
          .toList();
      expect(actual, list);
      expect(actual, matcher);
    });
    test('fetch popular products', () async {
      var actual = await provider.getProductsByCategory(CategoryType.Hamburguer);
      // var list = [for(var i=0; i<2; i+=1) simpleProductList[i]];
      var matcher = simpleProductList
          .where((element) => element.category == CategoryType.Hamburguer)
          .toList();
      // expect(actual, list);
      expect(actual, matcher);
    });
  });
}
