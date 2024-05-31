import 'package:flutter/material.dart';
import 'database_helper.dart';

class GestaoClientesPage extends StatefulWidget {
  @override
  _GestaoClientesPageState createState() => _GestaoClientesPageState();
}

class _GestaoClientesPageState extends State<GestaoClientesPage> {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestão de Clientes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _cadastrarCliente();
              },
              child: Text('Cadastrar Cliente'),
            ),
            ElevatedButton(
              onPressed: () {
                _alterarCliente();
              },
              child: Text('Alterar Cliente'),
            ),
            ElevatedButton(
              onPressed: () {
                _listarClientes();
              },
              child: Text('Listar Clientes'),
            ),
            ElevatedButton(
              onPressed: () {
                _excluirCliente();
              },
              child: Text('Excluir Cliente'),
            ),
          ],
        ),
      ),
    );
  }

  void _cadastrarCliente() {
    // Aqui você pode chamar a função de cadastro de cliente do DatabaseHelper
  }

  void _alterarCliente() {
    // Aqui você pode chamar a função de alteração de cliente do DatabaseHelper
  }

  void _listarClientes() async {
    // Aqui você pode chamar a função de listagem de clientes do DatabaseHelper
    List<Map<String, dynamic>> clientes = await _dbHelper.getAllClientes();
    // Exemplo de como usar os dados retornados:
    print(clientes);
  }

  void _excluirCliente() {
    // Aqui você pode chamar a função de exclusão de cliente do DatabaseHelper
  }
}