import 'package:cloud_firestore/cloud_firestore.dart';

class StoreModel {
  String title;
  String phoneNumber;
  DocumentReference userReference;
  DocumentReference reference;

  StoreModel({
    this.title,
    this.userReference,
    this.phoneNumber,
    this.reference,
  });

  factory StoreModel.fromDocumentSnapshot(DocumentSnapshot snapshot) =>
      StoreModel(
        title: snapshot.data()['name'],
        phoneNumber: snapshot.data()['phoneNumber'],
        userReference: snapshot.data()['userReference'],
        reference: snapshot.reference,
      );

  Map<String, dynamic> toDocument() {
    return {
      'title': title,
      'phoneNumber': phoneNumber,
      'userReference':
          userReference, //Talvez nao seja necessario updatar o usuario
    };
  }

  StoreModel copyWith({
    String title,
    String phoneNumber,
    DocumentReference userReference,
    DocumentReference reference,
  }) {
    return StoreModel(
      title: title ?? this.title,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      userReference: userReference ?? this.userReference,
      reference: reference ?? this.reference,
    );
  }
}
