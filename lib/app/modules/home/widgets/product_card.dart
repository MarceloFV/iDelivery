import 'package:delivery_app/app/data/models/product.dart';
import 'package:delivery_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  final HomeController controller = Get.find<HomeController>();

  ProductCard({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.4,
      child: ListTile(
        onTap: () => controller.gotoProductPage(product),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            product.imgUrl,
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(product.title, style: GoogleFonts.catamaran(fontSize: 18)),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.location_on,
              color: Colors.redAccent,
              size: 13,
            ),
            SizedBox(width: 2,),
            Text(
              product.storeName,
              style: GoogleFonts.markaziText(),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              controller.maskedProductValue(
                product.value,
              ),
              style: GoogleFonts.markaziText(fontSize: 16),
              // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
