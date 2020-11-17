import 'package:delivery_app/app/data/models/product.dart';
import 'package:delivery_app/app/modules/home/controllers/home_controller.dart';
import 'package:delivery_app/app/modules/home/widgets/product_card.dart';
import 'package:delivery_app/app/modules/home/widgets/topic_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FavoritesSection extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopicCard(
          topicItem: TopicItem(
              Container(
                child: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.red,
                ),
              ),
              "Favoritos",
              "Você mais gosta"),
        ),
        Obx(
          () => Column(
            children: controller.favoriteProducts
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