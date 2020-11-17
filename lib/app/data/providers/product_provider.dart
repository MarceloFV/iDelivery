import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/app/data/models/category.dart';
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

  // Adicionar produto/editar/deletar é uma responsabilidade exclusiva da loja
  addProduct(ProductModel productModel) async {
    try {
      DocumentReference reference = await firestore
          .collection(collectionPath)
          .add(productModel.toDocument());
      return reference.id;
    } catch (_) {}
  }

  editProduct(ProductModel productModel) async {
    try {
      productModel.reference.update(productModel.toDocument());
    } catch (_) {}
  }

  deleteProduct(ProductModel productModel) async {
    try {
      await productModel.reference.delete();
    } catch (_) {}
  }

  List<ProductModel> getPopularProducts() {
    return <ProductModel>[
      ProductModel(
          imgUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTjZU_yayz_f9mUdgmdZJ0utxy72G-Ub3_pUw&usqp=CAU",
          title: "LOJINHA",
          storeName: "location",
          value: 20),
      ProductModel(
          imgUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTjZU_yayz_f9mUdgmdZJ0utxy72G-Ub3_pUw&usqp=CAU",
          title: "TEM TITULO N PORRA",
          storeName: "location",
          value: 20),
      ProductModel(
          imgUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTjZU_yayz_f9mUdgmdZJ0utxy72G-Ub3_pUw&usqp=CAU",
          title: "title",
          storeName: "location",
          value: 20),
      ProductModel(
          imgUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTjZU_yayz_f9mUdgmdZJ0utxy72G-Ub3_pUw&usqp=CAU",
          title: "title",
          storeName: "location",
          value: 20),
    ];
  }


  List<CategoryModel> getCategories() {
    return <CategoryModel>[
      CategoryModel(
          "https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg",
          "Sorvete",
          12),
      CategoryModel(
          "https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg",
          "Bolo",
          14),
      CategoryModel(
          "https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg",
          "Bolacha",
          16),
    ];
  }

  List<ProductModel> getFavoriteProduct() {
    return <ProductModel>[
      ProductModel(
        imgUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTjZU_yayz_f9mUdgmdZJ0utxy72G-Ub3_pUw&usqp=CAU",
        title: "title",
        storeName: "Restaurante man",
        category: Category.cake,
        description:
            "Nibh faucibus pellentesque ac viverra maecenas ultricies in nisl, faucibus pellentesque ac viverra ecenas ultricies in nisl",
        likes: 30,
        value: 20,
      ),
      ProductModel(
          imgUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTjZU_yayz_f9mUdgmdZJ0utxy72G-Ub3_pUw&usqp=CAU",
          title: "title",
          storeName: "location",
          value: 20),
      ProductModel(
          imgUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTjZU_yayz_f9mUdgmdZJ0utxy72G-Ub3_pUw&usqp=CAU",
          title: "title",
          storeName: "location",
          value: 20),
    ];
  }
}
