import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String imgUrl;
  String title;
  String description;
  double value;
  DocumentReference reference;

  ProductModel({
    this.imgUrl,
    this.title,
    this.description,
    this.value,
    this.reference,
  });

  factory ProductModel.fromDocumentSnapshot(DocumentSnapshot snapshot) =>
      ProductModel.fromMap(snapshot.data())
          .copyWith(reference: snapshot.reference);

  Map<String, dynamic> toMap() {
    return {
      'imgUrl': imgUrl,
      'title': title,
      'description': description,
      'value': value,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ProductModel(
      imgUrl: map['imgUrl'],
      title: map['title'],
      description: map['description'],
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  ProductModel copyWith({
    String imgUrl,
    String title,
    String description,
    double value,
    DocumentReference reference,
  }) {
    return ProductModel(
      imgUrl: imgUrl ?? this.imgUrl,
      title: title ?? this.title,
      description: description ?? this.description,
      value: value ?? this.value,
      reference: reference ?? this.reference,
    );
  }
}

enum CategoryType {
  Hamburguer,
  Pizza,
  Sorvete,
  Bolo,
  Hotdog,
  Pastel,
}

// CategoryType getCategory(String type){
//   switch (type) {
//     case 'CategoryType.Hamburguer':
//       return CategoryType.Hamburguer;
//     case 'CategoryType.Pizza':
//       return CategoryType.Pizza;
//     case 'CategoryType.Sorvete':
//       return CategoryType.Sorvete;
//     case 'CategoryType.Bolo':
//       return CategoryType.Bolo;
//     case 'CategoryType.Hotdog':
//       return CategoryType.Hotdog;
//     case 'CategoryType.Pastel':
//       return CategoryType.Pastel;
//     default:
//   }
// }
