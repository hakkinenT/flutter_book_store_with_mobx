import 'package:flutter/material.dart';

import '../models/book_item.dart';

import 'book_details.dart';
import 'book_image.dart';

import 'book_quantity_control.dart';

class BookItemCard extends StatelessWidget {
  final BookItem bookItem;

  const BookItemCard({super.key, required this.bookItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: BookImage(
                imageUrl: bookItem.book.imageUrl,
                width: 240,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            BookDetails(book: bookItem.book),
            const SizedBox(
              height: 24,
            ),
            BookQuantityControl(bookItem: bookItem)
          ],
        ),
      ),
    );
  }
}
