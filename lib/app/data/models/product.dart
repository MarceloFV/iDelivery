import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/app/data/models/store.dart';

enum Category {
  icecream,
  cookie,
  cake,
}

class ProductModel {
  String imgUrl;
  String title;
  String description;
  String storeName;
  Category category;
  double value;
  StoreModel store;
  // bool isFavorite;
  int likes; // Indica quantas pessoas clicaram no favorito
  DocumentReference storeReference;
  DocumentReference reference;

  ProductModel({
    this.imgUrl,
    this.title,
    this.description,
    this.storeName,
    this.value,
    // this.isFavorite,
    this.likes,
    this.category,
    this.store,
    this.storeReference,
    this.reference,
  });

  factory ProductModel.fromDocumentSnapshot(DocumentSnapshot snapshot) =>
      ProductModel(
          imgUrl: snapshot.data()['imgUrl'],
          title: snapshot.data()['name'],
          description: snapshot.data()['description'],
          storeName: snapshot.data()['storeName'],
          category: snapshot.data()['category'],
          // isFavorite: snapshot.data()['isFavorite'],
          likes: snapshot.data()['likes'],
          value: snapshot.data()['value'],
          store: snapshot.data()['store'],
          storeReference: snapshot.data()['storeReference'],
          reference: snapshot.reference);

  Map<String, dynamic> toDocument() {
    return {
      'imgUrl': imgUrl,
      'title': title,
      'description': description,
      'storeName': storeName,
      'category': category,
      'value': value,
      'store' : store,
      // 'isFavorite': isFavorite,
      'likes': likes,
      'storeReference': storeReference,
    };
  }
}
