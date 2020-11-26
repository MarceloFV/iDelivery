import 'package:delivery_app/app/data/models/product.dart';

const baseUrl = 'http://gerador-nomes.herokuapp.com/nomes/10';

class MockedProductProvider {
  Future<List<ProductModel>> getPopularProducts() async {
    return Future.delayed(
        Duration(seconds: 0),
        () =>
            simpleProductList.where((element) => element.likes >= 40).toList());
  }

  Future<List<ProductModel>> getProductsByCategory(CategoryType category) {
    return Future.delayed(
        Duration(seconds: 0),
        () => simpleProductList
            .where((element) => element.category == category)
            .toList());
  }

  Future<List<ProductModel>> getFavoriteProduct() {
    return Future.delayed(
        Duration(seconds: 0),
        () => simpleProductList
            .where((element) => element.isFavorite == true)
            .toList());
  }

  Future<List<ProductModel>> getAllProducts() {
    //...//
    return Future.delayed(Duration(seconds: 0), () => simpleProductList);
  }

  Future<List<ProductModel>> getAllAvailableProducts() {
    //...//
    return Future.delayed(
        Duration(seconds: 0),
        () => simpleProductList
            .where((element) => element.isAvailable == true)
            .toList());
  }
}

List<ProductModel> simpleProductList = [
  ProductModel(
    imgUrl:
        "https://i.pinimg.com/564x/73/cf/20/73cf20f1ea9029358bcc8b7fba39aef9.jpg",
    title: "X-bacon",
    storeName: "Biribita",
    value: 10,
    storeId: '23hiu32h1i2',
    category: CategoryType.Hamburguer,
    description: 'Pizza delicinha',
    id: 'xxxx1',
    isFavorite: true,
    isAvailable: true,
    likes: 30,
    storeShipPrice: 3.0,
  ),
  ProductModel(
    imgUrl:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Pizza_mezzo_a_mezzo.jpg/1200px-Pizza_mezzo_a_mezzo.jpg",
    title: "Pizza dois sabores",
    storeName: "Pizzaria Italiano",
    category: CategoryType.Pizza,
    description:
        "Nibh faucibus pellentesque ac viverra maecenas ultricies in nisl, faucibus pellentesque ac viverra ecenas ultricies in nisl",
    likes: 30,
    value: 25,
    id: 'xxxx2',
    isFavorite: true,
    isAvailable: true,
    storeId: '23hiu32h1i2',
    storeShipPrice: 3.0,
  ),
  ProductModel(
    imgUrl:
        "https://img.cybercook.com.br/receitas/6/pastel-na-airfryer-623x350.jpeg",
    title: "Pastel de carne",
    storeName: "Pastel da ana",
    value: 7,
    storeId: '312321321',
    storeShipPrice: 7.0,
    category: CategoryType.Pizza,
    description:
        "Nibh faucibus pellentesque ac viverra maecenas ultricies in nisl, faucibus pellentesque ac viverra ecenas ultricies in nisl",
    likes: 30,
    id: 'xxxx3',
    isFavorite: true,
  ),
  ProductModel(
    imgUrl:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Pizza_mezzo_a_mezzo.jpg/1200px-Pizza_mezzo_a_mezzo.jpg",
    title: "Pizza favorita 4",
    storeName: "Ponta da rua",
    value: 20,
    category: CategoryType.Pizza,
    description: 'Pizza delicosa',
    likes: 40,
    isFavorite: false,
    id: 'xxxx4',
    storeId: 'xx',
    storeShipPrice: 2,
  ),
  ProductModel(
    imgUrl:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Pizza_mezzo_a_mezzo.jpg/1200px-Pizza_mezzo_a_mezzo.jpg",
    title: "Pizza",
    storeName: "Ponta da rua favorita 3",
    value: 20,
    isFavorite: false,
    likes: 60,
  ),
  ProductModel(
      imgUrl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Pizza_mezzo_a_mezzo.jpg/1200px-Pizza_mezzo_a_mezzo.jpg",
      title: "Pizza favorita 2",
      storeName: "Ponta da rua",
      value: 20,
      isFavorite: false,
      likes: 80),
  ProductModel(
      imgUrl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Pizza_mezzo_a_mezzo.jpg/1200px-Pizza_mezzo_a_mezzo.jpg",
      title: "Pizza favorita",
      storeName: "Ponta da rua",
      value: 20,
      isFavorite: false,
      likes: 90,),
];
