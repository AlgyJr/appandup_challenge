import 'package:flutter/material.dart';

import '../models/book.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      padding: const EdgeInsets.all(10.0),
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
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 128.0,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(10.0),
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.network(
              "${book.imageLinks['thumbnail']}",
              fit: BoxFit.cover,
              // TODO: add loading builder
              // TODO: add error builder
            ),
          ),
          const SizedBox(width: 15.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'by ${book.publisher}',
                  style: Theme.of(context).textTheme.caption,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10.0),
                Text(
                  book.title,
                  style:
                      const TextStyle(fontFamily: 'Montserrat', fontSize: 16.0),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 15.0,
                    ),
                    const SizedBox(width: 8.0),
                    Text("${book.averageRating}",
                        style: Theme.of(context).textTheme.caption),
                  ],
                ),
                const SizedBox(height: 12.0),
                Container(
                  width: 100.0,
                  padding: const EdgeInsets.symmetric(
                      vertical: 3.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: const Center(
                    child: Text(
                      'Minimalism',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
