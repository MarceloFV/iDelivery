import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/app/data/models/product.dart';
import 'package:delivery_app/app/data/providers/product_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockFirestore extends Mock implements FirebaseFirestore {}

class MockQuerySnapshot extends Mock implements QuerySnapshot {}

class MockQueryDocumentSnapshot extends Mock implements QueryDocumentSnapshot {}

class MockCollectionReference extends Mock implements CollectionReference {}

class MockQuery extends Mock implements Query {}

void main() {
  group('Testing products from mocked firestore: ', () {
    MockFirestore firestore;
    ProductProvider provider;
    MockQuerySnapshot querySnapshot;
    MockCollectionReference collectionReference;
    MockQueryDocumentSnapshot queryDocumentSnapshot;
    MockQuery query;

    setUp(() async {
      firestore = MockFirestore();
      provider = ProductProvider(firestore: firestore);
      collectionReference = MockCollectionReference();
      querySnapshot = MockQuerySnapshot();
      queryDocumentSnapshot = MockQueryDocumentSnapshot();
      query = MockQuery();
    });

    test('fetch all products:', () async {
      List<QueryDocumentSnapshot> listOfDocs = [];
      var resultList = simpleProductList;
      when(firestore.collection('products')).thenReturn(collectionReference);
      when(collectionReference.get()).thenAnswer((_) async => querySnapshot);
      for (int i = 0; i < resultList.length; i++) {
        ProductModel model = resultList[i];
        Map<String, dynamic> map = model.toDocument();
        queryDocumentSnapshot = MockQueryDocumentSnapshot();
        when(queryDocumentSnapshot.data()).thenReturn(map);
        listOfDocs.add(queryDocumentSnapshot);
      }
      when(querySnapshot.docs).thenReturn(listOfDocs);

      var actual = await provider.getAllProducts();
      expect(actual, resultList);
    });

    test('fetch all available products', () async {
      when(firestore.collection('products')).thenReturn(collectionReference);

      when(collectionReference.where('isAvailable', isEqualTo: true)).thenReturn(query);
      when(query.get()).thenAnswer((_) async => querySnapshot);

      List<QueryDocumentSnapshot> listOfDocs = [];

      var resultList = simpleProductList
          .where((element) => element.isAvailable == true)
          .toList();

      for (int i = 0; i < resultList.length; i++) {
        ProductModel model = resultList[i];
        Map<String, dynamic> map = model.toDocument();
        queryDocumentSnapshot = MockQueryDocumentSnapshot();
        when(queryDocumentSnapshot.data()).thenReturn(map);
        listOfDocs.add(queryDocumentSnapshot);
      }

      when(querySnapshot.docs).thenReturn(listOfDocs);

      var actual = await provider.getAllAvailableProducts();
      var matcher = simpleProductList
          .where((element) => element.isAvailable == true)
          .toList();
      expect(actual, matcher);
    });
    test('fetch all favorite products', () async {
      when(firestore.collection('products')).thenReturn(collectionReference);

      when(collectionReference.where('isFavorite', isEqualTo: true)).thenReturn(query);
      when(query.get()).thenAnswer((_) async => querySnapshot);

      List<QueryDocumentSnapshot> listOfDocs = [];

      var resultList = simpleProductList
          .where((element) => element.isFavorite == true)
          .toList();

      for (int i = 0; i < resultList.length; i++) {
        ProductModel model = resultList[i];
        Map<String, dynamic> map = model.toDocument();
        queryDocumentSnapshot = MockQueryDocumentSnapshot();
        when(queryDocumentSnapshot.data()).thenReturn(map);
        listOfDocs.add(queryDocumentSnapshot);
      }
      when(querySnapshot.docs).thenReturn(listOfDocs);

      var actual = await provider.getFavoriteProduct();
      var matcher = simpleProductList
          .where((element) => element.isFavorite == true)
          .toList();
      expect(actual, matcher);
    });

    test('fetch all popular products', () async {
      when(firestore.collection('products')).thenReturn(collectionReference);

      when(collectionReference.where('likes', isGreaterThan: 40))
          .thenReturn(query);
      when(query.get()).thenAnswer((_) async => querySnapshot);

      List<QueryDocumentSnapshot> listOfDocs = [];
      var resultList =
          simpleProductList.where((element) => element.likes >= 40).toList();

      for (int i = 0; i < resultList.length; i++) {
        ProductModel model = resultList[i];
        Map<String, dynamic> map = model.toDocument();
        queryDocumentSnapshot = MockQueryDocumentSnapshot();
        when(queryDocumentSnapshot.data()).thenReturn(map);
        listOfDocs.add(queryDocumentSnapshot);
      }
      when(querySnapshot.docs).thenReturn(listOfDocs);

      var actual = await provider.getPopularProducts();

      var matcher =
          simpleProductList.where((element) => element.likes >= 40).toList();
      expect(actual, matcher);
    });
  });
}
