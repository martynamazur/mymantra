
import 'package:mymantra/models/category_model.dart';

abstract class CardsRepository{
  Future<List<MyCardsCategory>> getAllCategories();
}