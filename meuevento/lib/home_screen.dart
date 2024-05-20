import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('meuEvento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Minha Localização:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Rua Exemplo, 123 - Bairro Exemplo, Cidade - UF',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Pesquise o que deseja',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Categorias:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  _buildCategoryButton(context, 'Eventos Esportivos'),
                  _buildCategoryButton(context, 'Cursos e Workshops'),
                  _buildCategoryButton(context, 'Peças Teatrais e Culturais'),
                  _buildCategoryButton(context, 'Cinema'),
                  _buildCategoryButton(context, 'Eventos Religiosos'),
                  _buildCategoryButton(context, 'Turismo'),
                  _buildCategoryButton(context, 'Alimentação'),
                  _buildCategoryButton(
                      context, 'Eventos Comerciais e Inaugurações'),
                  _buildCategoryButton(context, 'Shows Musicais'),
                  _buildCategoryButton(context, 'Saúde e Bem-Estar'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
              },
            ),
            IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(BuildContext context, String title) {
    return ElevatedButton(
      onPressed: () {
      },
      child: Text(title),
    );
  }
}
