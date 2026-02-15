import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../types/quote.dart';

abstract class QuoteRepository {
  Future<Quote> fetchQuote();
}

final quoteProvider = Provider<QuoteRepository>(
  (ref) => throw UnimplementedError(),
);
