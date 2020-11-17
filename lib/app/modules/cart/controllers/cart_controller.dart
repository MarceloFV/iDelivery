import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';

import 'package:delivery_app/app/data/models/product.dart';

class CartController extends GetxController {
  final _itemAmount = 0.obs;
  String get itemAmount => _itemAmount.string;

  final _orderList = <Order>[].obs;
  List<Order> get orderList => _orderList;

  double get finalValue => 40;
  double get shipValue => 5;

  @override
  void onInit() {
    // _orderList.assignAll(orderListMocked);
    super.onInit();
  }

  void createOrder(ProductModel product, int amount) {
    //TODO: Enviar ordem com o valor já como String, criar mascara aqui.
    double value = product.value * amount;
    Order order = Order(product: product, amount: amount, value: value);
    _orderList.add(order);
  }

  void onAmountRemovePressed(Order _order) {
    var index = orderList.indexOf(_order);
    if (_order.amount > 1) _order.amount--;
    _orderList[index] = _order;
  }

  void onAmountAddPressed(Order _order) {
    var index = orderList.indexOf(_order);
    _order.amount++;
    _orderList[index] = _order;
  }

  void onRemoveOrderPressed(Order _order) {
    orderList.remove(_order);
  }

  final _moneyTextController =
      new MoneyMaskedTextController(leftSymbol: 'R\$ ');
  String convertToMaskedText(double _value) {
    _moneyTextController.updateValue(_value);
    return _moneyTextController.text;
  }

  void addProduct(ProductModel product, int amount) {
    Order _order = Order(
      product: product,
      amount: amount,
      value: 0,
    );
    orderList.add(_order);
  }

  void onBackPressed() {
    Get.back();
  }

  String getUserCurrentAdress() {
    return '242nd St Tonganoxie, Kansas (KS), 66086';
  }
}

class Order {
  ProductModel product;
  int amount;
  double value;

  Order({this.product, this.amount, this.value});

  Order copyWith({
    ProductModel product,
    int amount,
    double value,
  }) {
    return Order(
      product: product ?? this.product,
      amount: amount ?? this.amount,
      value: value ?? this.value,
    );
  }
}

final List<Order> orderListMocked = <Order>[
  Order(
    product: ProductModel(
      imgUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTjZU_yayz_f9mUdgmdZJ0utxy72G-Ub3_pUw&usqp=CAU",
      title: "Titulo muito foda que da vontade de lembrar o nome",
      value: 20,
    ),
    amount: 2,
    value: 40,
  ),
  Order(
    product: ProductModel(
      imgUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTjZU_yayz_f9mUdgmdZJ0utxy72G-Ub3_pUw&usqp=CAU",
      title: "title2",
      value: 20,
    ),
    amount: 2,
    value: 40,
  ),
  Order(
    product: ProductModel(
      imgUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTjZU_yayz_f9mUdgmdZJ0utxy72G-Ub3_pUw&usqp=CAU",
      title: "title3",
      value: 20,
    ),
    amount: 2,
    value: 40,
  ),
];
