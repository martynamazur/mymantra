import 'package:mymantra/models/quote_model.dart';

//managing quotes
// fetching all quotes from certain category based on Id stored in state
// change favourite status

// delete,remove quote // from category(folder)  - only when the quote is created by user
// change quote category to different id  -moving to other folder ; -only when the quote is created by user
//

abstract class QuoteRepository {
  Stream<List<Quote>> fetchQuotesStream();
  Stream<void> updateFavouriteStatusStream();
  Stream<void> deleteQuoteStream();
  Stream<void> moveQuoteToFolderStream();

}
