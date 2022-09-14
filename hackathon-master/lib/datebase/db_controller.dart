import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbController {
  DbController._();
  late Database _database;
  static DbController? _instance;
  factory DbController(){
    return _instance ??= DbController._();
  }

  Database get database => _database;

  Future<void> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'app_db.sql');
    _database = await openDatabase(
      path,
      version: 3,
      onOpen: (Database database) {},
      onCreate: (Database database, int version) async {

        //TODO: Create tables (users) USING SQL

        await database.execute('CREATE TABLE IF NOT EXISTS reservations ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'name TEXT NOT NULL,'
            'date TEXT NOT NULL,'
            'status TEXT NOT NULL,'
            'productId TEXT NOT NULL,'
            'userId TEXT NOT NULL,'
            'address TEXT NOT NULL'
            ')');
      },
      onUpgrade: (Database database, int oldVersion, int newVersion) async{

        await database.execute('CREATE TABLE IF NOT EXISTS reservations ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'name TEXT NOT NULL,'
            'date TEXT NOT NULL,'
            'status TEXT NOT NULL,'
            'productId TEXT NOT NULL,'
            'userId TEXT NOT NULL,'
            'address TEXT NOT NULL'
            ')');
      },
      onDowngrade: (Database database, int oldVersion, int newVersion) {},
    );
  }
}