import 'package:dio_viacep/via_cep/domain/repositories/via_cep_repository.dart';
import 'package:dio_viacep/via_cep/domain/usecases/usecases.dart';
import 'package:dio_viacep/via_cep/external/datasource/datasource.dart';
import 'package:dio_viacep/via_cep/infra/datasource/via_cep_datasource.dart';
import 'package:dio_viacep/via_cep/infra/repositories/repositories.dart';
import 'package:dio_viacep/via_cep/ui/controller/via_cep_store.dart';
import 'package:dio_viacep/via_cep/ui/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ViaCepModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => ViaCepStore(usecases: i.get<ViaCepUsecases>())),
    Bind.lazySingleton<ViaCepUsecases>(
      (i) => ViaCepUsecases(repository: i.get<IViaCepRepository>()),
    ),
    Bind.lazySingleton<IViaCepRepository>(
      (i) => ViaCepRepositoriesImpl(datasource: i.get<IViaCepDatasource>()),
    ),
    Bind.lazySingleton<IViaCepDatasource>((i) => ViaCepDatasourceImpl()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute("/", child: (_, __) => const MyHomePage(title: 'DIO ViaCep')),
  ];
}
