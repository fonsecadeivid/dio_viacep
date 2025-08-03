import 'package:dio_viacep/via_cep/domain/usecases/put_cep_back_for_app_usecases.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../domain/entities/entities.dart';
part 'edit_page_store.g.dart';

class EditPageStore = EdiPageStoreBase with _$EditPageStore;

abstract class EdiPageStoreBase with Store {
  final PutCepBackForAppUsecases _putCepBackForAppUsecases;

  EdiPageStoreBase({required PutCepBackForAppUsecases putCepBackForAppUsecases})
    : _putCepBackForAppUsecases = putCepBackForAppUsecases;

  @observable
  bool loading = false;

  @observable
  bool hasError = false;

  @action
  Future<bool> putCepBackForApp({
    required ViaCepEntity viaCepEntity,
    required String objectId,
  }) async {
    if (viaCepEntity.cep.isEmpty) {
      debugPrint('❌ Erro: CEP vazio ou inválido');
      return false;
    }
    try {
      loading = true;
      hasError = false;

      bool hasBeenUpdated = false;

      final result = await _putCepBackForAppUsecases.call(
        PutCepBackForAppEntity(
          objectId: objectId,
          cep: viaCepEntity.cep,
          logradouro: viaCepEntity.logradouro,
          complemento: viaCepEntity.complemento,
          unidade: viaCepEntity.unidade,
          bairro: viaCepEntity.bairro,
          localidade: viaCepEntity.localidade,
          uf: viaCepEntity.uf,
          estado: viaCepEntity.estado,
          regiao: viaCepEntity.regiao,
          ibge: viaCepEntity.ibge,
          gia: viaCepEntity.gia,
          ddd: viaCepEntity.ddd,
          siafi: viaCepEntity.siafi,
        ),
      );

      result.fold(
        (failure) {
          loading = false;
          hasError = true;
          debugPrint('❌ Erro na atualização do CEP: ${failure.message}');
          hasBeenUpdated = false;
        },
        (it) {
          hasError = false;

          loading = false;
          debugPrint('✅ CEP atualizado: $it');
          hasBeenUpdated = true;
        },
      );
      return hasBeenUpdated;
    } catch (e) {
      debugPrint('❌ Erro inesperado ao atualizar CEP: $e');
      loading = false;
      hasError = true;
      return false;
    }
  }
}
