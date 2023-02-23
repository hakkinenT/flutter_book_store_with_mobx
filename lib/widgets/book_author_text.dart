import 'package:flutter/material.dart';

class BookAuthorText extends StatelessWidget {
  const BookAuthorText({
    super.key,
    required this.author,
  });

  final String author;

  @override
  Widget build(BuildContext context) {
    return Text(
      author,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(color: Colors.black45, fontSize: 14),
    );
  }
}
