import 'package:flutter/material.dart';
import 'login.dart';
import 'cadastro.dart';
import 'gestao_clientes.dart'; // Importe o arquivo gestao_clientes.dart
import 'gestao_eventos.dart'; // Importe o arquivo gestao_eventos.dart
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'meuEvento',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), 
      routes: {
        '/cadastro': (context) => CadastroPage(),
        '/gestao_clientes': (context) => GestaoClientesPage(), // Adicione a rota para GestaoClientesPage
        '/gestao_eventos': (context) => GestaoEventosPage(), // Adicione a rota para GestaoEventosPage
      },
    );
  }
}