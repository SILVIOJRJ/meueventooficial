import 'package:flutter/material.dart';
import 'package:meuevento/editar_cliente.dart';
import 'database_helper.dart';


class GestaoClientesPage extends StatefulWidget {
  @override
  _GestaoClientesPageState createState() => _GestaoClientesPageState();
}

class _GestaoClientesPageState extends State<GestaoClientesPage> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _clientes = [];

  @override
  void initState() {
    super.initState();
    _carregarClientes();
  }

  Future<void> _carregarClientes() async {
    List<Map<String, dynamic>> clientes = await _dbHelper.getAllClientes();
    setState(() {
      _clientes = clientes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestão de Clientes'),
      ),
      body: _clientes.isEmpty
          ? Center(
              child: Text('Nenhum cliente encontrado.'),
            )
          : ListView.builder(
              itemCount: _clientes.length,
              itemBuilder: (context, index) {
                final cliente = _clientes[index];
                return Card(
                  child: ListTile(
                    title: Text('ID: ${cliente['id']}, Nome: ${cliente['nome']}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email: ${cliente['email']}'),
                        Text('Data de Nascimento: ${cliente['data_nascimento']}'),
                        Text('Endereço: ${cliente['endereco']}'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            _editarCliente(cliente);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _excluirCliente(cliente['id']);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  void _editarCliente(Map<String, dynamic> cliente) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => EditarClientePage(
        cliente: cliente,
        onUpdate: _carregarClientes, // Passa a função de atualização como argumento
      ),
    ),
  );
}

  void _excluirCliente(int clienteId) async {
    await _dbHelper.deleteCliente(clienteId);
    _carregarClientes();
  }
  
}
