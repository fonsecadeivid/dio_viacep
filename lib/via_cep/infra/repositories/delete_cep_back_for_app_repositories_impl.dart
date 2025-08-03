import 'package:dartz/dartz.dart';
import 'package:dio_viacep/core/errors/failures.dart';
import 'package:dio_viacep/via_cep/domain/repositories/delete_cep_back_for_app_repository.dart';
import 'package:dio_viacep/via_cep/infra/datasource/delete_cep_back_for_app_datasource.dart';

class IDeleteCepBackForAppRepositoriesImpl
    implements IDeleteCepBackForAppRepository {
  final IDeleteCepBackForAppDatasource _datasource;

  IDeleteCepBackForAppRepositoriesImpl({
    required IDeleteCepBackForAppDatasource datasource,
  }) : _datasource = datasource;

  @override
  Future<Either<Failures, bool>> deleteCepBackForApp({
    required String objectId,
  }) async {
    try {
      final result = await _datasource.deleteCepBackForApp(objectId: objectId);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: 'Erro ao deletar CEP: $objectId'));
    }
  }
}
