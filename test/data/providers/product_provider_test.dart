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

class MockQuery extends Mock implements Query {}

void main() {
  group('Testing products from the mocked firestore: ', () {
    MockFirestore firestore;
    ProductProvider provider;
    MockQuerySnapshot querySnapshot;
    MockCollectionReference collectionReference;
    MockDocumentReference documentReference;
    MockDocumentSnapshot documentSnapshot;
    MockQueryDocumentSnapshot queryDocumentSnapshot;
    MockQuery query;

    setUp(() async {
      firestore = MockFirestore();
      provider = ProductProvider(firestore: firestore);
      collectionReference = MockCollectionReference();
      documentReference = MockDocumentReference();
      documentSnapshot = MockDocumentSnapshot();
      querySnapshot = MockQuerySnapshot();
      query = MockQuery();

    });

    tearDown(() {
      firestore = null;
      provider = null;
      collectionReference = null;
      documentReference = null;
      documentSnapshot = null;
      querySnapshot = null;
      query = null;
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
      var matcher = simpleProductList;
      expect(actual, matcher);
    });

    test('fetch all available products', () async {
      when(firestore.collection('products')).thenReturn(collectionReference);

      when(collectionReference.where(any, isEqualTo: true))
          .thenReturn(query);
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

      when(collectionReference.where(any, isEqualTo: true))
          .thenReturn(query);
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

    test('fetch all popular products', () async { // TODO: Esse teste tem que falhar
      when(firestore.collection('products')).thenReturn(collectionReference);

      when(collectionReference.where(any, isGreaterThan: 40))
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
