import 'package:dio_viacep/via_cep/domain/entities/cep_back_for_app_params.dart';
import 'package:dio_viacep/via_cep/infra/model/post_cep_back_for_app_model.dart';

abstract class IPostCepBackForAppDatasource {
  Future<PostCepBackForAppModel> postCepBackForApp({
    required CepBackForAppParams cepParams,
  });
}
