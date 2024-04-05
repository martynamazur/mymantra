
import 'package:mymantra/pages/myCards/models/category_model.dart';

abstract class CardsRepository{
  Future<List<MyCardsCategory>> getAllCategories();
}