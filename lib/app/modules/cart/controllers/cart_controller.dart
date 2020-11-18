import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';

import 'package:delivery_app/app/data/models/product.dart';

class CartController extends GetxController {
  final _itemAmount = 0.obs;
  String get itemAmount => _itemAmount.string;

  final _orderList = <Order>[].obs;
  List<Order> get orderList => _orderList;

  final _productList = <ProductModel>[].obs;

  double get finalValue => 40;
  double get shipValue => 5;

  Worker worker;

  @override
  void onInit() {
    //TODO: Adicionar um ever que monitora quando a lista de produtos é alterada, criando uma nova ordem
    // _orderList.assignAll(orderListMocked);
    // worker = ever(_orderList, orderListChanged);
    super.onInit();
  }

  orderListChanged(changedOrderList) {
    print('carai cebolao');
  }

  void createOrder(ProductModel product, int amount) {
    //TODO: Enviar ordem com o valor já como String, criar mascara aqui.
    // double value = product.value * amount;
    // Order order = Order(product: product, amount: amount, value: value);
    // _orderList.add(order);
    _addProduct(product, amount);
  }

  void onAmountRemovePressed(Order _order) {
    if (!(_order.amount > 1)) return;
    var index = orderList.indexOf(_order);
    _order.amount--;
    _order.value -= _order.product.value;
    _orderList[index] = _order;
  }

  void onAmountAddPressed(Order _order) {
    var index = orderList.indexOf(_order);
    _order.value += _order.product.value;
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

  double _getOrderValue(ProductModel product, int amount) {
    return (product.value * amount);
  }

  void _addProduct(ProductModel product, int amount) {
    if (!_productList.contains(product)) {
      _productList.add(product);
      Order newOrder = Order(
        product: product,
        amount: amount,
        value: _getOrderValue(product, amount),
      );
      orderList.add(newOrder);
    } else {
      orderList.forEach((o) {
        if (o.product == product) {
          o.amount += amount;
          //TODO: Provavelmente vai dar um error aqui
        }
      });
    }
  }

  void onBackPressed() {
    Get.back();
  }

  String getUserCurrentAdress() {
    return '242nd St Tonganoxie, Kansas (KS), 66086';
  }

  onConfirmOrderPressed() {
    // TODO: Implement confirmOrder
    print('Order confirmada');
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
