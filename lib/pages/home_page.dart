import 'package:calculadora_imc_flutter/models/imc_model.dart';
import 'package:calculadora_imc_flutter/repository/imc_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.titulo});

  final String titulo;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pesoController = TextEditingController();
  final _alturaController = TextEditingController();

  final _listaImc = ImcRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titulo),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: const Icon(Icons.calculate),
      ),
      body: SingleChildScrollView(
        child: Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Icon(
                    Icons.calculate,
                    size: 100,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: 256,
                  height: 64,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Peso",
                    ),
                    controller: _pesoController,
                  ),
                ),
                SizedBox(
                  width: 256,
                  height: 96,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Altura",
                    ),
                    controller: _alturaController,
                  ),
                ),
                SizedBox(
                  width: 256,
                  height: 64,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue[400],
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      var imc = ImcModel(double.parse(_pesoController.text),
                          double.parse(_alturaController.text));
                      _listaImc.adicionaImc(imc);
                    },
                    child: const Text("Calcular IMC"),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
