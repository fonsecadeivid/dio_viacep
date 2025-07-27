import 'package:dio_viacep/via_cep/domain/entities/via_cep_entity.dart';
import 'package:dio_viacep/via_cep/domain/entities/via_cep_params.dart';
import 'package:dio_viacep/via_cep/domain/usecases/via_cep_usecases.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'via_cep_store.g.dart';

class ViaCepStore = ViaCepStoreBase with _$ViaCepStore;

abstract class ViaCepStoreBase with Store {
  final ViaCepUsecases _usecases;

  ViaCepStoreBase({required ViaCepUsecases usecases}) : _usecases = usecases;

  @observable
  ViaCepEntity viaCepEntity = ViaCepEntity(
    cep: '',
    logradouro: '',
    complemento: '',
    unidade: '',
    bairro: '',
    localidade: '',
    uf: '',
    estado: '',
    regiao: '',
    ibge: '',
    gia: '',
    ddd: '',
    siafi: '',
  );

  @observable
  bool loading = false;

  @observable
  bool hasError = false;

  @observable
  String cep = '';

  @action
  void setCep(String value) => cep = value;

  @action
  Future<void> getAddressByCep(String cep) async {
    loading = true;
    var cepParam = cep.trim();
    final result = await _usecases.call(ViaCepParams(cep: cepParam));

    result.fold(
      (failure) {
        loading = false;
        hasError = true;
        debugPrint('Error: ${failure.message}');
      },
      (address) {
        hasError = false;
        viaCepEntity = address;
        loading = false;
      },
    );
  }
}
