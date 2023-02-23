import 'package:flutter_book_store/models/book_item.dart';
import 'package:mobx/mobx.dart';

part 'book_cart_controller.g.dart';

class BookCartController = BookControllerBase with _$BookCartController;

abstract class BookControllerBase with Store {
  @observable
  ObservableList<BookItem> cart = ObservableList<BookItem>();

  @computed
  bool get isCartEmpty => cart.isEmpty;

  @computed
  int get cartTotalItems =>
      cart.fold(0, (previousValue, item) => previousValue + item.quantity);

  @computed
  double get totalPrice => cart.fold(
      0.0, (previousValue, element) => previousValue + element.subtotal);

  @action
  addItem(BookItem item) {
    final index =
        cart.indexWhere((element) => element.book.title == item.book.title);
    if (index != -1) {
      cart[index] = item;
    } else {
      cart.add(item);
    }
  }

  @action
  removeItem(BookItem item) {
    if (item.quantity == 0) {
      cart.removeWhere((element) => element.book.title == item.book.title);
    }
  }

  @action
  clearAll() {
    _restartItemQuantity();
    cart.clear();
  }

  _restartItemQuantity() {
    for (var item in cart) {
      item.quantity = 0;
    }
  }
}
