import 'package:dartz/dartz.dart';
import 'package:dio_viacep/core/errors/failures.dart';
import 'package:dio_viacep/via_cep/domain/entities/cep_back_for_app_entity.dart';
import 'package:dio_viacep/via_cep/domain/repositories/get_cep_for_app.repository.dart';

class GetCepForAppUsecases {
  final IGetCepForAppRepository repository;

  GetCepForAppUsecases({required this.repository});

  Future<Either<Failures, CepBackForAppEntity>> call() {
    return repository.getCepBackForApp();
  }
}
