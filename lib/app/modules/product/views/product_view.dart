import 'package:delivery_app/app/global_widgets/amount_selector.dart';
import 'package:delivery_app/app/global_widgets/custom_blue_button.dart';
import 'package:delivery_app/app/modules/product/controllers/product_controller.dart';
import 'package:delivery_app/app/modules/product/widgets/description_section.dart';
import 'package:delivery_app/app/modules/product/widgets/image_section.dart';
import 'package:delivery_app/app/modules/product/widgets/message_section.dart';
import 'package:delivery_app/app/modules/product/widgets/title_and_price_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductView extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        controller.product.storeName.toUpperCase(),
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
      leading: IconButton(
        onPressed: () => controller.onBackPressed(),
        icon: Icon(Icons.arrow_back_ios),
        color: Colors.black,
        iconSize: 12,
      ),
      actions: [
        Obx(
          () => IconButton(
            icon: controller.isFavorite.value
                ? Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : Icon(
                    Icons.favorite_outline,
                    color: Colors.black,
                  ),
            onPressed: () => controller.onLikePressed(),
          ),
        ),
        // TODO: Sistema de favoritos
        // IconButton(
        //   icon: Icon(
        //     Icons.favorite_border,
        //     color: Colors.black,
        //   ),
        //   onPressed: () => controller.onFavoritePressed(),
        // ),
      ],
    );
  }

  _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: ListView(
        children: [
          ImageSection(),
          SizedBox(
            height: 25,
          ),
          TitleAndPriceSection(),
          SizedBox(
            height: 16,
          ),
          DescriptionSection(controller.product.description),
          SizedBox(
            height: 17,
          ),
          MessageSection(
            controller: controller.messageTextController,
          ),
        ],
      ),
    );
  }

  _bottomNavBar() {
    return Container(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Expanded(
              child: Obx(() => AmountSelector(
                    onAdd: controller.onAmountAddPressed,
                    onRemove: controller.onAmountRemovePressed,
                    amount: controller.amount,
                  )),
            ),
            Expanded(
              child: Obx(() => CustomBlueButton(
                    function: controller.isAdded.value
                        ? controller.onCartPressed
                        : controller.onAddPressed,
                    text: controller.isAdded.value
                        ? 'Abrir Carrinho'
                        : 'Adicionar',
                  )),
            )
          ],
        ),
      ),
    );
  }
}
