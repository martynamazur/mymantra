import 'package:flutter/foundation.dart';
import '../database/database_helper.dart';
import 'quote_model.dart';

class ScrollQuoteModel extends ChangeNotifier {
  List<Quote> quotes = [];
  int currentPage = 0;

  ScrollQuoteModel() {
    loadQuotes();
  }

  Future<void> loadQuotes() async {
    try {
      final databaseHelper = DatabaseHelper();
      final quoteDao = await databaseHelper.getQuoteDao();
      final loadedQuotes = await quoteDao.getAllQuotes();
      //final repository = Provider.of<QuoteRepository>(context, listen: false);

      quotes.addAll(loadedQuotes);
      notifyListeners();
    } catch (e) {
      print('Error loading quotes: $e');
    }
  }

  void updateLikeState(newValue) {
    quotes[currentPage].is_favourite = newValue;
    notifyListeners();
  }

  void updatePage(newValue) {
    currentPage = newValue;
    notifyListeners();
  }
}
