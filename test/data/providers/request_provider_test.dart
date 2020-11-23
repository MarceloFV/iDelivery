import 'package:delivery_app/app/data/models/order.dart';
import 'package:delivery_app/app/data/models/product.dart';
import 'package:delivery_app/app/data/models/request.dart';
import 'package:delivery_app/app/data/providers/mocks/mocked_request_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'sending request without user',
    () {
      expect(
        MockedRequestProvider().add(
          orderListMocked,
          null,
        ),
        requestListMocked,
      );
    },
  );
}

final List<RequestModel> requestListMocked = <RequestModel>[
  RequestModel(
    orders: [orderListMocked[0], orderListMocked[1]],
    storeId: orderListMocked[0].product.storeId,
  ),
  RequestModel(
    orders: [orderListMocked[2]],
    storeId: orderListMocked[2].product.storeId,
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
