// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'via_cep_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ViaCepStore on ViaCepStoreBase, Store {
  late final _$viaCepEntityAtom = Atom(
    name: 'ViaCepStoreBase.viaCepEntity',
    context: context,
  );

  @override
  ViaCepEntity get viaCepEntity {
    _$viaCepEntityAtom.reportRead();
    return super.viaCepEntity;
  }

  @override
  set viaCepEntity(ViaCepEntity value) {
    _$viaCepEntityAtom.reportWrite(value, super.viaCepEntity, () {
      super.viaCepEntity = value;
    });
  }

  late final _$listCepBackAtom = Atom(
    name: 'ViaCepStoreBase.listCepBack',
    context: context,
  );

  @override
  List<Cep> get listCepBack {
    _$listCepBackAtom.reportRead();
    return super.listCepBack;
  }

  @override
  set listCepBack(List<Cep> value) {
    _$listCepBackAtom.reportWrite(value, super.listCepBack, () {
      super.listCepBack = value;
    });
  }

  late final _$postCepBackForAppEntityAtom = Atom(
    name: 'ViaCepStoreBase.postCepBackForAppEntity',
    context: context,
  );

  @override
  PostCepBackForAppEntity get postCepBackForAppEntity {
    _$postCepBackForAppEntityAtom.reportRead();
    return super.postCepBackForAppEntity;
  }

  @override
  set postCepBackForAppEntity(PostCepBackForAppEntity value) {
    _$postCepBackForAppEntityAtom.reportWrite(
      value,
      super.postCepBackForAppEntity,
      () {
        super.postCepBackForAppEntity = value;
      },
    );
  }

  late final _$loadingAtom = Atom(
    name: 'ViaCepStoreBase.loading',
    context: context,
  );

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$hasErrorAtom = Atom(
    name: 'ViaCepStoreBase.hasError',
    context: context,
  );

  @override
  bool get hasError {
    _$hasErrorAtom.reportRead();
    return super.hasError;
  }

  @override
  set hasError(bool value) {
    _$hasErrorAtom.reportWrite(value, super.hasError, () {
      super.hasError = value;
    });
  }

  late final _$hasDuplicateErrorAtom = Atom(
    name: 'ViaCepStoreBase.hasDuplicateError',
    context: context,
  );

  @override
  bool get hasDuplicateError {
    _$hasDuplicateErrorAtom.reportRead();
    return super.hasDuplicateError;
  }

  @override
  set hasDuplicateError(bool value) {
    _$hasDuplicateErrorAtom.reportWrite(value, super.hasDuplicateError, () {
      super.hasDuplicateError = value;
    });
  }

  late final _$cepAtom = Atom(name: 'ViaCepStoreBase.cep', context: context);

  @override
  String get cep {
    _$cepAtom.reportRead();
    return super.cep;
  }

  @override
  set cep(String value) {
    _$cepAtom.reportWrite(value, super.cep, () {
      super.cep = value;
    });
  }

  late final _$objectIdAtom = Atom(
    name: 'ViaCepStoreBase.objectId',
    context: context,
  );

  @override
  String get objectId {
    _$objectIdAtom.reportRead();
    return super.objectId;
  }

  @override
  set objectId(String value) {
    _$objectIdAtom.reportWrite(value, super.objectId, () {
      super.objectId = value;
    });
  }

  late final _$getAddressByCepAsyncAction = AsyncAction(
    'ViaCepStoreBase.getAddressByCep',
    context: context,
  );

  @override
  Future<void> getAddressByCep(String cep) {
    return _$getAddressByCepAsyncAction.run(() => super.getAddressByCep(cep));
  }

  late final _$getCepBackForAppAsyncAction = AsyncAction(
    'ViaCepStoreBase.getCepBackForApp',
    context: context,
  );

  @override
  Future<void> getCepBackForApp() {
    return _$getCepBackForAppAsyncAction.run(() => super.getCepBackForApp());
  }

  late final _$postCepBackForAppAsyncAction = AsyncAction(
    'ViaCepStoreBase.postCepBackForApp',
    context: context,
  );

  @override
  Future<bool> postCepBackForApp(CepBackForAppParams params) {
    return _$postCepBackForAppAsyncAction.run(
      () => super.postCepBackForApp(params),
    );
  }

  late final _$deleteCepBackForAppAsyncAction = AsyncAction(
    'ViaCepStoreBase.deleteCepBackForApp',
    context: context,
  );

  @override
  Future<bool> deleteCepBackForApp() {
    return _$deleteCepBackForAppAsyncAction.run(
      () => super.deleteCepBackForApp(),
    );
  }

  late final _$ViaCepStoreBaseActionController = ActionController(
    name: 'ViaCepStoreBase',
    context: context,
  );

  @override
  void setObjectId(String value) {
    final _$actionInfo = _$ViaCepStoreBaseActionController.startAction(
      name: 'ViaCepStoreBase.setObjectId',
    );
    try {
      return super.setObjectId(value);
    } finally {
      _$ViaCepStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCep(String value) {
    final _$actionInfo = _$ViaCepStoreBaseActionController.startAction(
      name: 'ViaCepStoreBase.setCep',
    );
    try {
      return super.setCep(value);
    } finally {
      _$ViaCepStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fillCep(Cep cep) {
    final _$actionInfo = _$ViaCepStoreBaseActionController.startAction(
      name: 'ViaCepStoreBase.fillCep',
    );
    try {
      return super.fillCep(cep);
    } finally {
      _$ViaCepStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSuccessFeedback() {
    final _$actionInfo = _$ViaCepStoreBaseActionController.startAction(
      name: 'ViaCepStoreBase.clearSuccessFeedback',
    );
    try {
      return super.clearSuccessFeedback();
    } finally {
      _$ViaCepStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearError() {
    final _$actionInfo = _$ViaCepStoreBaseActionController.startAction(
      name: 'ViaCepStoreBase.clearError',
    );
    try {
      return super.clearError();
    } finally {
      _$ViaCepStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int getUniqueCepsCount() {
    final _$actionInfo = _$ViaCepStoreBaseActionController.startAction(
      name: 'ViaCepStoreBase.getUniqueCepsCount',
    );
    try {
      return super.getUniqueCepsCount();
    } finally {
      _$ViaCepStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isCepAlreadySaved(String cep) {
    final _$actionInfo = _$ViaCepStoreBaseActionController.startAction(
      name: 'ViaCepStoreBase.isCepAlreadySaved',
    );
    try {
      return super.isCepAlreadySaved(cep);
    } finally {
      _$ViaCepStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
viaCepEntity: ${viaCepEntity},
listCepBack: ${listCepBack},
postCepBackForAppEntity: ${postCepBackForAppEntity},
loading: ${loading},
hasError: ${hasError},
hasDuplicateError: ${hasDuplicateError},
cep: ${cep},
objectId: ${objectId}
    ''';
  }
}
