import 'package:flutter/material.dart';
import 'cadastro.dart';
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
              height:
                  200, // Reduzindo o espaçamento entre a barra de título e o primeiro campo
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
                height: 50), // Reduzindo o espaçamento entre os campos de texto
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
                height:
                    220), // Reduzindo o espaçamento entre os campos e os botões
            ElevatedButton(
              onPressed: () {
                // Lógica para validar o login
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12), // Reduzindo o espaçamento vertical
                child: Text('Entrar'),
              ),
            ),
            SizedBox(
                height:
                    30), // Reduzindo o espaçamento entre o botão de login e o próximo
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CadastroPage()),
                );
              },
              child: Text('Clique aqui e cadastre-se agora'),
            ),
            SizedBox(
                height:
                    190), // Espaçamento maior entre os botões e a parte inferior da tela
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminLoginPage()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 1), // Reduzindo o espaçamento vertical
                child: Text('Acessar como administrador'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
