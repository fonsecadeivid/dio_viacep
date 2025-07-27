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

  late final _$getAddressByCepAsyncAction = AsyncAction(
    'ViaCepStoreBase.getAddressByCep',
    context: context,
  );

  @override
  Future<void> getAddressByCep(String cep) {
    return _$getAddressByCepAsyncAction.run(() => super.getAddressByCep(cep));
  }

  late final _$ViaCepStoreBaseActionController = ActionController(
    name: 'ViaCepStoreBase',
    context: context,
  );

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
  String toString() {
    return '''
viaCepEntity: ${viaCepEntity},
loading: ${loading},
hasError: ${hasError},
cep: ${cep}
    ''';
  }
}
