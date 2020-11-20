import 'package:delivery_app/app/data/models/product.dart';
import 'package:delivery_app/app/modules/home/widgets/product_card.dart';
import 'package:delivery_app/app/modules/home/widgets/topic_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProductListSection extends StatelessWidget {
  final RxList<ProductModel> products;
  final IconData icon;
  final Color iconBGColor;
  final String title;
  final String subtitle;

  const ProductListSection({Key key, this.products, this.icon, this.iconBGColor, this.title, this.subtitle}) : super(key: key);

  // final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopicCard(
          topicItem: TopicItem(
            Container(
              child: Icon(
                icon,
                color: Colors.white,
              ),
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: iconBGColor,
              ),
            ),
            title,
            subtitle,
          ),
        ),
        Obx(
          () => Column(
            children: products
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
