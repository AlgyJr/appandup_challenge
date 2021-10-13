import 'package:appandup_book/utils/providers/books_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/books_listview.dart';
import '../widgets/home_header.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BooksProvider(),
      child: Scaffold(
        body: ListView(
          scrollDirection: Axis.vertical,
          children: const [
            HomeHeader(),
            SizedBox(height: 30.0),
            BooksListView(),
          ],
        ),
      ),
    );
  }
}
