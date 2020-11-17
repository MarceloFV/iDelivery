import 'package:delivery_app/app/data/models/product.dart';
import 'package:delivery_app/app/modules/home/controllers/home_controller.dart';
import 'package:delivery_app/app/modules/home/widgets/product_card.dart';
import 'package:delivery_app/app/modules/home/widgets/topic_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';


class PopularSection extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopicCard(
          topicItem: TopicItem(
              Container(
                child: Icon(
                  Icons.star,
                  color: Colors.white,
                ),
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.yellow,
                ),
              ),
              "Populares",
              "A galera curtiu"),
        ),
        Obx(
          () => Column(
            children: controller.popularProducts
                .map(
                  (ProductModel product) => ProductCard(
                    product: product,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
