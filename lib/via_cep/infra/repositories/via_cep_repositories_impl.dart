import 'package:dartz/dartz.dart';
import 'package:dio_viacep/core/errors/exceptions.dart';
import 'package:dio_viacep/core/errors/failures.dart';
import 'package:dio_viacep/via_cep/domain/entities/via_cep_entity.dart';
import 'package:dio_viacep/via_cep/domain/repositories/repositories.dart';
import 'package:dio_viacep/via_cep/infra/datasource/via_cep_datasource.dart';

class ViaCepRepositoriesImpl implements IViaCepRepository {
  final IViaCepDatasource _datasource;

  ViaCepRepositoriesImpl({required IViaCepDatasource datasource})
    : _datasource = datasource;

  @override
  Future<Either<Failures, ViaCepEntity>> getAddressByCep({
    required String cep,
  }) async {
    try {
      final result = await _datasource.getAddressByCep(cep: cep);
      return Right(result);
    } on ViaCepException {
      return Left(
        ServerFailure(message: 'Erro ao buscar endereço pelo CEP: $cep'),
      );
    }
  }
}
