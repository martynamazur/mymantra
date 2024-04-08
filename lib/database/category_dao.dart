import 'package:flutter/foundation.dart';
import 'package:mymantra/pages/myCards/models/category_model.dart';
import 'package:sqflite/sqflite.dart';

class CategoryDao{
  final Database _database;

  CategoryDao(this._database);

  Future<List<MyCardsCategory>> getAllCategories() async {
    final List<Map<String, dynamic>> categoriesMapList = await _database.query('Category');

    return List.generate(categoriesMapList.length, (index) {
      return MyCardsCategory(
        categoriesMapList[index]['category_id'],
        categoriesMapList[index]['category_name'],
        //categoriesMapList[index]['category_icon_path'],
      );
    });
  }


}