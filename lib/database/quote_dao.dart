
import 'package:mymantra/models/quote_model.dart';
import 'package:sqflite/sqflite.dart';



class QuoteDao {
  final Database _database;
  QuoteDao(this._database);

  Future<int> insert(Quote quote) async{
    return await _database.insert('quotes', quote.toMap());
  }

  Future<void> delete(int quote_id) async{
    await _database.delete(
        'quotes',
        where: 'quote_id =?',
        whereArgs: [quote_id]
    );
  }

  Future<List<Quote>> getAllQuotes() async {
    final List<Map<String, dynamic>> quotesMapList = await _database.query('Quotes');
    return List.generate(quotesMapList.length, (index) {
      return Quote(
        quotesMapList[index]['quote_id'],
        quotesMapList[index]['quote_content'],
        quotesMapList[index]['category_id'],
        quotesMapList[index]['is_created'],
        quotesMapList[index]['is_favourite'],

      );
    });
  }

  Future <void> setFavouriteStatus(int quoteId, int isFavorite) async{
    await _database.update(
      'Quotes',
      {'is_favourite': isFavorite},
      where: 'quote_id = ?',
      whereArgs: [quoteId]
    );
  }



  Future<List<Quote>> getAllFavouriteQuotes() async {
    final List<Map<String, dynamic>> favouriteQuotesMapList = await _database.query(
      'Quotes',
      where: 'is_favourite = ?',
      whereArgs: [1], // 1 oznacza, że cytaty są oznaczone jako ulubione
    );

    return List.generate(favouriteQuotesMapList.length, (index) {
      return Quote(
        favouriteQuotesMapList[index]['quote_id'],
        favouriteQuotesMapList[index]['quote_content'],
        favouriteQuotesMapList[index]['category_id'],
        favouriteQuotesMapList[index]['is_created'],
        favouriteQuotesMapList[index]['is_favourite'],
      );
    });
  }

}