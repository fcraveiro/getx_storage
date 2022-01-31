import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  // Inicializa
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final box = GetStorage();
String valorDaChave = '';

class _MyHomePageState extends State<MyHomePage> {
  //
  // Rotina do Storage
  //
  @override
  void initState() {
    // Se não existir grava algo para criar a Chave
    if (box.read('suachave') == null) {
      box.write('suachave', 'oSeuValor');
    }

    // Recupera o valor dentro da Chave
    valorDaChave = box.read('suachave');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Getx Storage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              // Exibindo a variável com a Chave
              valorDaChave,
            ),
          ],
        ),
      ),
    );
  }
}
