import 'package:mymantra/pages/myCards/models/category_model.dart';
import 'package:mymantra/pages/myCards/Repository/cards_repository.dart';

import '../../../database/database_helper.dart';

class CardsImpl extends CardsRepository {
  @override
  Future<List<MyCardsCategory>> getAllCategories() async {
    final databaseHelper = DatabaseHelper();
    final categoryDao = await databaseHelper.getCategoryDao();
    return categoryDao.getAllCategories();
  }
}
