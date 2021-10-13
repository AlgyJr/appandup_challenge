import 'package:appandup_book/models/book.dart';
import 'package:flutter/material.dart';

class BooksProvider extends ChangeNotifier {
  List<Book> _books = [];

  List<Book> get books => [..._books];

  set books(List<Book> books) {
    _books = books;
    notifyListeners();
  }
}
