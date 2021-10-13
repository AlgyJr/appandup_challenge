import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';
import '../utils/services/book_service.dart';
import '../utils/providers/books_provider.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          const SizedBox(height: 30.0),
          Text(
            'Explore thousands of books on the go',
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                  fontSize: 28,
                ),
          ),
          const SizedBox(height: 40.0),
          Container(
            height: 65.0,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset.zero,
                  blurRadius: 15.0,
                  spreadRadius: 0.7,
                ),
              ],
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                child: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (String query) async {
                    if (query.trim().isNotEmpty) {
                      BookService()
                          .getBooks(query.trim())
                          .then((List<Book> books) {
                        Provider.of<BooksProvider>(context, listen: false)
                            .books = books;
                      });
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'Search for books...',
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      size: 35.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
