import 'package:flutter/material.dart';

import '../pages/book_cart_page.dart';

class CartButton extends StatelessWidget {
  final bool isCartEmpty;
  final int quantity;

  const CartButton({super.key, this.isCartEmpty = true, this.quantity = 0});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const BookCartPage()));
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16, top: 12),
            child: const Icon(
              Icons.shopping_cart_outlined,
              size: 32,
            ),
          ),
          if (isCartEmpty == false)
            Positioned(
                top: 3,
                left: 18,
                child: NotificationIcon(quantity: quantity.toString()))
        ],
      ),
    );
  }
}

class NotificationIcon extends StatelessWidget {
  final String quantity;
  const NotificationIcon({super.key, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 11,
        ),
        CircleAvatar(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          radius: 10,
          child: Text(
            quantity,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
