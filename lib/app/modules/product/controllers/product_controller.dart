import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/app/data/models/product.dart';
import 'package:delivery_app/app/data/models/store.dart';
import 'package:delivery_app/app/data/models/user.dart';
import 'package:delivery_app/app/data/providers/request_provider.dart';
import 'package:delivery_app/app/data/repository/request_repository.dart';
import 'package:delivery_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:delivery_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  ProductModel product;
  TextEditingController messageTextController = TextEditingController();

  final _amount = 1.obs;

  int get amount => _amount.value;

  final isAdded = false.obs;
  final isFavorite = false.obs; // TODO: get if product is favorite
  UserModel user;
  StoreModel store;

  @override
  void onInit() {
    product = Get.arguments['product'];
    user = Get.arguments['user'];
    store = Get.arguments['store'];
    super.onInit();
  }

  void onAmountAddPressed() => _amount.value++;

  void onAmountRemovePressed() {
    if (_amount.value > 1) _amount.value--;
  }

  // var meuRx = Rx<String>().bindStream(stream)

  void onAddPressed() {
    var cartController;
    if (Get.isRegistered<CartController>())
      cartController = Get.find<CartController>();
    else
      cartController = Get.put(
          CartController(
            requestRepository: RequestRepository(
              provider: RequestProvider(
                firestore: FirebaseFirestore.instance,
              ),
            ),
          ),
          permanent: true);

    //TODO: A partir daqui ta tudo quebrado >>>>
    cartController.addProductToCart(
      product,
      messageTextController.text,
      amount,
      store,
    );
    isAdded.value = true;
  }

  void onCartPressed() {
    Get.toNamed(Routes.CART, arguments: {'user': user});
  }

  void onBackPressed() {
    Get.back();
  }

  String fetchMaskedProductValue() {
    final _moneyTextController =
        new MoneyMaskedTextController(leftSymbol: 'R\$ ');
    _moneyTextController.updateValue(product.value);
    return _moneyTextController.text;
  }

  onLikePressed() {
    isFavorite.toggle();
    //TODO: Implement onLikePressed
  }
}
