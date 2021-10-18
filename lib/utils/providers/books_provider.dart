import 'package:appandup_book/models/book.dart';
import 'package:flutter/material.dart';

class BooksProvider extends ChangeNotifier {
  List<Book> _books = [];

  List<Book> get books => [..._books];

  set books(List<Book> books) {
    _books = books;
    notifyListeners();
  }

  Book findBook(String id) {
    return _books.firstWhere((book) => book.id == id);
  }

  void updateFavoriteBook(String bookId, bool isFavorite) {
    _books.firstWhere((book) => book.id == bookId).isFavorite = isFavorite;
    notifyListeners();
  }

  void setUserFavBooks(List<dynamic> booksId) {
    _books.forEach((book) {
      if (booksId.contains(book.id)) {
        book.isFavorite = true;
      }
    });
    notifyListeners();
  }
}
