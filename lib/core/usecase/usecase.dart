import 'package:dartz/dartz.dart';
import 'package:dio_viacep/core/errors/failures.dart';

abstract class IUseCase<Type, Params> {
  Future<Either<Failures, Type>> call(Params params);
}
