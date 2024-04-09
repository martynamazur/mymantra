import 'dart:js_interop';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mymantra/database/database_helper.dart';
import 'package:mymantra/pages/home/repository/quotes_impl.dart';
import 'package:mymantra/pages/home/repository/quotes_repository.dart';

import '../../../models/quote_model.dart';

final currentQuoteSetProvider = StateProvider((ref) => 1);
final databaseHelperProvider = Provider((ref) => DatabaseHelper());

final quoteRepositoryProvider = Provider<QuoteRepository>((ref) {
  return QuoteImpl();
});

final fetchQuoteListProvider = StreamProvider<List<Quote>>((ref) async* {
  final repository = ref.watch(quoteRepositoryProvider);
  final quotesStream = await repository.fetchQuotesStream();

  await for (final quotes in quotesStream) {
    yield quotes;
  }
});
