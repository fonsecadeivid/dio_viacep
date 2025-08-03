// ignore_for_file: use_build_context_synchronously

import 'package:dio_viacep/via_cep/domain/entities/cep_back_for_app_entity.dart';
import 'package:dio_viacep/via_cep/domain/entities/cep_back_for_app_params.dart';
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
  void initState() {
    super.initState();
    store.getCepBackForApp();
  }

  void limparCampos() {
    _cepController.text = '';
    store.clearDataCep();
    setState(() {});
  }

  void limparErro() {
    store.clearError();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                                limparErro();
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
                  constraints: BoxConstraints(minHeight: 200, maxHeight: 280),
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
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Dados do CEP',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineMedium,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  debugPrint(
                                    'Cep: ${store.objectId} Em edição ✍️',
                                  );
                                },
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.grey[600],
                                  size: 24,
                                ),
                              ),
                              SizedBox(width: 12),
                              InkWell(
                                onTap: () async {
                                  debugPrint(
                                    'Cep: ${store.objectId} removido 🗑️!!',
                                  );
                                  final isDeleted = await store
                                      .deleteCepBackForApp();
                                  if (isDeleted) {
                                    limparCampos();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.green[600],
                                        content: Text(
                                          'CEP removido com sucesso!',
                                        ),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.red[600],
                                        content: Text(
                                          'Selecione um CEP válido!!',
                                        ),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  }
                                },
                                child: Icon(
                                  Icons.delete_forever,
                                  color: Colors.grey[600],
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(height: 2, color: Colors.grey),
                        const SizedBox(height: 8),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 2.5,
                              children: [
                                Text(
                                  'CEP: ${store.viaCepEntity.cep.isNotEmpty ? store.viaCepEntity.cep : 'Não informado'}',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium,
                                ),
                                Text(
                                  'Logradouro: ${store.viaCepEntity.logradouro.isNotEmpty ? store.viaCepEntity.logradouro : 'Não informado'}',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium,
                                ),
                                Text(
                                  'Unidade: ${store.viaCepEntity.unidade.isNotEmpty ? store.viaCepEntity.unidade : 'Não informado'}',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium,
                                ),
                                Text(
                                  'Complemento: ${store.viaCepEntity.complemento.isNotEmpty ? store.viaCepEntity.complemento : 'Não informado'}',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium,
                                ),
                                Text(
                                  'Bairro: ${store.viaCepEntity.bairro.isNotEmpty ? store.viaCepEntity.bairro : 'Não informado'}',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium,
                                ),
                                Text(
                                  'Localidade: ${store.viaCepEntity.localidade.isNotEmpty ? store.viaCepEntity.localidade : 'Não informado'}',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium,
                                ),
                                Text(
                                  'UF: ${store.viaCepEntity.uf.isNotEmpty ? store.viaCepEntity.uf : 'Não informado'}',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium,
                                ),
                                Text(
                                  'Estado: ${store.viaCepEntity.estado.isNotEmpty ? store.viaCepEntity.estado : 'Não informado'}',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium,
                                ),
                                Text(
                                  'Região: ${store.viaCepEntity.regiao.isNotEmpty ? store.viaCepEntity.regiao : 'Não informado'}',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium,
                                ),
                                Text(
                                  'IBGE: ${store.viaCepEntity.ibge.isNotEmpty ? store.viaCepEntity.ibge : 'Não informado'}',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium,
                                ),
                                Text(
                                  'DDD: ${store.viaCepEntity.ddd.isNotEmpty ? store.viaCepEntity.ddd : 'Não informado'}',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium,
                                ),
                              ],
                            ),
                          ),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    '❌ Erro ao buscar CEP',
                                    style: TextStyle(
                                      color: Colors.red[800],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: limparErro,
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.red[800],
                                  ),
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Verifique se o CEP está correto e tente novamente.',
                              style: TextStyle(color: Colors.red[800]),
                            ),
                          ],
                        ),
                      )
                    : SizedBox.shrink(),
              ),
              Observer(
                builder: (_) => store.hasDuplicateError
                    ? Container(
                        margin: EdgeInsets.only(top: 16),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.orange[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    '⚠️ CEP já existe',
                                    style: TextStyle(
                                      color: Colors.orange[800],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: limparErro,
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.orange[800],
                                  ),
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Este CEP já foi inserido anteriormente. Escolha outro CEP.',
                              style: TextStyle(color: Colors.orange[800]),
                            ),
                          ],
                        ),
                      )
                    : SizedBox.shrink(),
              ),
              Observer(
                builder: (_) =>
                    store.postCepBackForAppEntity.objectId != null &&
                        store.postCepBackForAppEntity.objectId!.isNotEmpty
                    ? Container(
                        margin: EdgeInsets.only(top: 16),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    '✅ CEP inserido com sucesso!',
                                    style: TextStyle(
                                      color: Colors.green[800],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    store.clearSuccessFeedback();
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.green[800],
                                  ),
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Text(
                              'ID: ${store.postCepBackForAppEntity.objectId}',
                              style: TextStyle(color: Colors.green[800]),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'A lista foi atualizada automaticamente.',
                              style: TextStyle(color: Colors.green[800]),
                            ),
                          ],
                        ),
                      )
                    : SizedBox.shrink(),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Observer(
                    builder: (_) => Text(
                      'CEPs Salvos (${store.getUniqueCepsCount()})',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Observer(
                    builder: (_) => IconButton(
                      onPressed: store.loading
                          ? null
                          : () {
                              store.getCepBackForApp();
                            },
                      icon: store.loading
                          ? SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Icon(Icons.refresh),
                      tooltip: 'Recarregar lista',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                constraints: BoxConstraints(minHeight: 200, maxHeight: 300),
                child: Observer(
                  builder: (context) {
                    if (store.loading && store.listCepBack.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 16),
                            Text('Carregando lista de CEPs...'),
                          ],
                        ),
                      );
                    }

                    if (store.listCepBack.isEmpty && !store.loading) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.list_alt, size: 64, color: Colors.grey),
                            SizedBox(height: 16),
                            Text(
                              'Nenhum CEP encontrado',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Insira um CEP para começar',
                              style: TextStyle(color: Colors.grey[500]),
                            ),
                          ],
                        ),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: store.listCepBack.length,
                      itemBuilder: (context, index) {
                        final cep = store.listCepBack[index];
                        final isDuplicate =
                            index > 0 &&
                            store.listCepBack.take(index).any((prevCep) {
                              if (prevCep.cep == null || cep.cep == null) {
                                return false;
                              }
                              final prevClean = prevCep.cep!.replaceAll(
                                RegExp(r'[^\d]'),
                                '',
                              );
                              final currentClean = cep.cep!.replaceAll(
                                RegExp(r'[^\d]'),
                                '',
                              );
                              return prevClean == currentClean;
                            });

                        return InkWell(
                          onTap: () {
                            store.fillCep(cep);
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.location_on,
                              color: isDuplicate ? Colors.orange : Colors.blue,
                            ),
                            title: Text(
                              cep.cep ?? 'CEP não informado',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isDuplicate ? Colors.orange[800] : null,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cep.logradouro ?? 'Endereço não informado',
                                ),
                                if (isDuplicate)
                                  Text(
                                    '⚠️ Duplicado',
                                    style: TextStyle(
                                      color: Colors.orange[800],
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                              ],
                            ),
                            trailing: Text(
                              '📪',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        limparCampos();
                      },
                      child: Text("Cancelar"),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Observer(
                      builder: (context) {
                        return ElevatedButton(
                          onPressed: () async {
                            if (_cepController.text.isNotEmpty) {
                              final wasAdded = await store.postCepBackForApp(
                                CepBackForAppParams(
                                  cep: Cep(
                                    cep: _cepController.text,
                                    logradouro: store.viaCepEntity.logradouro,
                                    complemento: store.viaCepEntity.complemento,
                                    unidade: store.viaCepEntity.unidade,
                                    bairro: store.viaCepEntity.bairro,
                                    localidade: store.viaCepEntity.localidade,
                                    uf: store.viaCepEntity.uf,
                                    estado: store.viaCepEntity.estado,
                                    regiao: store.viaCepEntity.regiao,
                                    ibge: store.viaCepEntity.ibge,
                                    gia: store.viaCepEntity.gia,
                                    ddd: store.viaCepEntity.ddd,
                                    siafi: store.viaCepEntity.siafi,
                                  ),
                                ),
                              );
                              if (wasAdded) {
                                limparCampos();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.green[600],
                                    content: Text('CEP inserido com sucesso!'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red[600],
                                    content: Text('Selecione um CEP válido!!'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red[600],
                                  content: Text('Selecione um CEP válido!!'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                          child: Text("Inserir"),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
