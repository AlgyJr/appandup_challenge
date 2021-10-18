import 'package:appandup_book/models/book.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatelessWidget {
  static const routeName = '/{id}';

  const BookDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final book = ModalRoute.of(context)!.settings.arguments as Book;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
            Text(book.title, style: const TextStyle(fontFamily: 'Montserrat')),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBookImage(book),
                  _buildBookProperties(book),
                ],
              ),
              const SizedBox(height: 15.0),
              SizedBox(
                height: 120,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildRatingsCountBanner(
                          book.ratingsCount, book.averageRating),
                      _buildPageCountsBanner(book.pageCount),
                      _buildLanguageBanner(book.language),
                    ],
                  ),
                ),
              ),
              Text(
                'Description',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontFamily: 'Montserrat', color: Colors.black),
              ),
              const SizedBox(height: 8.0),
              Text(book.description),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  Flexible _buildBookProperties(Book book) {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          InfoLabel(first: 'Title', value: book.title),
          InfoLabel(first: 'Authors', value: book.authors.join(', ')),
          InfoLabel(first: 'Publisher', value: book.publisher),
          InfoLabel(
            first: 'Published date',
            value: book.publishedDate?.toString() ?? '',
          ),
        ],
      ),
    );
  }

  Container _buildBookImage(Book book) {
    return Container(
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
        errorBuilder: (context, error, stackTrace) =>
            Container(color: Colors.grey.shade300),
      ),
    );
  }

  Column _buildLanguageBanner(String language) {
    return Column(
      children: [
        const Text('Language'),
        Text(
          language.toUpperCase(),
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  Column _buildPageCountsBanner(int pageCount) {
    return Column(
      children: [
        const Text('Page counts'),
        Text(
          '$pageCount',
          style: const TextStyle(fontSize: 18),
        ),
        const Icon(
          Icons.menu_book_sharp,
          color: Colors.grey,
        ),
      ],
    );
  }

  Column _buildRatingsCountBanner(int ratingsCount, double averageRating) {
    return Column(
      children: [
        Text('$ratingsCount ratings'),
        Column(
          children: [
            Text(
              '$averageRating',
              style: const TextStyle(fontSize: 18),
            ),
            const Icon(
              Icons.star_outlined,
              color: Colors.grey,
            ),
          ],
        ),
      ],
    );
  }
}

class InfoLabel extends StatelessWidget {
  const InfoLabel({
    Key? key,
    required this.first,
    required this.value,
  }) : super(key: key);

  final String first;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$first: ',
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          Flexible(
            child: Text(
              value,
              softWrap: true,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
