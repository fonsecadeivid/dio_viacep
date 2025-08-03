import 'package:dartz/dartz.dart';
import 'package:dio_viacep/core/errors/exceptions.dart';
import 'package:dio_viacep/core/errors/failures.dart';
import 'package:dio_viacep/via_cep/domain/entities/cep_back_for_app_params.dart';
import 'package:dio_viacep/via_cep/domain/entities/post_cep_back_for_app_entity.dart';
import 'package:dio_viacep/via_cep/domain/repositories/post_cep_back_for_app_repository.dart';
import 'package:dio_viacep/via_cep/infra/datasource/post_cep_back_for_app_datasource.dart';

class IPostCepBackForAppRepositoriesImpl
    implements IPostCepBackForAppRepository {
  final IPostCepBackForAppDatasource _datasource;

  IPostCepBackForAppRepositoriesImpl({
    required IPostCepBackForAppDatasource datasource,
  }) : _datasource = datasource;

  @override
  Future<Either<Failures, PostCepBackForAppEntity>> postCepBackForApp({
    required CepBackForAppParams cepParams,
  }) async {
    try {
      final result = await _datasource.postCepBackForApp(cepParams: cepParams);
      return Right(result);
    } on ServerBackForAppException {
      return Left(
        ServerFailure(
          message: 'Erro ao enviar CEP para o aplicativo: ${cepParams.cep.cep}',
        ),
      );
    }
  }
}
