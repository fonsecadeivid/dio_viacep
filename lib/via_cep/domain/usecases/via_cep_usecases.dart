import 'package:dartz/dartz.dart';
import 'package:dio_viacep/core/errors/failures.dart';
import 'package:dio_viacep/core/usecase/usecase.dart';
import 'package:dio_viacep/via_cep/domain/entities/entities.dart';
import 'package:dio_viacep/via_cep/domain/entities/via_cep_params.dart';
import 'package:dio_viacep/via_cep/domain/repositories/via_cep_repository.dart';

class ViaCepUsecases implements IUseCase<ViaCepEntity, ViaCepParams> {
  final IViaCepRepository repository;

  ViaCepUsecases({required this.repository});

  @override
  Future<Either<Failures, ViaCepEntity>> call(ViaCepParams params) {
    return repository.getAddressByCep(cep: params.cep);
  }
}
