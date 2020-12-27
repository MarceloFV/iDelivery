import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/app/data/models/address.dart';

class UserModel {
  String name;
  String email;
  String phoneNumber;
  String cpf;
  AddressModel address;
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
      address: AddressModel.fromMap(map['address']),
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
    AddressModel adress,
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
