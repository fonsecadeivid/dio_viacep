// ignore_for_file: public_member_api_docs, sort_constructors_first, overridden_fields, annotate_overrides
import 'dart:convert';

import 'package:dio_viacep/via_cep/domain/entities/via_cep_entity.dart';
import 'package:flutter/material.dart';

class ViaCepModel extends ViaCepEntity {
  const ViaCepModel({
    required super.cep,
    required super.logradouro,
    required super.complemento,
    required super.unidade,
    required super.bairro,
    required super.localidade,
    required super.uf,
    required super.estado,
    required super.regiao,
    required super.ibge,
    required super.gia,
    required super.ddd,
    required super.siafi,
  });

  ViaCepModel copyWith({
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
    return ViaCepModel(
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

  factory ViaCepModel.fromMap(Map<String, dynamic> map) {
    if (map['erro'] == true) {
      throw Exception('CEP não encontrado');
    }

    debugPrint('Mapeando dados: $map'); // Debug log

    return ViaCepModel(
      cep: (map['cep'] ?? '').toString(),
      logradouro: (map['logradouro'] ?? '').toString(),
      complemento: (map['complemento'] ?? '').toString(),
      unidade: (map['unidade'] ?? '').toString(),
      bairro: (map['bairro'] ?? '').toString(),
      localidade: (map['localidade'] ?? '').toString(),
      uf: (map['uf'] ?? '').toString(),
      estado: (map['estado'] ?? '').toString(),
      regiao: (map['regiao'] ?? '').toString(),
      ibge: (map['ibge'] ?? '').toString(),
      gia: (map['gia'] ?? '').toString(),
      ddd: (map['ddd'] ?? '').toString(),
      siafi: (map['siafi'] ?? '').toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ViaCepModel.fromJson(String source) =>
      ViaCepModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ViaCepModel(cep: $cep, logradouro: $logradouro, complemento: $complemento, unidade: $unidade, bairro: $bairro, localidade: $localidade, uf: $uf, estado: $estado, regiao: $regiao, ibge: $ibge, gia: $gia, ddd: $ddd, siafi: $siafi)';
  }

  @override
  bool operator ==(covariant ViaCepModel other) {
    if (identical(this, other)) return true;

    return other.cep == cep &&
        other.logradouro == logradouro &&
        other.complemento == complemento &&
        other.unidade == unidade &&
        other.bairro == bairro &&
        other.localidade == localidade &&
        other.uf == uf &&
        other.estado == estado &&
        other.regiao == regiao &&
        other.ibge == ibge &&
        other.gia == gia &&
        other.ddd == ddd &&
        other.siafi == siafi;
  }

  @override
  int get hashCode {
    return cep.hashCode ^
        logradouro.hashCode ^
        complemento.hashCode ^
        unidade.hashCode ^
        bairro.hashCode ^
        localidade.hashCode ^
        uf.hashCode ^
        estado.hashCode ^
        regiao.hashCode ^
        ibge.hashCode ^
        gia.hashCode ^
        ddd.hashCode ^
        siafi.hashCode;
  }
}
