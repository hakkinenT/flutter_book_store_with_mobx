import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../controllers/book_cart_controller.dart';
import '../models/book_item.dart';

class BookQuantityControl extends StatelessWidget {
  const BookQuantityControl({
    super.key,
    required this.bookItem,
  });

  final BookItem bookItem;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return QuantityControl(
          increment: () {
            bookItem
              ..incrementQuantity()
              ..calculateSubtotal();
            Provider.of<BookCartController>(context, listen: false)
                .addItem(bookItem);
          },
          quantity: bookItem.quantity,
          decrement: () {
            bookItem
              ..decrementQuantity()
              ..calculateSubtotal();
            Provider.of<BookCartController>(context, listen: false)
                .removeItem(bookItem);
          },
        );
      },
    );
  }
}

class QuantityControl extends StatelessWidget {
  final VoidCallback increment;
  final VoidCallback decrement;
  final int quantity;

  const QuantityControl({
    super.key,
    required this.increment,
    required this.decrement,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DecrementQuantityButton(decrement: decrement),
        QuantityControlPanel(quantity: quantity),
        IncrementQuantityButton(increment: increment),
      ],
    );
  }
}

class QuantityControlPanel extends StatelessWidget {
  const QuantityControlPanel({
    super.key,
    required this.quantity,
  });

  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade500),
        ),
        child: Center(child: Text('$quantity')),
      ),
    );
  }
}

class IncrementQuantityButton extends StatelessWidget {
  final VoidCallback increment;

  const IncrementQuantityButton({super.key, required this.increment});

  @override
  Widget build(BuildContext context) {
    return QuantityControlButton(
        label: "+", onPressed: increment, fontSize: 26);
  }
}

class DecrementQuantityButton extends StatelessWidget {
  final VoidCallback decrement;

  const DecrementQuantityButton({super.key, required this.decrement});

  @override
  Widget build(BuildContext context) {
    return QuantityControlButton(
        label: "-", onPressed: decrement, fontSize: 35);
  }
}

class QuantityControlButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double fontSize;

  const QuantityControlButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black),
          child: Text(label, style: TextStyle(fontSize: fontSize))),
    );
  }
}
