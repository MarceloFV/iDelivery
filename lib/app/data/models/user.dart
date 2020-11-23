import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String name;
  String email;
  String phoneNumber;
  Address adress;
  bool isStore;
  DocumentReference reference;

  UserModel({
    this.id,
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
        id: snapshot.id
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

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is UserModel &&
      o.id == id &&
      o.name == name &&
      o.email == email &&
      o.phoneNumber == phoneNumber &&
      o.adress == adress &&
      o.isStore == isStore &&
      o.reference == reference;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      phoneNumber.hashCode ^
      adress.hashCode ^
      isStore.hashCode ^
      reference.hashCode;
  }
}

class Address {
  final String bairro;
  final String rua;
  final String numero;
  final String cep;

  Address({this.bairro, this.rua, this.numero, this.cep});
}
