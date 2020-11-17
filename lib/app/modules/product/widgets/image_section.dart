import 'package:delivery_app/app/modules/product/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageSection extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                child: Image.network(
                  //TODO: Efeito caroulsel sera implementado aqui
                  controller.product.imgUrl,
                  height: 310.0,
                  fit: BoxFit.cover,
                ),
              ),
            );
  }
}