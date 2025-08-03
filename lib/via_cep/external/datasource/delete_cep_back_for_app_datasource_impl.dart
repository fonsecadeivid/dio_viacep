// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:dio_viacep/core/errors/exceptions.dart';

import 'package:dio_viacep/via_cep/infra/datasource/datasource.dart';

class DeleteCepBackForAppDatasourceImpl
    implements IDeleteCepBackForAppDatasource {
  late Dio dio;

  DeleteCepBackForAppDatasourceImpl() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://parseapi.back4app.com/classes',
        headers: {
          'X-Parse-Application-Id': 'gb22cnkcdtXmVGvMYvATkmWlUJDnaT5wd8vO9nCd',
          'X-Parse-REST-API-Key': 'B5UrPWSUoWOyjq1HT0HT98CTjHj4JGWr2sfB4mK0',
        },
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
  }

  @override
  Future<bool> deleteCepBackForApp({required String objectId}) {
    return dio
        .delete('/ceps/$objectId')
        .then((response) {
          if (response.statusCode == 200 || response.statusCode == 204) {
            return true;
          } else {
            throw ServerBackForAppException(
              message: 'Erro ao deletar CEP: ${response.statusMessage}',
            );
          }
        })
        .catchError((error) {
          throw ServerBackForAppException(
            message: 'Erro ao deletar CEP: $error',
          );
        });
  }
}
