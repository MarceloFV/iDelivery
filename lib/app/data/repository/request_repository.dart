import 'package:delivery_app/app/data/models/order.dart';
import 'package:delivery_app/app/data/models/user.dart';
import 'package:delivery_app/app/data/providers/request_provider.dart';
import 'package:meta/meta.dart';
class RequestRepository {

  final RequestProvider provider;

  RequestRepository({@required this.provider});

  add(List<OrderModel> orderList, UserModel user) { // trocar para bool
    return provider.sendOrder(orderList, user);
    // return apiClient.add(obj);
  }

  getAll() {
    // return apiClient.getAll();
  }

  getId(id) {
    // return apiClient.getId(id);
  }

  delete(id) {
    // return apiClient.delete(id);
  }

  edit(obj) {
    // return apiClient.edit(obj);
  }
}
