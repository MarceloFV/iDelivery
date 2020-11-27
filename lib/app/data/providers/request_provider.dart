import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/app/data/models/order.dart';
import 'package:delivery_app/app/data/models/request.dart';
import 'package:meta/meta.dart';

const collectionPath = 'requests';

enum RequestStatus {
  Error,
  Enviada,
  Aprovada,
  Cancelada,
  Entregue,
}

class RequestProvider {
  final FirebaseFirestore firestore;
  RequestProvider({@required this.firestore});

  RequestStatus sendOrder(List<OrderModel> orderList) {
    List<RequestModel> requestList = _sortOrders(orderList);

    if (requestList.length == 1)
      return _sendSingleRequest(requestList.first);
    else
      return _sendMultipleRequests(requestList);
  }

  List<RequestModel> _sortOrders(List<OrderModel> orderList) {
    List<RequestModel> list = [];

    List<String> idList = [];

    orderList.forEach((order) {
      String id = order.product.storeId;
      if (!idList.contains(id)) idList.add(id);
    });

    idList.forEach((id) {
      RequestModel request = RequestModel(storeId: id, orders: []);
      orderList.forEach((order) {
        String orderId = order.product.storeId;
        if (id == orderId) {
          request.orders.add(order);
        }
      });

      list.add(request);
    });
    return list;
  }

  RequestStatus _sendSingleRequest(RequestModel request) {
    try {
      firestore.collection(collectionPath).add(request.toMap());
      return RequestStatus.Enviada;
    } catch (e) {
      return RequestStatus.Error;
    }
  }

  RequestStatus _sendMultipleRequests(List<RequestModel> requestList) {
    try {
      requestList.forEach((request) {
        firestore.collection(collectionPath).add(request.toMap());
      });
      return RequestStatus.Enviada;
    } catch (e) {
      return RequestStatus.Error;
    }
  }
}
