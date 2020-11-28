import 'package:delivery_app/app/data/models/order.dart';
import 'package:delivery_app/app/data/models/product.dart';
import 'package:delivery_app/app/data/models/user.dart';
import 'package:delivery_app/app/data/repository/request_repository.dart';
import 'package:delivery_app/app/global_controllers/app_controller.dart';
import 'package:delivery_app/app/routes/app_pages.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';

class CartController extends GetxController {

final RequestRepository repository;
  CartController({this.repository});

  final _itemAmount = 0.obs;

  AppController appController = Get.find<AppController>();


  String get itemAmount => _itemAmount.string;

  final _orderList = <OrderModel>[].obs;
  List<OrderModel> get orderList => _orderList;

  final _productList = <ProductModel>[].obs;

  final _finalValue = 0.0.obs;
  final _shipValue = 0.0.obs;

  double get finalValue => _finalValue.value;
  double get shipValue => _shipValue.value;

  Worker worker;

  
  final _user = UserModel().obs;

  final _adress = Address().obs;
  String get userAdress =>
      "${_adress.value.rua}, nº ${_adress.value.numero}, ${_adress.value.bairro}, ${_adress.value.cep}";

  @override
  void onInit() {
    _fetchUser();
    _adress.value = _user.value.adress;
    worker = ever(_orderList, onOrderListChanged);
    super.onInit();
  }

  _updateShipValue(ProductModel product) {
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
    OrderModel order = OrderModel(
      product: product,
      amount: amount,
      message: message,
      value: (product.value * amount),
    );
    orderList.add(order);
    _updateShipValue(product);
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

  onConfirmOrderPressed() {
    repository.add(orderList, null);
    print('Order confirmada');
  }
}
