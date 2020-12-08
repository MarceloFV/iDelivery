import 'package:delivery_app/app/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app/app/modules/store/controllers/store_controller.dart';

class StoreView extends GetView<StoreController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => Get.back(),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                color: Colors.red,
                child: controller.store.imgUrl != null
                    ? Image.network(
                        controller.store.imgUrl,
                        height: 310.0,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/images/not-found.jpg',
                        height: 310.0,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              controller.store.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              controller.store.title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            //TODO: Category filter
            Obx(() => Column(
                  children: controller.menu
                      .map<ProductCard>(
                        (product) => ProductCard(
                          product: product,
                          onCardPressed: controller.onProductCardPressed,
                          onFavoritePressed: controller.onFavoritePressed,
                        ),
                      )
                      .toList(),
                ))
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final Function onCardPressed;
  final Function onFavoritePressed;

  ProductCard({Key key, this.product, this.onCardPressed, this.onFavoritePressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.4,
      child: ListTile(
        onTap: () => onCardPressed(product),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            color: Colors.red,
            child: product.imgUrl != null
                ? Image.network(
                    product.imgUrl,
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/images/not-found.jpg',
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        title: Text(
          product.title,
          // style: GoogleFonts.catamaran(fontSize: 18),
        ),
        subtitle: Text(product.value.toString()),
        trailing:
            IconButton(icon: Icon(Icons.favorite_outline), onPressed: onFavoritePressed),
      ),
    );
  }
}
