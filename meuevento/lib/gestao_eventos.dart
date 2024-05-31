import 'package:flutter/material.dart';
import 'database_helper.dart';

class GestaoEventosPage extends StatefulWidget {
  @override
  _GestaoEventosPageState createState() => _GestaoEventosPageState();
}

class _GestaoEventosPageState extends State<GestaoEventosPage> {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestão de Eventos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Adicione a lógica para navegar para a tela de cadastro de evento
              },
              child: Text('Cadastrar Evento'),
            ),
            ElevatedButton(
              onPressed: () {
                // Adicione a lógica para navegar para a tela de alteração de evento
              },
              child: Text('Alterar Evento'),
            ),
            ElevatedButton(
              onPressed: () {
                // Adicione a lógica para navegar para a tela de listagem de eventos
              },
              child: Text('Listar Eventos'),
            ),
            ElevatedButton(
              onPressed: () {
                // Adicione a lógica para navegar para a tela de exclusão de evento
              },
              child: Text('Excluir Evento'),
            ),
          ],
        ),
      ),
    );
  }
}