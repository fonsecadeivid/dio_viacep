import 'package:dio_viacep/via_cep/domain/repositories/get_cep_for_app.repository.dart';
import 'package:dio_viacep/via_cep/domain/repositories/post_cep_back_for_app_repository.dart';
import 'package:dio_viacep/via_cep/domain/repositories/via_cep_repository.dart';
import 'package:dio_viacep/via_cep/domain/usecases/usecases.dart';
import 'package:dio_viacep/via_cep/external/datasource/datasource.dart';
import 'package:dio_viacep/via_cep/external/datasource/get_cep_back_for_app_datasource_impl.dart';
import 'package:dio_viacep/via_cep/external/datasource/post_cep_back_for_app_datasource_impl.dart';
import 'package:dio_viacep/via_cep/infra/datasource/datasource.dart';
import 'package:dio_viacep/via_cep/infra/repositories/repositories.dart';
import 'package:dio_viacep/via_cep/ui/controller/via_cep_store.dart';
import 'package:dio_viacep/via_cep/ui/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ViaCepModule extends Module {
  @override
  final List<Bind> binds = [
    // Stores =========================================================
    Bind.factory(
      (i) => ViaCepStore(
        usecases: i.get<ViaCepUsecases>(),
        getCepForAppUsecases: i.get<GetCepForAppUsecases>(),
        postCepBackForAppUsecases: i.get<PostCepBackForAppUsecases>(),
      ),
    ),

    // ViaCep =========================================================
    Bind.lazySingleton<ViaCepUsecases>(
      (i) => ViaCepUsecases(repository: i.get<IViaCepRepository>()),
    ),
    Bind.lazySingleton<IViaCepRepository>(
      (i) => ViaCepRepositoriesImpl(datasource: i.get<IViaCepDatasource>()),
    ),
    Bind.lazySingleton<IViaCepDatasource>((i) => ViaCepDatasourceImpl()),

    // GetBackForApp =========================================================
    Bind.lazySingleton<GetCepForAppUsecases>(
      (i) => GetCepForAppUsecases(repository: i.get<IGetCepForAppRepository>()),
    ),

    Bind.lazySingleton<IGetCepForAppRepository>(
      (i) => GetCepBackForAppRepositoriesImpl(
        datasource: i.get<IGetCepBackForAppDatasource>(),
      ),
    ),

    Bind.lazySingleton<IGetCepBackForAppDatasource>(
      (i) => GetCepBackForAppDatasourceImpl(),
    ),

    // PostCepBackForApp =========================================================
    Bind.lazySingleton<PostCepBackForAppUsecases>(
      (i) => PostCepBackForAppUsecases(
        repository: i.get<IPostCepBackForAppRepository>(),
      ),
    ),

    Bind.lazySingleton<IPostCepBackForAppRepository>(
      (i) => IPostCepBackForAppRepositoriesImpl(
        datasource: i.get<IPostCepBackForAppDatasource>(),
      ),
    ),

    Bind.lazySingleton<IPostCepBackForAppDatasource>(
      (i) => PostCepBackForAppDatasourceImpl(),
    ),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute("/", child: (_, __) => const MyHomePage(title: 'DIO ViaCep')),
  ];
}
