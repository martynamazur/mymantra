import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mymantra/models/quote_model.dart';
import 'package:mymantra/pages/database_helper.dart';

class FavouriteModel {


  List<Quote> quotes = [];

  Future<List<Quote>> loadQuotes() async {
    try {
      final databaseHelper = DatabaseHelper();
      final quoteDao = await databaseHelper.getQuoteDao();
      final loadedQuotes = await quoteDao.getAllFavouriteQuotes();
      return loadedQuotes;

    } catch (e) {
      return [];
    }
  }

  Future<void> removeQuoteFromFavourites(int quoteId) async{
    try{
      final databaseHelper = DatabaseHelper();
      final quoteDao = await databaseHelper.getQuoteDao();
      await quoteDao.setFavouriteStatus(quoteId, 0);

      quotes.removeWhere((quote) => quote.quote_id == quoteId);

    }catch (e){

    }
  }
}

