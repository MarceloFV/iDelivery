class CategoryModel {
  final String imgUrl;
  final String categoryName;
  final Category type;

  CategoryModel(this.imgUrl, this.categoryName, this.type);
}

final categoryList = <CategoryModel>[
  CategoryModel(
      'assets/images/hamburguer.jpg', "Hamburguer", Category.Hamburguer),
  CategoryModel('assets/images/ice_cream.jpg', "Sorvete", Category.Sorvete),
  CategoryModel(
      'assets/images/hot_dog.jpg', "Cachorro quente", Category.Hotdog),
  CategoryModel('assets/images/pastel.jpg', "Pasteis", Category.Pastel),
];

enum Category {
  Hamburguer,
  Pizza,
  Sorvete,
  Bolo,
  Hotdog,
  Pastel,
}
