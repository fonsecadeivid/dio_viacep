// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:dio_viacep/core/errors/exceptions.dart';
import 'package:dio_viacep/via_cep/domain/entities/cep_back_for_app_params.dart';
import 'package:dio_viacep/via_cep/infra/datasource/datasource.dart';
import 'package:dio_viacep/via_cep/infra/model/post_cep_back_for_app_model.dart';
import 'package:flutter/material.dart';

class PostCepBackForAppDatasourceImpl implements IPostCepBackForAppDatasource {
  late Dio dio;

  PostCepBackForAppDatasourceImpl() {
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
  Future<PostCepBackForAppModel> postCepBackForApp({
    required CepBackForAppParams cepParams,
  }) async {
    try {
      final cep = cepParams.toJson();

      debugPrint('Enviando dados: $cep');
      debugPrint('URL completa: ${dio.options.baseUrl}/ceps');

      final response = await dio.post('/ceps', data: cep);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        debugPrint('Dados recebidos da API: $data');

        final model = PostCepBackForAppModel.fromJson(data);
        debugPrint('Modelo criado: ${model.toString()}');

        return model;
      } else {
        throw ServerBackForAppException(
          message:
              'Erro ao enviar CEP para o aplicativo. Status: ${response.statusCode}',
        );
      }
    } catch (e) {
      debugPrint('Erro no datasource: $e');
      throw ServerBackForAppException(message: e.toString());
    }
  }
}
