import 'package:dio_viacep/via_cep/domain/repositories/put_back_for_app_repository.dart';
import 'package:dio_viacep/via_cep/domain/usecases/put_cep_back_for_app_usecases.dart';
import 'package:dio_viacep/via_cep/external/datasource/put_cep_back_for_app_datasource_impl.dart';
import 'package:dio_viacep/via_cep/infra/datasource/datasource.dart';
import 'package:dio_viacep/via_cep/infra/repositories/repositories.dart';
import 'package:dio_viacep/via_cep/ui/controller/edit_page_store.dart';
import 'package:dio_viacep/via_cep/ui/edit_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EditCepModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind.factory(
      (i) => EditPageStore(
        putCepBackForAppUsecases: i.get<PutCepBackForAppUsecases>(),
      ),
    ),

    Bind.lazySingleton<PutCepBackForAppUsecases>(
      (i) => PutCepBackForAppUsecases(
        repository: i.get<IPutBackForAppRepository>(),
      ),
    ),

    Bind.lazySingleton<IPutBackForAppRepository>(
      (i) => PutCepBackForAppRepositoriesImpl(
        datasource: i.get<IPutCepBackForAppDatasource>(),
      ),
    ),

    Bind.lazySingleton<IPutCepBackForAppDatasource>(
      (i) => PutCepBackForAppDatasourceImpl(),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) =>
          EditPage(viaCepEntity: args.data[0], objectId: args.data[1]),
    ),
  ];
}
