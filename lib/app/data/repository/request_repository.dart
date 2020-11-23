import 'package:delivery_app/app/data/models/order.dart';
import 'package:delivery_app/app/data/models/user.dart';
import 'package:delivery_app/app/data/providers/mocks/mocked_request_provider.dart';

class RequestRepository {
  MockedRequestProvider provider = MockedRequestProvider();

  add(List<OrderModel> orderList, UserModel user) { // trocar para bool
    return provider.add(orderList, user);
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
