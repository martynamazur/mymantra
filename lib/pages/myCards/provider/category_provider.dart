
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mymantra/pages/myCards/Repository/cards_impl.dart';

import '../../../models/category_model.dart';
import '../Repository/cards_repository.dart';

final categoryRepositoryProvider = Provider<CardsRepository>((ref) {
  return CardsImpl();
});

final fetchCategoryListProvider = FutureProvider<AsyncValue<List<MyCardsCategory>>>((ref) async{
  final repository = ref.watch(categoryRepositoryProvider);
  try{
    final categories = await repository.getAllCategories();
    return AsyncValue.data(categories);
  }catch (error){
    return AsyncValue.error(error, StackTrace.current);
  }
});