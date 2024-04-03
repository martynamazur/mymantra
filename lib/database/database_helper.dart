import 'dart:io';

import 'package:mymantra/database/quote_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';

import 'category_dao.dart';
import 'my_folders_dao.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'my_database.db');
    bool exists = await databaseExists(path);

    if (!exists) {
      ByteData data =
      await rootBundle.load('assets/database/my_database.sqlite');
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path)
          .writeAsBytes(bytes, flush: true); // Changed to writeAsBytes


      await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
            await db.execute('''
          CREATE TABLE IF NOT EXISTS Folders (
            folder_id INTEGER PRIMARY KEY AUTOINCREMENT,
            folder_name TEXT NOT NULL
          )
        ''');
          }
      );
    }

    return openDatabase(path, readOnly: true);
  }


  Future<QuoteDao> getQuoteDao() async {
    final db = await database;
    return QuoteDao(db);
  }

  Future<CategoryDao> getCategoryDao() async {
    return CategoryDao(_database!);

  }
  Future<FolderDao> getFolderDao() async{
    return FolderDao(_database!);

  }
}
