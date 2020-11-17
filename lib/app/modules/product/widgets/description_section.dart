import 'package:delivery_app/app/modules/product/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DescriptionSection extends GetView<ProductController> {
  final String description;

  DescriptionSection(this.description);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        description ?? "Nenhuma descrição fornecida",
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      ),
    );
  }
}
