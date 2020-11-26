import 'package:delivery_app/app/data/models/product.dart';

class CategoryModel {
  final String imgUrl;
  final String categoryName;
  final CategoryType type;
  final bool isAvailable;

  CategoryModel(this.imgUrl, this.categoryName, this.type, [this.isAvailable]);
}

final categoryList = <CategoryModel>[
  CategoryModel(
    'assets/images/hamburguer.jpg',
    "Hamburguer",
    CategoryType.Hamburguer,
    true,
  ),
  CategoryModel(
    'assets/images/ice_cream.jpg',
    "Sorvete",
    CategoryType.Sorvete,
    false,
  ),
  CategoryModel(
    'assets/images/hot_dog.jpg',
    "Cachorro quente",
    CategoryType.Hotdog,
    true,
  ),
  CategoryModel(
    'assets/images/pastel.jpg',
    "Pasteis",
    CategoryType.Pastel,
    true,
  ),
];
