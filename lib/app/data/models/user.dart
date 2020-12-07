import 'dart:convert';

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
      UserModel.fromMap(snapshot.data())
          .copyWith(reference: snapshot.reference);


Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'cpf': cpf,
      'address': address?.toMap(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserModel(
      name: map['name'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      cpf: map['cpf'],
      address: Address.fromMap(map['address']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'bairro': bairro,
      'rua': rua,
      'numero': numero,
      'cep': cep,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Address(
      bairro: map['bairro'],
      rua: map['rua'],
      numero: map['numero'],
      cep: map['cep'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source));
}
