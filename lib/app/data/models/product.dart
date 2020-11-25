import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/app/data/models/category.dart';


class ProductModel {
  String id;
  String imgUrl;
  String title;
  String description;
  Category category; // talvez conflite com o categoryModel, ja que esse seria o type
  double value;
  String storeId;
  String storeName;
  double storeShipPrice;
  // bool isFavorite;
  int likes;
  DocumentReference storeReference;
  DocumentReference reference;
  // ja que tenho o referencia talvez nao necessite do id;

  ProductModel({
    this.id,
    this.imgUrl,
    this.title,
    this.description,
    this.storeName,
    this.value,
    this.likes,
    this.category,
    this.storeId,
    this.storeShipPrice,
    this.storeReference,
    this.reference,
  });

  factory ProductModel.fromDocumentSnapshot(DocumentSnapshot snapshot) =>
      ProductModel(
          id: snapshot.data()['id'],
          imgUrl: snapshot.data()['imgUrl'],
          title: snapshot.data()['name'],
          description: snapshot.data()['description'],
          storeName: snapshot.data()['storeName'],
          category: snapshot.data()['category'],
          likes: snapshot.data()['likes'],
          storeId: snapshot.data()['storeId'],
          storeShipPrice: snapshot.data()['storeShipPrice'],
          value: snapshot.data()['value'],
          storeReference: snapshot.data()['storeReference'],
          reference: snapshot.reference);

  Map<String, dynamic> toDocument() {
    return {
      'id': id,
      'imgUrl': imgUrl,
      'title': title,
      'description': description,
      'storeName': storeName,
      'category': category,
      'value': value,
      'storeId': storeId,
      'storeShipPrice': storeShipPrice,
      'likes': likes,
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
      likes.hashCode ^
      storeReference.hashCode ^
      reference.hashCode;
  }
}
