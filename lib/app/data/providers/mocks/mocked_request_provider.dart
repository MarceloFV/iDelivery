import 'package:delivery_app/app/data/models/order.dart';
import 'package:delivery_app/app/data/models/request.dart';
import 'package:delivery_app/app/data/models/user.dart';

// const baseUrl = 'http://gerador-nomes.herokuapp.com/nomes/10';

class MockedRequestProvider {
  MockedRequestProvider();

  List<RequestModel> add(List<OrderModel> orderList, UserModel user) {
    // Quando enviar um request, tera que ennviar um request para cada
    // loja diferente

    List<RequestModel> requestList = [];

    // requestList seja proporcional a quantidade de id stores;

    List<String> idList = [];

    orderList.forEach((order) {
      String id = order.product.storeId;
      if (!idList.contains(id)) idList.add(id);
    });


    idList.forEach((id) {
      RequestModel request =
          RequestModel(storeId: id, userId: user?.id, orders: []);
      orderList.forEach((order) {
        String orderId = order.product.storeId;
        if (id == orderId) {
          request.orders.add(order);
        }
      });

      requestList.add(request);
    });

    // orderList.forEach((OrderModel order) {
    //   if (requestList.isEmpty) {
    //     requestList.add(RequestModel(
    //       orders: [order],
    //       storeId: order.product.storeId,
    //       userId: user?.id,
    //     ));
    //   }
    //   requestList.forEach((request) {
    //     if (!request.orders.contains(order)) {
    //       request.orders.add(order);
    //     }
    //   });
    // });

    return requestList;
  }
}
