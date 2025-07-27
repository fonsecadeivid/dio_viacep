import 'package:dio_viacep/via_cep/ui/controller/via_cep_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final store = Modular.get<ViaCepStore>();
  final TextEditingController _cepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Informe o CEP desejado',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _cepController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CEP',
                        hintText: 'Ex: 01001-000',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 10),
                  Observer(
                    builder: (_) => ElevatedButton(
                      onPressed: store.loading
                          ? null
                          : () {
                              if (_cepController.text.isNotEmpty) {
                                store.getAddressByCep(_cepController.text);
                              }
                            },
                      child: store.loading
                          ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text("Buscar CEP"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Observer(
                builder: (_) => Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Dados do CEP',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                        Divider(height: 2, color: Colors.grey),
                        const SizedBox(height: 8),

                        Text(
                          'CEP: ${store.viaCepEntity.cep}',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(
                          'Logradouro: ${store.viaCepEntity.logradouro}',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(
                          'Unidade: ${store.viaCepEntity.unidade}',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(
                          'Complemento: ${store.viaCepEntity.complemento}',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(
                          'Bairro: ${store.viaCepEntity.bairro}',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(
                          'Localidade: ${store.viaCepEntity.localidade}',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(
                          'UF: ${store.viaCepEntity.uf}',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(
                          'Estado: ${store.viaCepEntity.estado}',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(
                          'Região: ${store.viaCepEntity.regiao}',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(
                          'IBGE: ${store.viaCepEntity.ibge}',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(
                          'DDD: ${store.viaCepEntity.ddd}',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Observer(
                builder: (_) => store.hasError
                    ? Container(
                        margin: EdgeInsets.only(top: 16),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.red[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Erro ao buscar CEP. Verifique se o CEP está correto.',
                          style: TextStyle(color: Colors.red[800]),
                        ),
                      )
                    : SizedBox.shrink(),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("Título"),
                        subtitle: Text('Sub Título'),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Cancelar"),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Inserir"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
