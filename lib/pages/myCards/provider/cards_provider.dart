import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mymantra/pages/myCards/models/category_model.dart';
import 'package:mymantra/pages/myCards/Repository/cards_impl.dart';

class CardsProvider extends ChangeNotifier {
  List<MyCardsCategory> _categoryList = [];
  List<MyCardsCategory> get categoryList => _categoryList;

  CardsProvider(){
    loadCategoryList();
  }

  Future<void> loadCategoryList() async{
    final loadedCategories = await CardsImpl().getAllCategories();
    _categoryList.addAll(loadedCategories);
    notifyListeners();
  }
}