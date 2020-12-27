import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/app/data/models/order.dart';
import 'package:delivery_app/app/data/models/request.dart';
import 'package:delivery_app/app/data/models/store.dart';
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

  mockedSend(List<OrderModel> orderList, UserModel user) async {}

  Future<void> send(List<OrderModel> orderList, UserModel user) async {
    List<RequestModel> requestList = List();
    RequestUserModel requestUser = RequestUserModel(
        address: user.address, name: user.name, phone: user.phoneNumber);
    var map = sortOrders(orderList);
    map.keys.forEach((store) {
      var request = RequestModel(
        orders: map[store],
        user: requestUser,
        store: store,
      );
      requestList.add(request);
    });


    requestList.forEach((request) {
      request.store.reference.collection(collectionPath).add(request.toMap());
    });

    // RequestModel request = RequestModel(
    //   orders: orderList,
    //   // user: user,
    // );

    // orderList.first.store.reference
    //     .collection(collectionPath)
    //     .add(request.toMap());
  }

  // sendOrder(List<OrderModel> orderList, UserModel model) {
  //   List<RequestModel> requestList = _sortOrders(orderList);

  //   if (requestList.length == 1)
  //     return _sendSingleRequest(requestList);
  //   else
  //     return _sendMultipleRequests(requestList);
  // }

  Map<StoreModel, List<RequestOrderModel>> sortOrders(
      List<OrderModel> orderList) {
/*
 RequestOrderModel({
    this.product,
    this.amount,
    this.message,
    this.value,
  });
*/

/*
  OrderModel({
    this.product,
    this.amount,
    this.message,
    this.value,
    this.store,
  });
*/

    Map<StoreModel, List<RequestOrderModel>> mapa = Map();
    orderList.forEach((order) {
      if (!mapa.containsKey(order.store)) {
        mapa[order.store] = List();
      }
      mapa[order.store].add(RequestOrderModel(
        amount: order.amount,
        message: order.message,
        product: order.product,
        value: order.value,
      ));
    });
    return mapa;
  }

  // List<RequestModel> _sendSingleRequest(List<RequestModel> requestList) {
  //   try {
  //     firestore.collection(collectionPath).add(requestList.first.toMap());
  //     _requestStatus = RequestStatus.Enviada;
  //     return requestList;
  //   } catch (e) {
  //     _requestStatus = RequestStatus.Error;
  //     return null;
  //   }
  // }

  // List<RequestModel> _sendMultipleRequests(List<RequestModel> requestList) {
  //   try {
  //     requestList.forEach((request) {
  //       firestore.collection(collectionPath).add(request.toMap());
  //     });
  //     _requestStatus = RequestStatus.Enviada;
  //     return requestList;
  //   } catch (e) {
  //     _requestStatus = RequestStatus.Error;
  //     return null;
  //   }
  // }
}
