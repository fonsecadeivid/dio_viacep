import 'package:dartz/dartz.dart';
import 'package:dio_viacep/core/errors/failures.dart';
import 'package:dio_viacep/core/usecase/usecase.dart';

import '../entities/entities.dart';
import '../repositories/put_back_for_app_repository.dart';

class PutCepBackForAppUsecases
    implements IUseCase<bool, PutCepBackForAppEntity> {
  final IPutBackForAppRepository repository;

  PutCepBackForAppUsecases({required this.repository});

  @override
  Future<Either<Failures, bool>> call(PutCepBackForAppEntity cepEntity) async {
    return repository.putBackForApp(cepEntity: cepEntity);
  }
}
