import 'package:flutter/material.dart';

import '../widgets/books_listview.dart';
import '../widgets/home_header.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: const [
          HomeHeader(),
          SizedBox(height: 30.0),
          BooksListView(),
        ],
      ),
    );
  }
}
