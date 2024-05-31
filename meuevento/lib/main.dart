import 'package:flutter/material.dart';
import 'login.dart';
import 'cadastro.dart';
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
        '/cadastro': (context) =>
            CadastroPage(), 
      },
    );
  }
}
