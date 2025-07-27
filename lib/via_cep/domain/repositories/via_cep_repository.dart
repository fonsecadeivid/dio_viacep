import 'package:dartz/dartz.dart';
import 'package:dio_viacep/core/errors/failures.dart';
import 'package:dio_viacep/via_cep/domain/entities/entities.dart';

abstract class IViaCepRepository {
  Future<Either<Failures, ViaCepEntity>> getAddressByCep({required String cep});
}
