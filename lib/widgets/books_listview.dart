import 'package:flutter/material.dart';

import 'book_item.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Famous Books',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                ),
          ),
          const SizedBox(height: 25.0),
          ListView.separated(
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return const BookItem();
            },
            separatorBuilder: (context, index) => const SizedBox(height: 25.0),
            itemCount: 5,
          ),
        ],
      ),
    );
  }
}
