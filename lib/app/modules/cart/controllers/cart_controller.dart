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
    _orderList.assignAll(orderListMocked);
    super.onInit();
  }

  onAmountRemovePressed() {
    print('remove');
  }

  onAmountAddPressed() {
    print('add');
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
    // teste
  }

  void searchOrderIndex(Order order) {
    print(orderList.indexOf(order));
  }
}

class Order {
  final ProductModel product;
  final int amount;
  final double value;

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
