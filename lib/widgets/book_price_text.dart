import 'package:flutter/material.dart';

class BookPriceText extends StatelessWidget {
  const BookPriceText({
    super.key,
    required this.price,
  });

  final double price;

  @override
  Widget build(BuildContext context) {
    return Text(
      'R\$ ' '${price.toStringAsFixed(2)}',
      style: const TextStyle(
          color: Colors.deepOrange, fontSize: 18, fontWeight: FontWeight.w600),
    );
  }
}
