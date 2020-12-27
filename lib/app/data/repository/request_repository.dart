import 'package:delivery_app/app/data/models/order.dart';
import 'package:delivery_app/app/data/models/user.dart';
import 'package:delivery_app/app/data/providers/request_provider.dart';
import 'package:meta/meta.dart';

class RequestRepository {
  final RequestProvider provider;

  RequestRepository({@required this.provider});

  Future<void> send(
          List<OrderModel> orderList, UserModel user) =>
      provider.send(orderList, user);
}
