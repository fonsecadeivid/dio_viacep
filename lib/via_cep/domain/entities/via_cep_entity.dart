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
  final String cep;
  final String logradouro;
  final String complemento;
  final String unidade;
  final String bairro;
  final String localidade;
  final String uf;
  final String estado;
  final String regiao;
  final String ibge;
  final String gia;
  final String ddd;
  final String siafi;

  const ViaCepEntity({
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
