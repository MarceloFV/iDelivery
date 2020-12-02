import 'package:delivery_app/app/data/providers/product_provider.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';

Future<void> main() async {
    final firestore = MockFirestoreInstance();
    final provider = ProductProvider(firestore: firestore);
    
      for (var i = 0; i < simpleProductList.length; i++) {
        await firestore
            .collection('products')
            .add(simpleProductList[i].toDocument());
      }
    
  group('Testing product provider with cloud firestore mock library: ', () {
    test('fetch all products:', () async {
      final actual = await provider.getAllProducts();
      final matcher = simpleProductList;
      // print(actual.first.toString());
      expect(actual, matcher);
    });
    test('fetch all available products', () async {
      final actual = await provider.getAvailableProducts();
      final matcher = simpleProductList
          .where((element) => element.isAvailable == true)
          .toList();
      expect(actual, matcher);
    });
    test('fetch all favorite products', () async {
      final actual = await provider.getFavoriteProducts();
      final matcher = simpleProductList
          .where((element) => element.isFavorite == true)
          .toList();
      expect(actual, matcher);
    });
    test('fetch all popular products', () async {
      final actual = await provider.getPopularProducts();
      final matcher =
          simpleProductList.where((element) => element.likes >= 40).toList();
      expect(actual, matcher);
    });
  });
}
