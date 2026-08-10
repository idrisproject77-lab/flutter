import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/user_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();

    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();

    final path = join(
      dbPath,
      'tugas12.db',
    );

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nama TEXT NOT NULL,
            email TEXT NOT NULL,
            no_hp TEXT NOT NULL,
            password TEXT NOT NULL,
            kota TEXT NOT NULL
          )
        ''');
      },
    );
  }

  // CREATE
  Future<int> insertUser(UserModel user) async {
    final db = await database;

    return await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // READ
  Future<List<UserModel>> getUsers() async {
    final db = await database;

    final result = await db.query(
      'users',
      orderBy: 'id DESC',
    );

    return result
        .map(
          (map) => UserModel.fromMap(map),
        )
        .toList();
  }
  // UPDATE
Future<int> updateUser(UserModel user) async {
  final db = await database;

  return await db.update(
    'users',
    user.toMap(),
    where: 'id = ?',
    whereArgs: [user.id],
  );
}

// DELETE
Future<int> deleteUser(int id) async {
  final db = await database;

  return await db.delete(
    'users',
    where: 'id = ?',
    whereArgs: [id],
  );
}
}
