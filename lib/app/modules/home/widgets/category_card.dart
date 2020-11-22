import 'package:delivery_app/app/data/models/category.dart';
import 'package:delivery_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;

  const CategoryCard({Key key, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Material(
                elevation: 1.2,
                borderRadius: BorderRadius.circular(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    category.imgUrl,
                    height: 130.0,
                    width: 130.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                "${category.categoryName}s",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
