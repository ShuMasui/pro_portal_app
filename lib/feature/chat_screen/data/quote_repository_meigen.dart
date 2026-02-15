import 'dart:convert';

import 'package:dio/dio.dart';

import '../domain/quote_repository.dart';
import '../types/quote.dart';

class QuoteRepositoryMeigen implements QuoteRepository {
  final Dio _dio;

  QuoteRepositoryMeigen({required Dio dio}) : _dio = dio;

  @override
  Future<Quote> fetchQuote() async {
    // 外部APIとの通信実体
    final response = await _dio.get(
      'https://meigen.doodlenote.net/api/json.php?c=1',
    );

    if (response.statusCode == 200) {
      return Quote.fromJson(jsonDecode(response.data)[0]);
    } else {
      throw Exception('Failed to load quote');
    }
  }
}
