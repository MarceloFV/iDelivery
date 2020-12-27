import 'package:delivery_app/app/data/models/order.dart';
import 'package:delivery_app/app/data/models/product.dart';
import 'package:delivery_app/app/data/models/request.dart';
import 'package:delivery_app/app/data/models/store.dart';
import 'package:delivery_app/app/data/models/user.dart';
import 'package:delivery_app/app/data/providers/request_provider.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  RequestProvider provider = RequestProvider(firestore: null);
    test('description', () {
      var response = provider.sortOrders(mockedOrders);
      expect(response, mockedResponse);
    });
}

var store0 = StoreModel(
  title: ' marcelo store',
  phoneNumber: '(73) 98814-6147',
  shipPrice: 2.0,
);

var product2 = ProductModel(
  imgUrl: null,
  title: 'teste2',
  description: 'teste2',
  value: 20.0,
);

var product3 = ProductModel(
  imgUrl: null,
  title: 'teste3',
  description: 'teste3',
  value: 30.0,
);

var product1 = ProductModel(
  imgUrl: null,
  title: 'teste1',
  description: 'teste1',
  value: 10.0,
);

Map<StoreModel, List<RequestOrderModel>> mockedResponse = {
  store0: [
    RequestOrderModel(
      product: product2,
      amount: 2,
      value: 40.0,
    ),
    RequestOrderModel(
      product: product3,
      amount: 3,
      value: 90.0,
    ),
    RequestOrderModel(
      product: product1,
      amount: 1,
      value: 10.0,
    ),
  ],
};

List<OrderModel> mockedOrders = [
  OrderModel(
    product: product2,
    amount: 2,
    value: 40.0,
    store: store0,
  ),
  OrderModel(
    product: product3,
    amount: 3,
    value: 90.0,
    store: store0,
  ),
  OrderModel(
    product: product1,
    amount: 1,
    value: 10.0,
    store: store0,
  )
];

UserModel mockedUser = UserModel(
  name: ' marcelo fernandes',
  email: 'customer@customer.com',
  phoneNumber: '(73) 98814-6147',
  cpf: '098.470.316-06',
);
