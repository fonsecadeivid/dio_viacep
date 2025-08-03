import 'package:dio_viacep/via_cep/domain/entities/cep_back_for_app_entity.dart';
import 'package:dio_viacep/via_cep/domain/entities/cep_back_for_app_params.dart';
import 'package:dio_viacep/via_cep/domain/entities/post_cep_back_for_app_entity.dart';
import 'package:dio_viacep/via_cep/domain/entities/via_cep_entity.dart';
import 'package:dio_viacep/via_cep/domain/entities/via_cep_params.dart';
import 'package:dio_viacep/via_cep/domain/usecases/get_cep_for_app_usecases.dart';
import 'package:dio_viacep/via_cep/domain/usecases/post_cep_back_for_app_usecases.dart';
import 'package:dio_viacep/via_cep/domain/usecases/via_cep_usecases.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'via_cep_store.g.dart';

class ViaCepStore = ViaCepStoreBase with _$ViaCepStore;

abstract class ViaCepStoreBase with Store {
  final ViaCepUsecases _usecases;
  final GetCepForAppUsecases _getCepForAppUsecases;
  final PostCepBackForAppUsecases _postCepBackForAppUsecases;

  ViaCepStoreBase({
    required ViaCepUsecases usecases,
    required GetCepForAppUsecases getCepForAppUsecases,
    required PostCepBackForAppUsecases postCepBackForAppUsecases,
  }) : _usecases = usecases,
       _getCepForAppUsecases = getCepForAppUsecases,
       _postCepBackForAppUsecases = postCepBackForAppUsecases;

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
  List<Cep> listCepBack = [];

  @observable
  PostCepBackForAppEntity postCepBackForAppEntity = PostCepBackForAppEntity(
    createdAt: '',
    objectId: '',
  );

  @observable
  bool loading = false;

  @observable
  bool hasError = false;

  @observable
  bool hasDuplicateError = false;

  @observable
  String cep = '';

  @action
  void setCep(String value) => cep = value;

  @action
  void fillCep(Cep cep) {
    clearDataCep();
    viaCepEntity = ViaCepEntity(
      cep: cep.cep ?? '',
      logradouro: cep.logradouro ?? '',
      complemento: cep.complemento ?? '',
      unidade: cep.unidade ?? '',
      bairro: cep.bairro ?? '',
      localidade: cep.localidade ?? '',
      uf: cep.uf ?? '',
      estado: cep.estado ?? '',
      regiao: cep.regiao ?? '',
      ibge: cep.ibge ?? '',
      gia: cep.gia ?? '',
      ddd: cep.ddd ?? '',
      siafi: cep.siafi ?? '',
    );
  }

  @action
  void clearSuccessFeedback() {
    postCepBackForAppEntity = PostCepBackForAppEntity(
      createdAt: '',
      objectId: '',
    );
  }

  @action
  void clearError() {
    hasError = false;
    hasDuplicateError = false;
  }

  void clearDataCep() {
    viaCepEntity = ViaCepEntity(
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
    //listCepBack.clear();
    hasError = false;
    hasDuplicateError = false;
    loading = false;

    // Limpar feedback de sucesso
    postCepBackForAppEntity = PostCepBackForAppEntity(
      createdAt: '',
      objectId: '',
    );
  }

  @action
  Future<void> getAddressByCep(String cep) async {
    try {
      loading = true;
      hasError = false;

      var cepParam = cep.trim();
      debugPrint('Buscando CEP: $cepParam');

      final result = await _usecases.call(ViaCepParams(cep: cepParam));

      result.fold(
        (failure) {
          loading = false;
          hasError = true;
          debugPrint('❌ Erro na busca do CEP: ${failure.message}');

          // Limpar dados em caso de erro
          clearDataCep();
        },
        (address) {
          hasError = false;
          viaCepEntity = address;
          loading = false;
          debugPrint('✅ CEP encontrado: ${address.cep}');
        },
      );
    } catch (e) {
      debugPrint('❌ Erro inesperado na busca do CEP: $e');
      loading = false;
      hasError = true;
      clearDataCep();
    }
  }

  @action
  Future<void> getCepBackForApp() async {
    try {
      loading = true;
      hasError = false;

      debugPrint('Carregando lista de CEPs do backforapp...');

      final result = await _getCepForAppUsecases.call();

      result.fold(
        (failure) {
          loading = false;
          hasError = true;
          debugPrint('❌ Erro ao carregar lista: ${failure.message}');
        },
        (it) {
          hasError = false;
          listCepBack = it.results ?? [];
          loading = false;
          debugPrint('✅ Lista carregada com ${listCepBack.length} CEPs');
        },
      );
    } catch (e) {
      debugPrint('❌ Erro inesperado ao carregar lista: $e');
      loading = false;
      hasError = true;
    }
  }

  @action
  int getUniqueCepsCount() {
    final uniqueCeps = <String>{};

    for (final cep in listCepBack) {
      if (cep.cep != null && cep.cep!.isNotEmpty) {
        final cleanCep = cep.cep!.replaceAll(RegExp(r'[^\d]'), '');
        uniqueCeps.add(cleanCep);
      }
    }

    return uniqueCeps.length;
  }

  @action
  bool isCepAlreadySaved(String cep) {
    if (cep.isEmpty) return false;

    // Limpar o CEP de entrada (remover hífens e espaços)
    final cleanCep = cep.replaceAll(RegExp(r'[^\d]'), '');

    // Verificar se existe na lista
    return listCepBack.any((savedCep) {
      if (savedCep.cep == null || savedCep.cep!.isEmpty) return false;

      // Limpar o CEP salvo (remover hífens e espaços)
      final savedCleanCep = savedCep.cep!.replaceAll(RegExp(r'[^\d]'), '');

      // Comparar os CEPs limpos
      return savedCleanCep == cleanCep;
    });
  }

  @action
  Future<void> postCepBackForApp(CepBackForAppParams params) async {
    // Verificar se o CEP já existe
    if (isCepAlreadySaved(params.cep.cep ?? '')) {
      hasDuplicateError = true;
      hasError = false;
      debugPrint('❌ CEP já existe na lista: ${params.cep.cep}');
      return;
    }

    loading = true;
    hasError = false;
    hasDuplicateError = false;

    final result = await _postCepBackForAppUsecases.call(params);

    result.fold(
      (failure) {
        loading = false;
        hasError = true;
        hasDuplicateError = false;
        debugPrint('Error: ${failure.message}');
      },
      (it) {
        hasError = false;
        hasDuplicateError = false;
        postCepBackForAppEntity = it;
        loading = false;

        // Limpar dados após sucesso
        clearDataCep();
        debugPrint('CEP inserido com sucesso! ObjectId: ${it.objectId}');

        // Recarregar a lista após inserir novo CEP
        getCepBackForApp();
      },
    );
  }
}
