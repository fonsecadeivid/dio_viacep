import 'package:dio_viacep/via_cep/infra/model/via_cep_model.dart';

abstract class IViaCepDatasource {
  Future<ViaCepModel> getAddressByCep({required String cep});
}
