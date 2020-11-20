import 'package:delivery_app/app/data/models/user.dart';
import 'package:delivery_app/app/global_controllers/app_controller.dart';
import 'package:delivery_app/app/routes/app_pages.dart';
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
  final _shipValue = 0.0.obs;

  double get finalValue => _finalValue.value;
  double get shipValue => _shipValue.value;

  Worker worker;

  AppController appController = Get.find<AppController>();
  final _user = UserModel().obs;

  final _adress = Address().obs;
  String get userAdress =>
      "${_adress.value.rua} n${_adress.value.numero}, ${_adress.value.bairro}, ${_adress.value.cep}";

  // String get userAdress =>
  // "${_user.value.adress.rua} n${_user.value.adress.numero}, ${_user.value.adress.bairro}, ${_user.value.adress.cep}";

  @override
  void onInit() {
    _fetchUser();
    _adress.value = _user.value.adress;
    worker = ever(_orderList, onOrderListChanged);
    super.onInit();
  }

  updateShipValue(ProductModel product) {
    bool isRepeated = false;
    _productList.forEach((p) {
      if (p.storeId == product.storeId) {
        isRepeated = true;
      }
    });
    if (isRepeated) return;
    _shipValue.value += product.storeShipPrice;
  }

  void onAdressPressed() async {
    var val = await Get.toNamed(Routes.ADRESS,
        arguments: {'adress': _user.value.adress});
    if (val != null) _adress.value = val;
  }

  _fetchUser() {
    _user.value = appController.user;
  }

  // String getFormatedUserDefaultAdress() {
  //   Adress adress = _user.value.adress;

  //   return ;
  // }

  onOrderListChanged(nOrderList) {
    var total = 0.0;
    nOrderList.forEach((order) => total += order.value);
    _finalValue.value = total + shipValue;
  }

  void addProductToCart(ProductModel product, String message, int amount) {
    if (_productList.contains(product)) {
      _addExistingProduct(product, amount);
    } else {
      _addNewProduct(product, message, amount);
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

  _addNewProduct(ProductModel product, String message, int amount) {
    Order order = Order(
      product: product,
      amount: amount,
      message: message,
      value: (product.value * amount),
    );
    orderList.add(order);
    updateShipValue(product);
    _productList.add(product);
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

  onConfirmOrderPressed() {
    // TODO: Implement confirmOrder
    print('Order confirmada');
  }
}

class Order {
  ProductModel product;
  String message;
  int amount;
  double value;

  Order({this.product, this.amount, this.message, this.value});

  Order copyWith({
    ProductModel product,
    int amount,
    String message,
    double value,
  }) {
    return Order(
      product: product ?? this.product,
      amount: amount ?? this.amount,
      message: message ?? this.message,
      value: value ?? this.value,
    );
  }
}

//TODO: Deletar a lista mockada
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
