import 'package:dio_viacep/via_cep/ui/edit_cep_module.dart';
import 'package:dio_viacep/via_cep/via_cep_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind<Object>> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: ViaCepModule()),
    ModuleRoute('/edit', module: EditCepModule()),
  ];
}
