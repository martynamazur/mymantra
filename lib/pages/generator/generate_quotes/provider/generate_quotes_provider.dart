import 'package:flutter_riverpod/flutter_riverpod.dart';



final generatedQuotesProvider = StateProvider<List<String>>((ref) {
  return [];
});

final quoteDescriptionProvider = StateProvider<String>((ref) {
  return "";
});

final promptInputTextFieldProvider = StateProvider<String>((ref){
  return "";
});

final dropdownMenuEntriesProvider = StateProvider<List<int>>((ref) {
  return [2, 5, 10, 15, 20];
});

final selectedQuoteAmountProvider = StateProvider<int>((ref) {
  return 2;
});

final isQuoteShortProvider = StateProvider<bool>((ref) {
  return true;
});

final responseProvider = StateProvider<String>((ref){
  return "";
});