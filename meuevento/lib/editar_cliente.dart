import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'gestao_clientes.dart'; // Importa a página GestaoClientesPage

class EditarClientePage extends StatefulWidget {
  final Map<String, dynamic> cliente;
  final Future<void> Function() onUpdate; // Função de retorno para atualizar os clientes

  EditarClientePage({required this.cliente, required this.onUpdate});

  @override
  _EditarClientePageState createState() => _EditarClientePageState();
}

class _EditarClientePageState extends State<EditarClientePage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dataNascimentoController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();

  final DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _nomeController.text = widget.cliente['nome'];
    _emailController.text = widget.cliente['email'];
    _dataNascimentoController.text = widget.cliente['data_nascimento'];
    _enderecoController.text = widget.cliente['endereco'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _dataNascimentoController,
              decoration: InputDecoration(
                labelText: 'Data de Nascimento',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _enderecoController,
              decoration: InputDecoration(
                labelText: 'Endereço',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _salvarAlteracoes,
              child: Text('Salvar Alterações'),
            ),
          ],
        ),
      ),
    );
  }

  void _salvarAlteracoes() async {
    Map<String, dynamic> clienteAtualizado = {
      'id': widget.cliente['id'],
      'nome': _nomeController.text,
      'email': _emailController.text,
      'data_nascimento': _dataNascimentoController.text,
      'endereco': _enderecoController.text,
      'senha': widget.cliente['senha'], // Mantém a senha original
    };

    // Atualiza os dados do cliente no banco de dados
    await _dbHelper.editarCliente(clienteAtualizado);

    // Após salvar as alterações, chama a função onUpdate para atualizar a lista de clientes na página GestaoClientesPage
    widget.onUpdate();

    // Retorna para a página anterior
    Navigator.pop(context);
  }
}