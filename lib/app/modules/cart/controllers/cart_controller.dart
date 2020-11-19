import 'package:delivery_app/app/controllers/app_controller.dart';
import 'package:delivery_app/app/data/models/user.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';

import 'package:delivery_app/app/data/models/product.dart';

class CartController extends GetxController {
  final _itemAmount = 0.obs;
  String get itemAmount => _itemAmount.string;

  final _orderList = <Order>[].obs;
  List<Order> get orderList => _orderList;

  final _productList = <ProductModel>[].obs;

  final _finalValue = 0.0.obs;

  double get finalValue => _finalValue.value;
  double get shipValue => 5; // TODO: ADD ship value

  Worker worker;
  UserModel user;
  AppController appController = AppController();

  @override
  void onInit() {
    user = appController.user;
    //TODO: Adicionar um ever que monitora quando a lista de produtos é alterada, criando uma nova ordem
    // _orderList.assignAll(orderListMocked);
    print(user.toString());
    worker = ever(_orderList, onOrderListChanged);
    super.onInit();
  }

  onOrderListChanged(nOrderList) {
    print('orderList changed');
    var total = 0.0;
    nOrderList.forEach((order) => total += order.value);
    _finalValue.value = total + shipValue;
  }

  void addProductToCart(ProductModel product, int amount) {
    //TODO: Enviar ordem com o valor já como String, criar mascara aqui.
    // double value = product.value * amount;
    // Order order = Order(product: product, amount: amount, value: value);
    // _orderList.add(order);
    if (_productList.contains(product)) {
      _addExistingProduct(product, amount);
    } else {
      _addNewProduct(product, amount);
    }
  }

  _addExistingProduct(ProductModel product, int amount) {
    int index;
    orderList.forEach(
      (order) {
        if (order.product == product) {
          index = orderList.indexOf(order);
        }
      },
    );
    orderList[index].amount += amount;
    orderList[index].value += product.value * amount;
  }

  _addNewProduct(ProductModel product, int amount) {
    _productList.add(product);
    Order order = Order(
      product: product,
      amount: amount,
      value: (product.value * amount),
    );
    orderList.add(order);
  }

  void onAmountRemovePressed(Order _order) {
    if (!(_order.amount > 1)) return;
    var index = orderList.indexOf(_order);
    _order.amount--;
    _order.value -= _order.product.value;
    print(_orderList);
    _orderList[index] = _order;
  }

  void onAmountAddPressed(Order _order) {
    var index = orderList.indexOf(_order);
    _order.value += _order.product.value;
    _order.amount++;
    _orderList[index] = _order;
  }

  void onRemoveOrderPressed(Order _order) {
    _productList.remove(_order.product);
    orderList.remove(_order);
  }

  final _moneyTextController =
      new MoneyMaskedTextController(leftSymbol: 'R\$ ');
  String convertToMaskedText(double _value) {
    _moneyTextController.updateValue(_value);
    return _moneyTextController.text;
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
