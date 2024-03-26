import 'dart:io';

import 'package:mymantra/pages/quote_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      print('brak');
      return _database!;
    }
    _database = await initDatabase();
    print('inicjalizacja');
    return _database!;
  }

  Future<Database> initDatabase() async {
    print('inicjalizacja');
    // Ścieżka do bazy danych na urządzeniu
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'my_database.db');

    // Sprawdź, czy baza danych już istnieje
    bool exists = await databaseExists(path);

    if (!exists) {
      print("Hello, world!"); // Wypisuje "Hello, world!" w konsoli lub terminalu

      // Kopia bazy danych z zasobów (assets) do lokalizacji na urządzeniu
      ByteData data = await rootBundle.load('assets/database/my_database.sqlite');
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true); // Changed to writeAsBytes
    }

    // Otwórz lub stwórz bazę danych
    return openDatabase(path, readOnly: true);
  }

  Future<QuoteDao> getQuoteDao() async {
    final db = await database;
    return QuoteDao(db);
  }

}
