import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/app/data/models/product.dart';
import 'package:delivery_app/app/data/providers/mocks/mocked_product_provider.dart';
import 'package:delivery_app/app/data/providers/product_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockFirestore extends Mock implements FirebaseFirestore {}

class MockQuerySnapshot extends Mock implements QuerySnapshot {}

class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}

class MockQueryDocumentSnapshot extends Mock implements QueryDocumentSnapshot {}

class MockCollectionReference extends Mock implements CollectionReference {}

class MockDocumentReference extends Mock implements DocumentReference {}

void main() {
  // group('Getting products from the mocked provider', () {
  //   MockedProductProvider provider = MockedProductProvider();
  //   test('fetch all products', () async {
  //     var actual = await provider.getAllProducts();
  //     var matcher = simpleProductList;
  //     expect(actual, matcher);
  //   });
  //   test('fetch favorite products', () async {
  //     var actual = await provider.getFavoriteProduct();
  //     var list = simpleProductList.getRange(0, 3).toList();

  //     var matcher = simpleProductList
  //         .where((element) => element.isFavorite == true)
  //         .toList();
  //     expect(actual, list);
  //     expect(actual, matcher);
  //   });
  //   test('fetch popular products', () async {
  //     var actual = await provider.getPopularProducts();
  //     var list = simpleProductList.getRange(3, 7).toList();

  //     var matcher =
  //         simpleProductList.where((element) => element.likes >= 40).toList();
  //     expect(actual, list);
  //     expect(actual, matcher);
  //   });
  //   test('fetch popular products', () async {
  //     var actual = await provider.getAllAvailableProducts();
  //     var list = simpleProductList.getRange(0, 2).toList();

  //     var matcher = simpleProductList
  //         .where((element) => element.isAvailable == true)
  //         .toList();
  //     expect(actual, list);
  //     expect(actual, matcher);
  //   });
  //   test('fetch popular products', () async {
  //     var actual =
  //         await provider.getProductsByCategory(CategoryType.Hamburguer);
  //     var matcher = simpleProductList
  //         .where((element) => element.category == CategoryType.Hamburguer)
  //         .toList();
  //     expect(actual, matcher);
  //   });
  // });

  group('Testing products from the mocked firestore: ', () {
    MockFirestore firestore;
    ProductProvider provider;
    MockQuerySnapshot querySnapshot;
    MockCollectionReference collectionReference;
    MockDocumentReference documentReference;
    MockDocumentSnapshot documentSnapshot;
    MockQueryDocumentSnapshot queryDocumentSnapshot;

    setUpAll(() async {
      firestore = MockFirestore();
      provider = ProductProvider(firestore: firestore);
      collectionReference = MockCollectionReference();
      documentReference = MockDocumentReference();
      documentSnapshot = MockDocumentSnapshot();
      querySnapshot = MockQuerySnapshot();

      List<QueryDocumentSnapshot> listOfDocs = [];

      when(firestore.collection('products')).thenReturn(collectionReference);
      for (int i = 0; i < simpleProductList.length; i++) {
        ProductModel model = simpleProductList[i];
        Map<String, dynamic> map = model.toDocument();
        queryDocumentSnapshot = MockQueryDocumentSnapshot();
        // when(collectionReference.add(map))
        //     .thenAnswer((_) async => documentReference);
        // when(documentReference.get()).thenAnswer((_) async => documentSnapshot);
        // when(documentSnapshot.data()).thenReturn(map);
        when(collectionReference.get()).thenAnswer((_) async => querySnapshot);
        when(queryDocumentSnapshot.data()).thenReturn(map);
        listOfDocs.add(queryDocumentSnapshot);
      }
      when(querySnapshot.docs).thenReturn(listOfDocs);
    });

    test('fetch all products:', () async {
      var actual = await provider.getAllProducts();
      var matcher = simpleProductList;
      expect(actual, matcher);
    });
    // test('fetch all available products', () async{
    //   var actual = await provider.getAllAvailableProducts();
    //   var matcher = simpleProductList.where((element) => element.isAvailable == true).toList();
    //   expect(actual, matcher);
    // });
  });
}
