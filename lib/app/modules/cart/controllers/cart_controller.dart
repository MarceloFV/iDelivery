import 'package:delivery_app/app/data/models/address.dart';
import 'package:delivery_app/app/data/models/order.dart';
import 'package:delivery_app/app/data/models/product.dart';
import 'package:delivery_app/app/data/models/store.dart';
import 'package:delivery_app/app/data/models/user.dart';
import 'package:delivery_app/app/data/repository/request_repository.dart';
import 'package:delivery_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final RequestRepository requestRepository;
  CartController({
    this.requestRepository,
  });

  final _itemAmount = 0.obs;

  String get itemAmount => _itemAmount.string;

  final _orderList = <OrderModel>[].obs;
  List<OrderModel> get orderList => _orderList;

  final _productList = <ProductModel>[].obs;

  final _finalValue = 0.0.obs;
  final _shipValue = 0.0.obs;

  final _requestSent = false.obs;
  bool get requestSent => _requestSent.value;

  double get finalValue => _finalValue.value;
  double get shipValue => _shipValue.value;

  Worker worker;

  final _user = UserModel().obs;
  final _address = AddressModel().obs;


  String get userAddress => (_address.value != null)
      ? "${_address.value?.rua}, nº ${_address.value?.numero}, ${_address.value?.bairro}, ${_address.value?.cep}"
      : 'Adicionar endereço';

  @override
  void onInit() {
    _user.value = Get.arguments['user'];
    _address.value = _user.value.address;
    worker = ever(_orderList, onOrderListChanged);
    super.onInit();
  }

  // _updateShipValue(ProductModel product) {
  //   bool isRepeated = false;
  //   _productList.forEach((p) {
  //     if (p.storeId == product.storeId) {
  //       isRepeated = true;
  //     }
  //   });
  //   if (isRepeated) return;
  //   _shipValue.value += product.storeShipPrice;
  // }

  void onAddressPressed() async {
    var val =
        await Get.toNamed(Routes.ADDRESS, arguments: {'address': _address.value});

    if (val != null) _address.value = val;
  }

  onOrderListChanged(nOrderList) {
    var total = 0.0;
    nOrderList.forEach((order) => total += order.value);
    _finalValue.value = total + shipValue;
  }

  void addProductToCart(ProductModel product, String message, int amount, StoreModel store) {
    if (_productList.contains(product)) {
      _addExistingProduct(product, amount);
    } else {
      _addNewProduct(product, message, amount, store);
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

  _addNewProduct(ProductModel product, String message, int amount, StoreModel store) {
    OrderModel order = OrderModel(
      product: product,
      amount: amount,
      message: message,
      value: (product.value * amount),
      store: store
    );
    orderList.add(order);
    // _updateShipValue(product);
    _productList.add(product);
  }

  void onAmountRemovePressed(OrderModel _order) {
    if (!(_order.amount > 1)) return;
    var index = orderList.indexOf(_order);
    _order.amount--;
    _order.value -= _order.product.value;
    _orderList[index] = _order;
  }

  void onAmountAddPressed(OrderModel _order) {
    var index = orderList.indexOf(_order);
    _order.value += _order.product.value;
    _order.amount++;
    _orderList[index] = _order;
  }

  void onRemoveOrderPressed(OrderModel _order) {
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

  // onConfirmOrderPressed() {
  //   repository.add(orderList, null);
  //   print('Order confirmada');
  // }

  onConfirmOrderPressed() async {
    if (orderList.isEmpty)
      return Get.snackbar(
        'Nenhum produto',
        'Por favor adicionar produtos',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        dismissDirection: SnackDismissDirection.HORIZONTAL,
      );
    // _requestSent.toggle();
    //TODO: Implement to send request
    await requestRepository.send(orderList, _user.value);

    Get.snackbar(
      'Pedido enviado',
      'Acesse a pagina de pedidos para acompanhar',
      snackPosition: SnackPosition.BOTTOM,
      dismissDirection: SnackDismissDirection.HORIZONTAL,
    );
  }

  onRequestPagePressed() {
    //TODO: Navigate to RequestPage
    Get.snackbar(
      'Aguarde',
      'Acesse a pagina de pedidos para acompanhar',
      snackPosition: SnackPosition.BOTTOM,
      dismissDirection: SnackDismissDirection.HORIZONTAL,
    );
    // _requestSent.toggle();
  }
}
