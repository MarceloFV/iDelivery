import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String email;
  String phoneNumber;
  Adress adress;
  bool isStore;
  DocumentReference reference;

  UserModel({
    this.name,
    this.email,
    this.phoneNumber,
    this.adress,
    this.isStore = false,
    this.reference,
  });

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot snapshot) =>
      UserModel(
        name: snapshot.data()['name'],
        email: snapshot.data()['email'],
        phoneNumber: snapshot.data()['phoneNumber'],
        isStore: snapshot.data()['isStore'],
        reference: snapshot.reference,
      );

  Map<String, dynamic> toDocument() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'isStore': isStore,
    };
  }

  @override
  String toString() {
    return "'name': $name, 'adress': $adress 'email': $email, 'phoneNumber' : $phoneNumber, 'isStore': $isStore";
  }

  UserModel copyWith({
    String name,
    String email,
    String phoneNumber,
    bool isStore,
    DocumentReference storeReference,
    DocumentReference reference,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isStore: isStore ?? this.isStore,
      reference: reference ?? this.reference,
    );
  }
}

class Adress {
  final String bairro;
  final String rua;
  final String numero;
  final String cep;

  Adress({this.bairro, this.rua, this.numero, this.cep});

}
