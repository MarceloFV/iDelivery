import 'package:delivery_app/app/data/models/category.dart';
import 'package:delivery_app/app/data/models/product.dart';

const baseUrl = 'http://gerador-nomes.herokuapp.com/nomes/10';

class MockedProductProvider {
  Future<List<ProductModel>> getPopularProducts() async {
    var list = <ProductModel>[
      ProductModel(
          // https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Pizza_mezzo_a_mezzo.jpg/1200px-Pizza_mezzo_a_mezzo.jpg
          imgUrl:
              "https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Pizza_mezzo_a_mezzo.jpg/1200px-Pizza_mezzo_a_mezzo.jpg",
          title: "Pizza",
          storeName: "Ponta da rua",
          value: 20),
      ProductModel(
          imgUrl:
              "https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Pizza_mezzo_a_mezzo.jpg/1200px-Pizza_mezzo_a_mezzo.jpg",
          title: "Pizza",
          storeName: "Ponta da rua",
          value: 20),
      ProductModel(
          imgUrl:
              "https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Pizza_mezzo_a_mezzo.jpg/1200px-Pizza_mezzo_a_mezzo.jpg",
          title: "Pizza",
          storeName: "Ponta da rua",
          value: 20),
      ProductModel(
          imgUrl:
              "https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Pizza_mezzo_a_mezzo.jpg/1200px-Pizza_mezzo_a_mezzo.jpg",
          title: "Pizza",
          storeName: "Ponta da rua",
          value: 20),
    ];

    return Future.delayed(Duration(seconds: 1), () => list);
  }

  Future<List<ProductModel>> getProductsByCategory(CategoryModel category) {
    
    return Future.delayed(Duration(seconds: 1), () => []);
  }

  Future<List<ProductModel>> getFavoriteProduct() {
    return Future.delayed(
        Duration(seconds: 1),
        () => <ProductModel>[
              ProductModel(
                imgUrl:
                    "https://i.pinimg.com/564x/73/cf/20/73cf20f1ea9029358bcc8b7fba39aef9.jpg",
                title: "X-bacon",
                storeName: "Biribita",
                value: 10,
                storeId: '23hiu32h1i2',
                storeShipPrice: 3.0,
              ),
              ProductModel(
                imgUrl:
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Pizza_mezzo_a_mezzo.jpg/1200px-Pizza_mezzo_a_mezzo.jpg",
                title: "Pizza dois sabores",
                storeName: "Pizzaria Italiano",
                category: Category.Pizza,
                description:
                    "Nibh faucibus pellentesque ac viverra maecenas ultricies in nisl, faucibus pellentesque ac viverra ecenas ultricies in nisl",
                likes: 30,
                value: 25,
                storeId:
                    '23hiu32h1i2', //TODO: Trocar o id para ver se fazem 3 requests
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
              ),
            ]);
  }
}
