// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import 'package:dio_viacep/via_cep/domain/entities/cep_back_for_app_entity.dart';

class CepBackForAppParams extends Equatable {
  final Cep cep;

  const CepBackForAppParams({required this.cep});

  @override
  List<Object> get props => [cep];

  Map<String, dynamic> toJson() {
    return {
      'cep': cep.cep,
      'logradouro': cep.logradouro,
      'complemento': cep.complemento,
      'unidade': cep.unidade,
      'bairro': cep.bairro,
      'localidade': cep.localidade,
      'uf': cep.uf,
      'estado': cep.estado,
      'regiao': cep.regiao,
      'ibge': cep.ibge,
      'gia': cep.gia,
      'ddd': cep.ddd,
      'siafi': cep.siafi,
    };
  }
}
