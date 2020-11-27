import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/app/data/models/order.dart';
import 'package:delivery_app/app/data/models/product.dart';
import 'package:delivery_app/app/data/models/request.dart';
import 'package:delivery_app/app/data/providers/request_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockFirestore extends Mock implements FirebaseFirestore {}

class MockCollectionReference extends Mock implements CollectionReference {}

class MockDocumentReference extends Mock implements DocumentReference {}

class MockQuerySnapshot extends Mock implements QuerySnapshot {}

void main() {
  group('Request provider', () {
    RequestProvider provider;
    MockFirestore firestore;
    MockCollectionReference collectionReference;
    MockDocumentReference documentReference;
    // MockQuerySnapshot querySnapshot;

    setUp(() {
      firestore = MockFirestore();
      provider = RequestProvider(firestore: firestore);
      collectionReference = MockCollectionReference();
      documentReference = MockDocumentReference();
      // querySnapshot = MockQuerySnapshot();

      when(firestore.collection('requests')).thenReturn(collectionReference);
      when(collectionReference.add(any))
          .thenAnswer((_) async => documentReference);
    });

    test('Sending request with a single order', () {
      var actual = provider.sendOrder(singleOrderMockedList);
      var matcher = RequestStatus.Enviada;
      expect(actual, matcher);
    });
    test('Sending request with a multiple order of the same store', () {
      var actual = provider.sendOrder(multiOrderSameStoreMockedList);
      var matcher = RequestStatus.Enviada;
      expect(actual, matcher);
    });
    test('Sending multiRequest with orders of the various store', () {
      var actual = provider.sendOrder(orderListMocked);
      var matcher = RequestStatus.Enviada;
      expect(actual, matcher);
    });
  });
}

// final List<RequestModel> requestListMocked = <RequestModel>[
//   RequestModel(
//     orders: [orderListMocked[0], orderListMocked[1]],
//     storeId: orderListMocked[0].product.storeId,
//   ),
//   RequestModel(
//     orders: [orderListMocked[2]],
//     storeId: orderListMocked[2].product.storeId,
//   ),
// ];

final List<OrderModel> multiOrderSameStoreMockedList = <OrderModel>[
  OrderModel(
    product: ProductModel(
      imgUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTjZU_yayz_f9mUdgmdZJ0utxy72G-Ub3_pUw&usqp=CAU",
      title: "teste1",
      storeId: 'xx',
      value: 20,
    ),
    amount: 2,
    value: 40,
  ),
  OrderModel(
    product: ProductModel(
      imgUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTjZU_yayz_f9mUdgmdZJ0utxy72G-Ub3_pUw&usqp=CAU",
      title: "Teste2",
      storeId: 'xx',
      value: 20,
    ),
    amount: 2,
    value: 40,
  ),
];

final List<OrderModel> singleOrderMockedList = <OrderModel>[
  OrderModel(
    product: ProductModel(
      imgUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTjZU_yayz_f9mUdgmdZJ0utxy72G-Ub3_pUw&usqp=CAU",
      title: "Titulo muito foda que da vontade de lembrar o nome",
      storeId: 'xx',
      value: 20,
    ),
    amount: 2,
    value: 40,
  ),
];

final List<OrderModel> orderListMocked = <OrderModel>[
  OrderModel(
    product: ProductModel(
      imgUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTjZU_yayz_f9mUdgmdZJ0utxy72G-Ub3_pUw&usqp=CAU",
      title: "Titulo muito foda que da vontade de lembrar o nome",
      storeId: 'xx',
      value: 20,
    ),
    amount: 2,
    value: 40,
  ),
  OrderModel(
    product: ProductModel(
      imgUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTjZU_yayz_f9mUdgmdZJ0utxy72G-Ub3_pUw&usqp=CAU",
      title: "title2",
      storeId: 'xx',
      value: 20,
    ),
    amount: 2,
    value: 40,
  ),
  OrderModel(
    product: ProductModel(
      imgUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTjZU_yayz_f9mUdgmdZJ0utxy72G-Ub3_pUw&usqp=CAU",
      title: "title3",
      storeId: 'yy',
      value: 20,
    ),
    amount: 2,
    value: 40,
  ),
];

// OrderModel();
