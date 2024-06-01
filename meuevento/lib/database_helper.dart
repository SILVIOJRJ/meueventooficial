import 'package:meuevento/editar_cliente.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'eventos_app.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        email TEXT,
        data_nascimento TEXT,
        endereco TEXT,
        senha TEXT
      )
      ''');

    await db.execute('''
      CREATE TABLE eventos(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        titulo TEXT,
        descricao TEXT,
        data TEXT,
        local TEXT
      )
      ''');
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    Database db = await database;
    return await db.insert('users', user);
  }

  Future<int> insertEvento(Map<String, dynamic> evento) async {
    Database db = await database;
    return await db.insert('eventos', evento);
  }

  Future<List<Map<String, dynamic>>> getAllClientes() async {
    Database db = await database;
    return await db.query('users');
  }

  Future<List<Map<String, dynamic>>> getAllEventos() async {
    Database db = await database;
    return await db.query('eventos');
  }

  Future<List<Map<String, dynamic>>> getClientByEmail(String email) async {
    Database db = await database;
    return await db.query('users', where: 'email = ?', whereArgs: [email]);
  }
  Future<int> updateCliente(Map<String, dynamic> cliente) async {
  Database db = await database;
  return await db.update(
    'users',
    cliente,
    where: 'id = ?',
    whereArgs: [cliente['id']],
  );
}

Future<int> deleteCliente(int id) async {
  Database db = await database;
  return await db.delete(
    'users',
    where: 'id = ?',
    whereArgs: [id],
  );
}

Future<int> editarCliente(Map<String, dynamic> cliente) async {
  Database db = await database;
  return await db.update(
    'users',
    cliente,
    where: "id = ?",
    whereArgs: [cliente['id']],
  );
}
}