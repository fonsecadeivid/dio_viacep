import 'package:dartz/dartz.dart';
import 'package:dio_viacep/core/errors/failures.dart';
import 'package:dio_viacep/core/usecase/usecase.dart';
import 'package:dio_viacep/via_cep/domain/entities/entities.dart';
import 'package:dio_viacep/via_cep/domain/entities/post_cep_back_for_app_entity.dart';
import 'package:dio_viacep/via_cep/domain/repositories/post_cep_back_for_app_repository.dart';

class PostCepBackForAppUsecases
    implements IUseCase<PostCepBackForAppEntity, CepBackForAppParams> {
  final IPostCepBackForAppRepository repository;

  PostCepBackForAppUsecases({required this.repository});

  @override
  Future<Either<Failures, PostCepBackForAppEntity>> call(
    CepBackForAppParams params,
  ) async {
    return repository.postCepBackForApp(cepParams: params);
  }
}
