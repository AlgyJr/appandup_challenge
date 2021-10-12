import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
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
            width: 130.0,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(15.0),
            ),
            // TODO: add Book Image
          ),
          const SizedBox(width: 15.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('by Joshua Becker',
                  style: Theme.of(context).textTheme.caption),
              const SizedBox(height: 10.0),
              const Text('The More of Less',
                  style: TextStyle(fontFamily: 'Montserrat', fontSize: 16.0)),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 15.0,
                  ),
                  const SizedBox(width: 8.0),
                  Text('4.5', style: Theme.of(context).textTheme.caption),
                ],
              ),
              const SizedBox(height: 12.0),
              Container(
                width: 100.0,
                padding:
                    const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
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
        ],
      ),
    );
  }
}
