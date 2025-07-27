import 'package:dio/dio.dart';
import 'package:dio_viacep/core/errors/exceptions.dart';
import 'package:dio_viacep/via_cep/infra/datasource/via_cep_datasource.dart';
import 'package:dio_viacep/via_cep/infra/model/via_cep_model.dart';
import 'package:flutter/material.dart';

class ViaCepDatasourceImpl implements IViaCepDatasource {
  Dio dio = Dio();

  ViaCepDatasourceImpl() {
    dio.options.baseUrl = 'https://viacep.com.br/ws/';
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 5);
  }

  @override
  Future<ViaCepModel> getAddressByCep({required String cep}) async {
    try {
      // Remove caracteres não numéricos do CEP
      final cleanCep = cep.replaceAll(RegExp(r'[^\d]'), '');

      final response = await dio.get('$cleanCep/json');

      if (response.statusCode == 200) {
        final data = response.data;
        debugPrint('Dados recebidos da API: $data'); // Debug log

        final model = ViaCepModel.fromMap(data);
        debugPrint('Modelo criado: ${model.toString()}'); // Debug log

        return model;
      } else {
        throw ViaCepException();
      }
    } catch (e) {
      debugPrint('Erro no datasource: $e'); // Debug log
      throw ViaCepException();
    }
  }
}
