// ignore_for_file: must_be_immutable

import 'package:dio_viacep/via_cep/domain/entities/via_cep_entity.dart';
import 'package:dio_viacep/via_cep/ui/controller/edit_page_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EditPage extends StatefulWidget {
  ViaCepEntity? viaCepEntity;
  String objectId;

  EditPage({super.key, required this.viaCepEntity, required this.objectId});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final store = Modular.get<EditPageStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.viaCepEntity?.cep} - Editar'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Editar CEP: ${widget.viaCepEntity?.cep}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: widget.viaCepEntity?.logradouro,
                decoration: InputDecoration(labelText: 'Logradouro'),
                onChanged: (value) {
                  widget.viaCepEntity?.logradouro = value;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: widget.viaCepEntity?.complemento,
                decoration: InputDecoration(labelText: 'Complemento'),
                onChanged: (value) {
                  widget.viaCepEntity?.complemento = value;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: widget.viaCepEntity?.unidade,
                decoration: InputDecoration(labelText: 'Unidade'),
                onChanged: (value) {
                  widget.viaCepEntity?.unidade = value;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: widget.viaCepEntity?.bairro,
                decoration: InputDecoration(labelText: 'Bairro'),
                onChanged: (value) {
                  widget.viaCepEntity?.bairro = value;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: widget.viaCepEntity?.localidade,
                decoration: InputDecoration(labelText: 'Localidade'),
                onChanged: (value) {
                  widget.viaCepEntity?.localidade = value;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: widget.viaCepEntity?.uf,
                decoration: InputDecoration(labelText: 'Uf'),
                onChanged: (value) {
                  widget.viaCepEntity?.uf = value;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: widget.viaCepEntity?.estado,
                decoration: InputDecoration(labelText: 'Estado'),
                onChanged: (value) {
                  widget.viaCepEntity?.estado = value;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: widget.viaCepEntity?.regiao,
                decoration: InputDecoration(labelText: 'Região'),
                onChanged: (value) {
                  widget.viaCepEntity?.regiao = value;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: widget.viaCepEntity?.ibge,
                decoration: InputDecoration(labelText: 'Ibge'),
                onChanged: (value) {
                  widget.viaCepEntity?.ibge = value;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: widget.viaCepEntity?.gia,
                decoration: InputDecoration(labelText: 'Gia'),
                onChanged: (value) {
                  widget.viaCepEntity?.gia = value;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: widget.viaCepEntity?.ddd,
                decoration: InputDecoration(labelText: 'Ddd'),
                onChanged: (value) {
                  widget.viaCepEntity?.ddd = value;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: widget.viaCepEntity?.siafi,
                decoration: InputDecoration(labelText: 'Siafi'),
                onChanged: (value) {
                  widget.viaCepEntity?.siafi = value;
                },
              ),
              const SizedBox(height: 8),

              ElevatedButton(
                onPressed: () {
                  debugPrint('✅ Atualizando: ${widget.viaCepEntity}');
                  if (widget.viaCepEntity != null) {
                    store.putCepBackForApp(
                      viaCepEntity: widget.viaCepEntity!,
                      objectId: widget.objectId,
                    );
                    Navigator.pop(context, widget.viaCepEntity);
                  } else {
                    debugPrint('❌ Preencha os campos para atualizar o CEP.');
                  }
                },
                child: Text('Atualizar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
