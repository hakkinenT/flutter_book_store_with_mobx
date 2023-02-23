// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_cart_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BookCartController on BookControllerBase, Store {
  Computed<bool>? _$isCartEmptyComputed;

  @override
  bool get isCartEmpty =>
      (_$isCartEmptyComputed ??= Computed<bool>(() => super.isCartEmpty,
              name: 'BookControllerBase.isCartEmpty'))
          .value;
  Computed<int>? _$cartTotalItemsComputed;

  @override
  int get cartTotalItems =>
      (_$cartTotalItemsComputed ??= Computed<int>(() => super.cartTotalItems,
              name: 'BookControllerBase.cartTotalItems'))
          .value;
  Computed<double>? _$totalPriceComputed;

  @override
  double get totalPrice =>
      (_$totalPriceComputed ??= Computed<double>(() => super.totalPrice,
              name: 'BookControllerBase.totalPrice'))
          .value;

  late final _$cartAtom =
      Atom(name: 'BookControllerBase.cart', context: context);

  @override
  ObservableList<BookItem> get cart {
    _$cartAtom.reportRead();
    return super.cart;
  }

  @override
  set cart(ObservableList<BookItem> value) {
    _$cartAtom.reportWrite(value, super.cart, () {
      super.cart = value;
    });
  }

  late final _$BookControllerBaseActionController =
      ActionController(name: 'BookControllerBase', context: context);

  @override
  dynamic addItem(BookItem item) {
    final _$actionInfo = _$BookControllerBaseActionController.startAction(
        name: 'BookControllerBase.addItem');
    try {
      return super.addItem(item);
    } finally {
      _$BookControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeItem(BookItem item) {
    final _$actionInfo = _$BookControllerBaseActionController.startAction(
        name: 'BookControllerBase.removeItem');
    try {
      return super.removeItem(item);
    } finally {
      _$BookControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearAll() {
    final _$actionInfo = _$BookControllerBaseActionController.startAction(
        name: 'BookControllerBase.clearAll');
    try {
      return super.clearAll();
    } finally {
      _$BookControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cart: ${cart},
isCartEmpty: ${isCartEmpty},
cartTotalItems: ${cartTotalItems},
totalPrice: ${totalPrice}
    ''';
  }
}
