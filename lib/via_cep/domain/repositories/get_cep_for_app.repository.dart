import 'package:dartz/dartz.dart';
import 'package:dio_viacep/core/errors/failures.dart';
import 'package:dio_viacep/via_cep/domain/entities/cep_back_for_app_entity.dart';

abstract class IGetCepForAppRepository {
  Future<Either<Failures, CepBackForAppEntity>> getCepBackForApp();
}
