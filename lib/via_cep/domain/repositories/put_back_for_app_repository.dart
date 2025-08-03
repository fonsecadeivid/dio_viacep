import 'package:dartz/dartz.dart';
import 'package:dio_viacep/core/errors/failures.dart';

import '../entities/entities.dart';

abstract class IPutBackForAppRepository {
  Future<Either<Failures, bool>> putBackForApp({
    required PutCepBackForAppEntity cepEntity,
  });
}
