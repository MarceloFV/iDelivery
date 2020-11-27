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
    var response = await firestore
        .collection('products')
        .where('likes', isGreaterThan: 40)
        .get();

    List<ProductModel> productList = [];
    for (int i = 0; i < response.docs.length; i++) {
      productList.add(ProductModel.fromDocumentSnapshot(response.docs[i]));
    }
    return productList;
  }

  Future<List<ProductModel>> getFavoriteProduct() async {
    var response = await firestore
        .collection('products')
        .where('isFavorite', isEqualTo: true)
        .get();

    List<ProductModel> productList = [];
    for (int i = 0; i < response.docs.length; i++) {
      productList.add(ProductModel.fromDocumentSnapshot(response.docs[i]));
    }
    return productList;
  }

  Future<List<ProductModel>> getAllProducts() async {
    var response = await firestore.collection('products').get();
    List<ProductModel> productList = [];
    for (int i = 0; i < response.docs.length; i++) {
      productList.add(ProductModel.fromDocumentSnapshot(response.docs[i]));
    }
    return productList;
  }

  Future<List<ProductModel>> getAllAvailableProducts() async {
    var response = await firestore
        .collection('products')
        .where('isAvailable', isEqualTo: true)
        .get();

    List<ProductModel> productList = [];
    for (int i = 0; i < response.docs.length; i++) {
      productList.add(ProductModel.fromDocumentSnapshot(response.docs[i]));
    }
    return productList;
  }
}
