import 'package:delivery_app/app/data/models/order.dart';
import 'package:delivery_app/app/data/models/product.dart';
import 'package:delivery_app/app/data/models/request.dart';
import 'package:delivery_app/app/data/providers/request_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';

void main() {
  group('Request provider without user', () {
    final firestore = MockFirestoreInstance();
    RequestProvider provider = RequestProvider(firestore: firestore);
    
    test('Sending request with a single order', () {
      var actual = provider.sendOrder(singleOrderMockedList, null);
      var matcher = singleOrderRequestMockedList;
      var actualStatus = provider.requestStatus;
      var matcherStatus = RequestStatus.Enviada;
      expect(actualStatus, matcherStatus);
      expect(actual, matcher);
    });

    test('Sending request with a multiple order of the same store', () {
      var actual = provider.sendOrder(multiOrderSameStoreMockedList, null);
      var matcher = multiOrderSameStoreSingleRequestMockedList;
      var actualStatus = provider.requestStatus;
      var matcherStatus = RequestStatus.Enviada;
      expect(actualStatus, matcherStatus);
      expect(actual, matcher);
    });
    test('Sending multiRequest with orders of the various store', () {
      var actual = provider.sendOrder(orderListMocked, null);
      var matcher = multiOrderMultiStoreRequestMockedList;
      var actualStatus = provider.requestStatus;
      var matcherStatus = RequestStatus.Enviada;
      expect(actualStatus, matcherStatus);
      expect(actual, matcher);
    });
  });
}

final multiOrderSameStoreMockedList = [
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

final multiOrderSameStoreSingleRequestMockedList = [
  RequestModel(
    orders: multiOrderSameStoreMockedList,
    storeId: 'xx',
  )
];

final singleOrderMockedList = [
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

final singleOrderRequestMockedList = [
  RequestModel(
    orders: singleOrderMockedList,
    storeId: 'xx',
  ),
];

final orderListMocked = [
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

final multiOrderMultiStoreRequestMockedList = [
  RequestModel(orders: [orderListMocked[0], orderListMocked[1]], storeId: 'xx'),
  RequestModel(
    orders: [orderListMocked[2]],
    storeId: 'yy',
  ),
];
