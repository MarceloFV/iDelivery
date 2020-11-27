import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String id;
  String imgUrl;
  String title;
  String description;
  CategoryType category;
  double value;
  String storeId;
  String storeName;
  double storeShipPrice;
  bool isFavorite;
  bool isAvailable;
  int likes;
  DocumentReference storeReference;
  DocumentReference reference;

  ProductModel({
    this.id,
    this.imgUrl,
    this.title,
    this.description,
    this.storeName,
    this.value,
    this.likes,
    this.isAvailable,
    this.category,
    this.isFavorite,
    this.storeId,
    this.storeShipPrice,
    this.storeReference,
    this.reference,
  });

  factory ProductModel.fromDocumentSnapshot(DocumentSnapshot snapshot) =>
      ProductModel(
        id: snapshot.data()['id'],
        imgUrl: snapshot.data()['imgUrl'],
        title: snapshot.data()['title'],
        description: snapshot.data()['description'],
        storeName: snapshot.data()['storeName'],
        category: snapshot.data()['category'],
        isFavorite: snapshot.data()['isFavorite'],
        isAvailable: snapshot.data()['isAvailable'],
        likes: snapshot.data()['likes'],
        storeId: snapshot.data()['storeId'],
        storeShipPrice: snapshot.data()['storeShipPrice'],
        value: snapshot.data()['value'],
        storeReference: snapshot.data()['storeReference'],
        reference: snapshot.reference,
      );

  Map<String, dynamic> toDocument() {
    return {
      'id': id,
      'imgUrl': imgUrl,
      'title': title,
      'description': description,
      'storeName': storeName,
      'category': category,
      'isFavorite': isFavorite,
      'isAvailable': isAvailable,
      'likes': likes,
      'storeId': storeId,
      'storeShipPrice': storeShipPrice,
      'value': value,
      'storeReference': storeReference,
    };
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is ProductModel &&
      o.id == id &&
      o.imgUrl == imgUrl &&
      o.title == title &&
      o.description == description &&
      o.category == category &&
      o.value == value &&
      o.storeId == storeId &&
      o.storeName == storeName &&
      o.storeShipPrice == storeShipPrice &&
      o.isFavorite == isFavorite &&
      o.isAvailable == isAvailable &&
      o.likes == likes &&
      o.storeReference == storeReference &&
      o.reference == reference;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      imgUrl.hashCode ^
      title.hashCode ^
      description.hashCode ^
      category.hashCode ^
      value.hashCode ^
      storeId.hashCode ^
      storeName.hashCode ^
      storeShipPrice.hashCode ^
      isFavorite.hashCode ^
      isAvailable.hashCode ^
      likes.hashCode ^
      storeReference.hashCode ^
      reference.hashCode;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imgUrl': imgUrl,
      'title': title,
      'description': description,
      'category': category.toString(),
      'value': value,
      'storeId': storeId,
      'storeName': storeName,
      'storeShipPrice': storeShipPrice,
      'isFavorite': isFavorite,
      'isAvailable': isAvailable,
      'likes': likes,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ProductModel(
      id: map['id'],
      imgUrl: map['imgUrl'],
      title: map['title'],
      description: map['description'],
      category: map['category'],
      value: map['value'],
      storeId: map['storeId'],
      storeName: map['storeName'],
      storeShipPrice: map['storeShipPrice'],
      isFavorite: map['isFavorite'],
      isAvailable: map['isAvailable'],
      likes: map['likes'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));
}

enum CategoryType {
  Hamburguer,
  Pizza,
  Sorvete,
  Bolo,
  Hotdog,
  Pastel,
}
