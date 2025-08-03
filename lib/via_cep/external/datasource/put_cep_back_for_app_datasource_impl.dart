// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:dio_viacep/via_cep/domain/entities/put_cep_back_for_app_entity.dart';
import 'package:dio_viacep/via_cep/infra/datasource/datasource.dart';

import '../../../core/errors/exceptions.dart';

class PutCepBackForAppDatasourceImpl implements IPutCepBackForAppDatasource {
  late Dio dio;

  PutCepBackForAppDatasourceImpl() {
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
  Future<bool> putCepBackForApp({
    required PutCepBackForAppEntity cepEntity,
  }) async {
    try {
      final response = await dio.put(
        '/ceps/${cepEntity.objectId}',
        data: cepEntity.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        return true;
      } else {
        throw ServerBackForAppException(
          message: 'Erro ao atualizar CEP: ${cepEntity.cep}',
        );
      }
    } catch (e) {
      throw ServerBackForAppException(message: e.toString());
    }
  }
}
