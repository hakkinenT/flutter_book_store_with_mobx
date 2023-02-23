// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_item.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BookItem on BookItemBase, Store {
  late final _$quantityAtom =
      Atom(name: 'BookItemBase.quantity', context: context);

  @override
  int get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(int value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  late final _$subtotalAtom =
      Atom(name: 'BookItemBase.subtotal', context: context);

  @override
  double get subtotal {
    _$subtotalAtom.reportRead();
    return super.subtotal;
  }

  @override
  set subtotal(double value) {
    _$subtotalAtom.reportWrite(value, super.subtotal, () {
      super.subtotal = value;
    });
  }

  late final _$BookItemBaseActionController =
      ActionController(name: 'BookItemBase', context: context);

  @override
  dynamic calculateSubtotal() {
    final _$actionInfo = _$BookItemBaseActionController.startAction(
        name: 'BookItemBase.calculateSubtotal');
    try {
      return super.calculateSubtotal();
    } finally {
      _$BookItemBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementQuantity() {
    final _$actionInfo = _$BookItemBaseActionController.startAction(
        name: 'BookItemBase.incrementQuantity');
    try {
      return super.incrementQuantity();
    } finally {
      _$BookItemBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementQuantity() {
    final _$actionInfo = _$BookItemBaseActionController.startAction(
        name: 'BookItemBase.decrementQuantity');
    try {
      return super.decrementQuantity();
    } finally {
      _$BookItemBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
quantity: ${quantity},
subtotal: ${subtotal}
    ''';
  }
}
