// ignore_for_file: use_super_parameters

import 'package:dio_viacep/via_cep/domain/entities/cep_back_for_app_entity.dart';

class CepBackForAppModel extends CepBackForAppEntity {
  const CepBackForAppModel({List<Cep>? results}) : super(results: results);

  factory CepBackForAppModel.fromJson(Map<String, dynamic> json) {
    return CepBackForAppModel(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Cep.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'results': results?.map((e) => e.toJson()).toList()};
  }
}
