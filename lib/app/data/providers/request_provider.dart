import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/app/data/models/order.dart';
import 'package:delivery_app/app/data/models/request.dart';
import 'package:delivery_app/app/data/models/user.dart';
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

  RequestStatus _requestStatus;
  RequestStatus get requestStatus => _requestStatus;

  // sendOrder(List<OrderModel> orderList, UserModel model) {
  //   List<RequestModel> requestList = _sortOrders(orderList);

  //   if (requestList.length == 1)
  //     return _sendSingleRequest(requestList);
  //   else
  //     return _sendMultipleRequests(requestList);
  // }

  // List<RequestModel> _sortOrders(List<OrderModel> orderList) {
  //   List<RequestModel> list = [];

  //   List<String> idList = [];

  //   orderList.forEach((order) {
  //     String id = order.product.storeId;
  //     if (!idList.contains(id)) idList.add(id);
  //   });

  //   idList.forEach((id) {
  //     RequestModel request = RequestModel(storeId: id, orders: []);
  //     orderList.forEach((order) {
  //       String orderId = order.product.storeId;
  //       if (id == orderId) {
  //         request.orders.add(order);
  //       }
  //     });

  //     list.add(request);
  //   });
  //   return list;
  // }

  List<RequestModel> _sendSingleRequest(List<RequestModel> requestList) {
    try {
      firestore.collection(collectionPath).add(requestList.first.toMap());
      _requestStatus = RequestStatus.Enviada;
      return requestList;
    } catch (e) {
      _requestStatus = RequestStatus.Error;
      return null;
    }
  }

  List<RequestModel> _sendMultipleRequests(List<RequestModel> requestList) {
    try {
      requestList.forEach((request) {
        firestore.collection(collectionPath).add(request.toMap());
      });
      _requestStatus = RequestStatus.Enviada;
      return requestList;
    } catch (e) {
      _requestStatus = RequestStatus.Error;
      return null;
    }
  }
}
