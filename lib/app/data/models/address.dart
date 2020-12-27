
import 'dart:convert';

class AddressModel {
  final String bairro;
  final String rua;
  final String numero;
  final String cep;

  AddressModel({this.bairro, this.rua, this.numero, this.cep});

  Map<String, dynamic> toMap() {
    return {
      'bairro': bairro,
      'rua': rua,
      'numero': numero,
      'cep': cep,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AddressModel(
      bairro: map['bairro'],
      rua: map['rua'],
      numero: map['numero'],
      cep: map['cep'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AddressModel(bairro: $bairro, rua: $rua, numero: $numero, cep: $cep)';
  }
}
