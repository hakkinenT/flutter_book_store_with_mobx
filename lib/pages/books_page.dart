import 'package:flutter/material.dart';
import 'package:flutter_book_store/controllers/book_cart_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../controllers/book_controller.dart';
import '../widgets/book_item_card.dart';
import '../widgets/cart_button.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  late BookController controller;
  late BookCartController cartController;

  @override
  void initState() {
    super.initState();
    controller = Provider.of<BookController>(context, listen: false);
    cartController = Provider.of<BookCartController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catálogo de Livros"),
        actions: [
          Observer(
            builder: (_) {
              return CartButton(
                isCartEmpty: cartController.isCartEmpty,
                quantity: cartController.cartTotalItems,
              );
            },
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Observer(
            builder: (_) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 330,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16),
                  itemCount: controller.books.length,
                  itemBuilder: (context, index) {
                    final cartItem = controller.books[index];

                    return BookItemCard(
                      bookItem: cartItem,
                    );
                  });
            },
          )),
    );
  }
}
