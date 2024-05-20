import 'package:flutter/material.dart';
import 'login.dart';
import 'cadastro.dart';
import 'package:sqflite/sqflite.dart';
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
      title: 'Eventos App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), // Defina a tela de login como a tela inicial
      routes: {
        '/cadastro': (context) =>
            CadastroPage(), // Defina a rota para a tela de cadastro
      },
    );
  }
}
