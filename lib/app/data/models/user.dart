import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String email;
  String phoneNumber;
  String cpf;
  Address address;
  DocumentReference reference;

  UserModel({
    this.name,
    this.email,
    this.phoneNumber,
    this.address,
    this.cpf,
    this.reference,
  });

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot snapshot) =>
      UserModel(
        name: snapshot.data()['name'],
        email: snapshot.data()['email'],
        phoneNumber: snapshot.data()['phoneNumber'],
        cpf: snapshot.data()['cpf'],
        reference: snapshot.reference,
      );

  Map<String, dynamic> toDocument() {
    return {
      'name': name,
      'email': email,
      'cpf': cpf,
      'phoneNumber': phoneNumber,
    };
  }

  @override
  String toString() {
    return "'name': $name, 'adress': $address 'email': $email, 'phoneNumber' : $phoneNumber";
  }


  UserModel copyWith({
    String name,
    String email,
    String phoneNumber,
    String cpf,
    Address adress,
    DocumentReference reference,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      cpf: cpf ?? this.cpf,
      address: adress ?? this.address,
      reference: reference ?? this.reference,
    );
  }
}

class Address {
  final String bairro;
  final String rua;
  final String numero;
  final String cep;

  Address({this.bairro, this.rua, this.numero, this.cep});
}
