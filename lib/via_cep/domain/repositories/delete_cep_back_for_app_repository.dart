import 'package:dartz/dartz.dart';
import 'package:dio_viacep/core/errors/failures.dart';

abstract class IDeleteCepBackForAppRepository {
  Future<Either<Failures, bool>> deleteCepBackForApp({
    required String objectId,
  });
}
