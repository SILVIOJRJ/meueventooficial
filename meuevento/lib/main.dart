import 'package:flutter/material.dart';
import 'login.dart';
import 'cadastro.dart';

void main() {
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
