import 'package:flutter/material.dart';

import '../widgets/books_listview.dart';
import '../widgets/home_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          HomeHeader(),
          const SizedBox(height: 30.0),
          const BooksListView(),
        ],
      ),
    );
  }
}
