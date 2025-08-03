import 'package:dartz/dartz.dart';
import 'package:dio_viacep/core/errors/failures.dart';
import 'package:dio_viacep/via_cep/domain/entities/entities.dart';
import 'package:dio_viacep/via_cep/domain/entities/post_cep_back_for_app_entity.dart';

abstract class IPostCepBackForAppRepository {
  Future<Either<Failures, PostCepBackForAppEntity>> postCepBackForApp({
    required CepBackForAppParams cepParams,
  });
}
