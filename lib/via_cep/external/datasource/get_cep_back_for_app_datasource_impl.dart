import 'package:dio/dio.dart';
import 'package:dio_viacep/core/errors/exceptions.dart';

import 'package:dio_viacep/via_cep/infra/datasource/get_cep_back_for_app_datasource.dart';
import 'package:dio_viacep/via_cep/infra/model/cep_back_for_app_model.dart';
import 'package:flutter/material.dart';

class GetCepBackForAppDatasourceImpl implements IGetCepBackForAppDatasource {
  late Dio dio;

  GetCepBackForAppDatasourceImpl() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://parseapi.back4app.com/classes',
        headers: {
          'X-Parse-Application-Id': 'gb22cnkcdtXmVGvMYvATkmWlUJDnaT5wd8vO9nCd',
          'X-Parse-REST-API-Key': 'B5UrPWSUoWOyjq1HT0HT98CTjHj4JGWr2sfB4mK0',
          'Content-Type': 'application/json',
        },
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
  }

  @override
  Future<CepBackForAppModel> getCepBackForApp() async {
    try {
      debugPrint('URL completa: ${dio.options.baseUrl}/ceps');

      final response = await dio.get('/ceps');

      if (response.statusCode == 200) {
        final data = response.data;
        debugPrint('Dados recebidos da API: $data');

        final model = CepBackForAppModel.fromJson(data);
        debugPrint('Modelo criado: ${model.toString()}');

        return model;
      } else {
        throw ServerBackForAppException(
          message: 'Erro ao buscar Lista de CEP.',
        );
      }
    } catch (e) {
      debugPrint('Erro no datasource: $e');
      throw ServerBackForAppException(message: e.toString());
    }
  }
}
