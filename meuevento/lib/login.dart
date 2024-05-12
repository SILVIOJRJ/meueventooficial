import 'package:flutter/material.dart';
import 'package:meuevento/cadastro.dart';
import 'home_screen.dart'; // Importe a tela inicial da sua aplicação
import 'admin_login.dart';

class LoginPage extends StatelessWidget {
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
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 50),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 220),
            ElevatedButton(
              onPressed: () {
                // Lógica para validar o login
                // Se o login for válido, redirecione para a tela inicial
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
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
            SizedBox(height: 190),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminLoginPage()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: Text('Acessar como administrador'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
