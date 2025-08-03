import 'package:dartz/dartz.dart';
import 'package:dio_viacep/core/errors/failures.dart';
import 'package:dio_viacep/core/usecase/usecase.dart';
import 'package:dio_viacep/via_cep/domain/repositories/delete_cep_back_for_app_repository.dart';

class DeleteCepBackForAppUsecases implements IUseCase<bool, String> {
  final IDeleteCepBackForAppRepository repository;

  DeleteCepBackForAppUsecases({required this.repository});

  @override
  Future<Either<Failures, bool>> call(String objectId) {
    return repository.deleteCepBackForApp(objectId: objectId);
  }
}
