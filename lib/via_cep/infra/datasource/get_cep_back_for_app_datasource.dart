import 'package:dio_viacep/via_cep/infra/model/cep_back_for_app_model.dart';

abstract class IGetCepBackForAppDatasource {
  Future<CepBackForAppModel> getCepBackForApp();
}
