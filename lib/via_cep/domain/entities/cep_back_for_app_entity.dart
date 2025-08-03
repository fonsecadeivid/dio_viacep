import 'package:equatable/equatable.dart';

class CepBackForAppEntity extends Equatable {
  final List<Cep>? results;

  const CepBackForAppEntity({this.results});

  @override
  List<Object?> get props => [results];
}

class Cep {
  String? objectId;
  String? cep;
  String? logradouro;
  String? complemento;
  String? unidade;
  String? bairro;
  String? localidade;
  String? uf;
  String? estado;
  String? regiao;
  String? ibge;
  String? gia;
  String? ddd;
  String? siafi;
  String? createdAt;
  String? updatedAt;

  Cep({
    this.objectId,
    this.cep,
    this.logradouro,
    this.complemento,
    this.unidade,
    this.bairro,
    this.localidade,
    this.uf,
    this.estado,
    this.regiao,
    this.ibge,
    this.gia,
    this.ddd,
    this.siafi,
    this.createdAt,
    this.updatedAt,
  });

  factory Cep.fromJson(Map<String, dynamic> json) => Cep(
    objectId: json['objectId'],
    cep: json['cep'],
    logradouro: json['logradouro'],
    complemento: json['complemento'],
    unidade: json['unidade'],
    bairro: json['bairro'],
    localidade: json['localidade'],
    uf: json['uf'],
    estado: json['estado'],
    regiao: json['regiao'],
    ibge: json['ibge'],
    gia: json['gia'],
    ddd: json['ddd'],
    siafi: json['siafi'],
    createdAt: json['createdAt'],
    updatedAt: json['updatedAt'],
  );

  Map<String, dynamic> toJson() => {
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
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}
