import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/app/data/models/product.dart';
import 'package:delivery_app/app/data/providers/product_provider.dart';
import 'package:delivery_app/app/modules/layout/controllers/home_controller.dart';
import 'package:delivery_app/app/modules/layout/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView {
  final MainController productController = Get.put<MainController>(
    MainController(
      productProvider: ProductProvider(
        firestore: FirebaseFirestore.instance,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => ListView.builder(
          itemCount: productController.productList.length,
          itemBuilder: (BuildContext context, int index) {
            ProductModel product = productController.productList[index];
            return ProductTile(
              product: product,
            );
          },
        ),
      ),
    );
  }
}
