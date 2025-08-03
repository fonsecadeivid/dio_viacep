// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

// {
//   "cep": "14076-110",
//   "logradouro": "Avenida Paris",
//   "complemento": "",
//   "unidade": "",
//   "bairro": "Independência",
//   "localidade": "Ribeirão Preto",
//   "uf": "SP",
//   "estado": "São Paulo",
//   "regiao": "Sudeste",
//   "ibge": "3543402",
//   "gia": "5824",
//   "ddd": "16",
//   "siafi": "6969"
// }

class ViaCepEntity extends Equatable {
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

  ViaCepEntity({
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
  List<Object?> get props => [
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
