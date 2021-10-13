import 'dart:convert';

import 'package:appandup_book/constants/app_constants.dart';
import 'package:http/http.dart' as http;

import '../../models/book.dart';

class BookService {
  Future<List<Book>> getBooks(String query) async {
    final uri =
        Uri.parse("$apiUrl/volumes?q=$query&printType=books&key=$apiKey");

    final res = await http.get(uri);

    if (res.statusCode == 200) {
      final json = jsonDecode(res.body) as Map<String, dynamic>;

      final List<Book> books = [];

      final items = json['items'] as List<dynamic>?;

      if (items == null) return [];

      for (var item in items) {
        books.add(Book.fromJson(item));
      }

      return books;
    } else {
      throw Exception('Failed to load books!');
    }
  }

  // TODO: get single Book data by selfLink
}
