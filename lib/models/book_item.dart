import 'package:flutter_book_store/models/book.dart';
import 'package:mobx/mobx.dart';
part 'book_item.g.dart';

class BookItem = BookItemBase with _$BookItem;

abstract class BookItemBase with Store {
  BookItemBase({required this.book});

  final Book book;

  @observable
  int quantity = 0;

  @observable
  double subtotal = 0;

  @action
  calculateSubtotal() {
    subtotal = quantity * book.price;
  }

  @action
  void incrementQuantity() {
    quantity++;
  }

  @action
  void decrementQuantity() {
    if (quantity <= 0) {
      return;
    }

    quantity--;
  }
}
