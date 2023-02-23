import 'package:flutter/material.dart';
import 'package:flutter_book_store/models/book_item.dart';
import 'package:flutter_book_store/widgets/book_quantity_control.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../controllers/book_cart_controller.dart';
import '../widgets/book_details.dart';
import '../widgets/book_image.dart';

class BookCartPage extends StatefulWidget {
  const BookCartPage({super.key});

  @override
  State<BookCartPage> createState() => _BookCartPageState();
}

class _BookCartPageState extends State<BookCartPage> {
  late BookCartController cartController;

  @override
  void initState() {
    super.initState();
    cartController = Provider.of<BookCartController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu Carrinho"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            BookCartItemCard(cartController: cartController),
            const SizedBox(
              height: 16,
            ),
            CheckoutButton(cartController: cartController)
          ],
        ),
      ),
    );
  }
}

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    super.key,
    required this.cartController,
  });

  final BookCartController cartController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 52,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white),
          onPressed: () {
            showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                      contentPadding: const EdgeInsets.all(16),
                      actionsAlignment: MainAxisAlignment.center,
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                            size: 67,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Compra realizada com sucesso!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      actions: [
                        TextButton(
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.deepOrange),
                            onPressed: () {
                              cartController.clearAll();
                              Navigator.popUntil(
                                  context, (route) => route.isFirst);
                            },
                            child: Text(
                              "Voltar ao início".toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 16, letterSpacing: 1),
                            ))
                      ],
                    ));
          },
          child: const Text("Finalizar Compra")),
    );
  }
}

class BookCartItemCard extends StatelessWidget {
  const BookCartItemCard({
    super.key,
    required this.cartController,
  });

  final BookCartController cartController;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BookCartQuantityItemsText(cartController: cartController),
            const Divider(
              color: Colors.black54,
            ),
            BookCartList(cartController: cartController),
            const Divider(
              color: Colors.black54,
            ),
            const SizedBox(
              height: 5,
            ),
            BookCartTotalText(cartController: cartController),
          ],
        ),
      ),
    );
  }
}

class BookCartList extends StatelessWidget {
  const BookCartList({
    super.key,
    required this.cartController,
  });

  final BookCartController cartController;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          minHeight: 180, maxHeight: MediaQuery.of(context).size.height - 300),
      child: Observer(
        builder: (_) {
          return ListView.separated(
              primary: false,
              itemCount: cartController.cart.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final cartItem = cartController.cart[index];
                return BookCartItem(bookItem: cartItem);
              });
        },
      ),
    );
  }
}

class BookCartQuantityItemsText extends StatelessWidget {
  const BookCartQuantityItemsText({
    super.key,
    required this.cartController,
  });

  final BookCartController cartController;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topRight,
        child: Observer(
          builder: (_) {
            return Text(
              '${cartController.cartTotalItems} Itens',
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.deepOrange),
            );
          },
        ));
  }
}

class BookCartTotalText extends StatelessWidget {
  const BookCartTotalText({
    super.key,
    required this.cartController,
  });

  final BookCartController cartController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "TOTAL",
          style: TextStyle(fontSize: 16),
        ),
        const Spacer(),
        Observer(
          builder: (_) {
            return Text(
                'R\$ '
                '${cartController.totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold));
          },
        )
      ],
    );
  }
}

class BookCartItem extends StatelessWidget {
  final BookItem bookItem;
  const BookCartItem({super.key, required this.bookItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        BookImage(
          imageUrl: bookItem.book.imageUrl,
          width: 100,
          height: 150,
          fit: BoxFit.contain,
        ),
        SizedBox(
          width: 180,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BookDetails(book: bookItem.book),
              const SizedBox(
                height: 8,
              ),
              Container(
                margin: const EdgeInsets.only(left: 45),
                width: 130,
                child: BookQuantityControl(bookItem: bookItem),
              )
            ],
          ),
        )
      ],
    );
  }
}
