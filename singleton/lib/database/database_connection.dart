import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection {
  // Base do nosso Singleton:
  DatabaseConnection._();
  static final DatabaseConnection _instance = DatabaseConnection._();
  static DatabaseConnection get instance => _instance;
  //

  // Variáveis do Sqlite:
  static const version = 1;
  static const databaseName = "singleton_flutter_db";
  //

  // Database:
  static Database? _database;
  Future<Database> get database => _openDatabaseConnection();
  //

  // Métodos:
  Future<Database> _openDatabaseConnection() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    _database ??= await openDatabase(
      path,
      version: version,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      onDowngrade: _onDowngrade,
      onConfigure: _onConfigure,
    );

    return _database!;
  }

  FutureOr<void> _onCreate(Database db, int version) {
    db.execute('create table teste(nome varchar(200))');
    db.execute('insert into teste values("João Victor")');
    db.execute('insert into teste values("Maria Helena")');
    db.execute('insert into teste values("Duda Almeida")');
    db.execute('insert into teste values("Carla Martins")');
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) {}

  FutureOr<void> _onDowngrade(Database db, int oldVersion, int newVersion) {}

  FutureOr<void> _onConfigure(Database db) {}

  Future<void> closeDatabaseConnection() async {
    await _database?.close();
    _database = null;
  }
  //
}
