import 'package:delivery_app/app/modules/home/controllers/home_controller.dart';
import 'package:delivery_app/app/modules/home/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorySection extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child:  ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.categories.length,
            itemBuilder: (context, index) => CategoryCard(
              category: controller.categories[index],
            ),
          ),
    );
  }
}
