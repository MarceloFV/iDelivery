import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/app/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

const collectionPath = 'products';

class ProductProvider {
  final FirebaseFirestore firestore;

  ProductProvider({@required this.firestore});
  Future<List<ProductModel>> getProducts() async {
    try {
      final query =
          await firestore.collection(collectionPath).get(); // Limit(int)
      List<ProductModel> listProductModel = query.docs.map<ProductModel>((map) {
        return ProductModel.fromDocumentSnapshot(map);
      }).toList();
      return listProductModel;
    } catch (_) {
      return [];
    }
  }

  // // Adicionar produto/editar/deletar é uma responsabilidade exclusiva da loja
  // addProduct(ProductModel productModel) async {
  //   try {
  //     DocumentReference reference = await firestore
  //         .collection(collectionPath)
  //         .add(productModel.toDocument());
  //     return reference.id;
  //   } catch (_) {}
  // }

  // editProduct(ProductModel productModel) async {
  //   try {
  //     productModel.reference.update(productModel.toDocument());
  //   } catch (_) {}
  // }

  // deleteProduct(ProductModel productModel) async {
  //   try {
  //     await productModel.reference.delete();
  //   } catch (_) {}
  // }

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

  Future<List<ProductModel>> getFavoriteProduct() {
    return Future.delayed(
        Duration(seconds: 1),
        () => <ProductModel>[
              ProductModel(
                imgUrl:
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Pizza_mezzo_a_mezzo.jpg/1200px-Pizza_mezzo_a_mezzo.jpg",
                title: "Pizza dois sabores",
                storeName: "Pizzaria Italiano",
                category: CategoryType.Pizza,
                description:
                    "Nibh faucibus pellentesque ac viverra maecenas ultricies in nisl, faucibus pellentesque ac viverra ecenas ultricies in nisl",
                likes: 30,
                value: 20,
                storeId: '23hiu32h1i2',
                storeShipPrice: 3.0,
              ),
              ProductModel(
                imgUrl:
                    "https://i.pinimg.com/564x/73/cf/20/73cf20f1ea9029358bcc8b7fba39aef9.jpg",
                title: "X-bacon",
                storeName: "Biribita",
                value: 25,
                storeId: '23hiu32h1i2',
                storeShipPrice: 3.0,
              ),
              ProductModel(
                imgUrl:
                    "https://img.cybercook.com.br/receitas/6/pastel-na-airfryer-623x350.jpeg",
                title: "Pastel de carne",
                storeName: "Pastel da ana",
                value: 32,
                storeId: '312321321',
                storeShipPrice: 7.0,
              ),
            ]);
  }

  Future<List<ProductModel>> getAllProducts() async {
    var response = await firestore.collection('products').get();
    var docs = response.docs;
    List<ProductModel> productList = [];
    for (int i = 0; i < docs.length; i++) {
      productList.add(ProductModel.fromDocumentSnapshot(docs[i]));
    }
    return productList;
  }

  getAllAvailableProducts() async {
    var response = await firestore
        .collection('products')
        .get();
        // .where('isAvailable', isEqualTo: true)

    var docs = response.docs;
    List<ProductModel> productList = [];
    for (int i = 0; i < docs.length; i++) {
      productList.add(ProductModel.fromDocumentSnapshot(docs[i]));
    }
    return productList;
  }
}
