// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:convert';

import 'package:equatable/equatable.dart';

class PutCepBackForAppEntity extends Equatable {
  String objectId;
  String cep;
  String logradouro;
  String complemento;
  String unidade;
  String bairro;
  String localidade;
  String uf;
  String estado;
  String regiao;
  String ibge;
  String gia;
  String ddd;
  String siafi;

  PutCepBackForAppEntity({
    required this.objectId,
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.unidade,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.estado,
    required this.regiao,
    required this.ibge,
    required this.gia,
    required this.ddd,
    required this.siafi,
  });

  @override
  List<Object> get props {
    return [
      objectId,
      cep,
      logradouro,
      complemento,
      unidade,
      bairro,
      localidade,
      uf,
      estado,
      regiao,
      ibge,
      gia,
      ddd,
      siafi,
    ];
  }

  PutCepBackForAppEntity copyWith({
    String? objectId,
    String? cep,
    String? logradouro,
    String? complemento,
    String? unidade,
    String? bairro,
    String? localidade,
    String? uf,
    String? estado,
    String? regiao,
    String? ibge,
    String? gia,
    String? ddd,
    String? siafi,
  }) {
    return PutCepBackForAppEntity(
      objectId: objectId ?? this.objectId,
      cep: cep ?? this.cep,
      logradouro: logradouro ?? this.logradouro,
      complemento: complemento ?? this.complemento,
      unidade: unidade ?? this.unidade,
      bairro: bairro ?? this.bairro,
      localidade: localidade ?? this.localidade,
      uf: uf ?? this.uf,
      estado: estado ?? this.estado,
      regiao: regiao ?? this.regiao,
      ibge: ibge ?? this.ibge,
      gia: gia ?? this.gia,
      ddd: ddd ?? this.ddd,
      siafi: siafi ?? this.siafi,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'objectId': objectId,
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'unidade': unidade,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
      'estado': estado,
      'regiao': regiao,
      'ibge': ibge,
      'gia': gia,
      'ddd': ddd,
      'siafi': siafi,
    };
  }

  factory PutCepBackForAppEntity.fromMap(Map<String, dynamic> map) {
    return PutCepBackForAppEntity(
      objectId: map['objectId'] as String,
      cep: map['cep'] as String,
      logradouro: map['logradouro'] as String,
      complemento: map['complemento'] as String,
      unidade: map['unidade'] as String,
      bairro: map['bairro'] as String,
      localidade: map['localidade'] as String,
      uf: map['uf'] as String,
      estado: map['estado'] as String,
      regiao: map['regiao'] as String,
      ibge: map['ibge'] as String,
      gia: map['gia'] as String,
      ddd: map['ddd'] as String,
      siafi: map['siafi'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PutCepBackForAppEntity.fromJson(String source) =>
      PutCepBackForAppEntity.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  bool get stringify => true;
}
