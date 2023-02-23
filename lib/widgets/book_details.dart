import 'package:flutter/material.dart';

import '../models/book.dart';
import 'book_author_text.dart';
import 'book_price_text.dart';
import 'book_title_text.dart';

class BookDetails extends StatelessWidget {
  final Book book;
  const BookDetails({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BookTitleText(
          title: book.title,
        ),
        const SizedBox(
          height: 8,
        ),
        BookAuthorText(
          author: book.author,
        ),
        const SizedBox(
          height: 16,
        ),
        BookPriceText(
          price: book.price,
        ),
      ],
    );
  }
}
