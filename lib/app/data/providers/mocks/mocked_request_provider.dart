import 'dart:convert';
import 'package:delivery_app/app/data/models/order.dart';
import 'package:delivery_app/app/data/models/request.dart';
import 'package:delivery_app/app/data/models/user.dart';
import 'package:meta/meta.dart';

// const baseUrl = 'http://gerador-nomes.herokuapp.com/nomes/10';

class MockedRequestProvider {
  MockedRequestProvider();

  List<RequestModel> add(List<OrderModel> orderList, UserModel user) {
    // Quando enviar um request, tera que ennviar um request para cada
    // loja diferente

    List<RequestModel> requestList = [];


    orderList.forEach((OrderModel order) {
      if (requestList.isEmpty) {
        requestList.add(RequestModel(
          orders: [order],
          storeId: order.product.storeId,
          userId: user?.id,
        ));
      }
      requestList.forEach((request) {
        if (!request.orders.contains(order)) {
          request.orders.add(order);
        }
      });

    });

    return requestList;
  }
}
