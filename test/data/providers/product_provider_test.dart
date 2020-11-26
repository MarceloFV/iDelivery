import 'package:delivery_app/app/data/providers/mocks/mocked_product_provider.dart';
import 'package:delivery_app/app/data/providers/product_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  MockedProductProvider provider = MockedProductProvider();

  group('Getting products from the server', () {
    test('fetch available products only', () {
      var response = provider.getAllProducts();
      
    });
  });
}
