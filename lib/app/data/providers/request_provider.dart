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

  Future<void> send(List<OrderModel> orderList, UserModel user) async {
    var map = _sortOrders(orderList);
    print(map);
    RequestModel request = RequestModel(
      orders: orderList,
      // user: user,
    );

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

  _sortOrders(List<OrderModel> orderList) {
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

    orderList.forEach((model) {
      var request = RequestOrderModel(
        amount: model.amount,
        product: model.product,
        message: model.message,
        value: model.value,
      );
      if (!mapa.containsKey(mapa[model.store])) {
        mapa[model.store] = [];
        print(mapa);
      }
      mapa[model.store].add(request);
    });

    // List idList = [];

    // orderList.forEach((order) {
    //   var id = order.store;
    //   if (!idList.contains(id)) idList.add(id);
    // });

    // idList.forEach((id) {
    //   RequestOrderModel request = RequestOrderModel();
    //   orderList.forEach((order) {
    //     var orderId = order.store;
    //     if (id == orderId) {
    //       request.orders.add(order);
    //     }
    //   });

    //   list.add(request);
    // });
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
