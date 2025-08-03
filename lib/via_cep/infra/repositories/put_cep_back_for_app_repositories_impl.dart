import 'package:dartz/dartz.dart';
import 'package:dio_viacep/via_cep/domain/entities/put_cep_back_for_app_entity.dart';
import 'package:dio_viacep/via_cep/domain/repositories/put_back_for_app_repository.dart';

import '../../../core/errors/errors.dart';
import '../datasource/datasource.dart';

class PutCepBackForAppRepositoriesImpl implements IPutBackForAppRepository {
  final IPutCepBackForAppDatasource _datasource;

  PutCepBackForAppRepositoriesImpl({
    required IPutCepBackForAppDatasource datasource,
  }) : _datasource = datasource;

  @override
  Future<Either<Failures, bool>> putBackForApp({
    required PutCepBackForAppEntity cepEntity,
  }) async {
    try {
      final result = await _datasource.putCepBackForApp(cepEntity: cepEntity);
      return Right(result);
    } on ServerBackForAppException {
      return left(
        ServerFailure(message: 'Erro ao atualizar CEP: ${cepEntity.cep}'),
      );
    }
  }
}
