import 'package:mymantra/models/quote_model.dart';
import 'package:mymantra/pages/home/repository/quotes_repository.dart';

import '../../../database/database_helper.dart';

class QuoteImpl extends QuoteRepository {
  @override
  Stream<void> deleteQuoteStream() {
    // TODO: implement deleteQuoteStream
    throw UnimplementedError();
  }

  @override
  Stream<List<Quote>> fetchQuotesStream() async* {
    final databaseHelper = DatabaseHelper();
    final quoteDao = await databaseHelper.getQuoteDao();
    final loadedQuotes = await quoteDao.getAllQuotes();

    yield loadedQuotes;
  }


  @override
  Stream<void> moveQuoteToFolderStream() {
    // TODO: implement moveQuoteToFolderStream
    throw UnimplementedError();
  }

  @override
  Stream<void> updateFavouriteStatusStream() {
    // TODO: implement updateFavouriteStatusStream
    throw UnimplementedError();
  }

}
