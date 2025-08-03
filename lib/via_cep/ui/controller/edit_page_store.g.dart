// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditPageStore on EdiPageStoreBase, Store {
  late final _$loadingAtom = Atom(
    name: 'EdiPageStoreBase.loading',
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
    name: 'EdiPageStoreBase.hasError',
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

  late final _$putCepBackForAppAsyncAction = AsyncAction(
    'EdiPageStoreBase.putCepBackForApp',
    context: context,
  );

  @override
  Future<bool> putCepBackForApp({
    required ViaCepEntity viaCepEntity,
    required String objectId,
  }) {
    return _$putCepBackForAppAsyncAction.run(
      () => super.putCepBackForApp(
        viaCepEntity: viaCepEntity,
        objectId: objectId,
      ),
    );
  }

  @override
  String toString() {
    return '''
loading: ${loading},
hasError: ${hasError}
    ''';
  }
}
