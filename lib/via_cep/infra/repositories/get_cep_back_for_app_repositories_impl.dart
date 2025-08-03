import 'package:dartz/dartz.dart';
import 'package:dio_viacep/core/errors/exceptions.dart';
import 'package:dio_viacep/core/errors/failures.dart';
import 'package:dio_viacep/via_cep/domain/entities/cep_back_for_app_entity.dart';
import 'package:dio_viacep/via_cep/domain/repositories/get_cep_for_app.repository.dart';
import 'package:dio_viacep/via_cep/infra/datasource/get_cep_back_for_app_datasource.dart';

class GetCepBackForAppRepositoriesImpl implements IGetCepForAppRepository {
  final IGetCepBackForAppDatasource _datasource;

  GetCepBackForAppRepositoriesImpl({
    required IGetCepBackForAppDatasource datasource,
  }) : _datasource = datasource;

  @override
  Future<Either<Failures, CepBackForAppEntity>> getCepBackForApp() async {
    try {
      final response = await _datasource.getCepBackForApp();
      return Right(response);
    } on ServerBackForAppException {
      return Left(ServerFailure(message: 'Erro ao buscar Lista de CEP.'));
    }
  }
}
