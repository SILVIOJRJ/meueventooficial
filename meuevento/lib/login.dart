import 'package:flutter/material.dart';
import 'cadastro.dart';
import 'home_screen.dart';
import 'admin_page.dart';
import 'database_helper.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 50),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                // Verificar se os campos estão vazios
                if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Erro'),
                        content: Text('Por favor, insira seu email e senha.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                  return;
                }

                // Verificar as credenciais de login
                String email = _usernameController.text;
                String password = _passwordController.text;

                print('Email: $email');
                print('Password: $password');

                // Verificar se é admin
                if (email == 'admin' && password == 'admin') {
                  print('Admin login');
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => AdminPage()),
                  );
                } else {
                  // Verificar no banco de dados
                  List<Map<String, dynamic>> result = await _dbHelper.getClientByEmail(email);
                  print('Result: $result');
                  if (result.isNotEmpty && result[0]['senha'] == password) {
                    print('Client login');
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  } else {
                    // Exibir um alerta de credenciais inválidas
                    print('Invalid credentials');
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Erro'),
                          content: Text('Credenciais inválidas ou usuário não cadastrado.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text('Entrar'),
              ),
            ),
            SizedBox(height: 30),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CadastroPage()),
                );
              },
              child: Text('Clique aqui e cadastre-se agora'),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}