import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/app/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

const collectionPath = 'products';

class ProductProvider {
  final FirebaseFirestore firestore;

  ProductProvider({@required this.firestore});

  Future<List<ProductModel>> getPopularProducts() async {
    var response = await firestore
        .collection('products')
        .where('likes', isGreaterThan: 40)
        .get();
    List<ProductModel> productList = response.docs
        .map<ProductModel>((map) => ProductModel.fromDocumentSnapshot(map))
        .toList();
    return productList;
  }

  Future<List<ProductModel>> getFavoriteProduct() async {
    var response = await firestore
        .collection('products')
        .where('isFavorite', isEqualTo: true)
        .get();

    List<ProductModel> productList = response.docs
        .map<ProductModel>((map) => ProductModel.fromDocumentSnapshot(map))
        .toList();

    return productList;
  }

  Future<List<ProductModel>> getAllProducts() async {
    var response = await firestore.collection('products').get();
    List<ProductModel> productList = response.docs
        .map<ProductModel>((map) => ProductModel.fromDocumentSnapshot(map))
        .toList();

    return productList;
  }

  Future<List<ProductModel>> getAllAvailableProducts() async {
    var response = await firestore
        .collection('products')
        .where('isAvailable', isEqualTo: true)
        .get();

    List<ProductModel> productList = response.docs
        .map<ProductModel>((map) => ProductModel.fromDocumentSnapshot(map))
        .toList();

    return productList;
  }
}
