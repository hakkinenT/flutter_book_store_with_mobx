// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BookController on BookControllerBase, Store {
  late final _$booksAtom =
      Atom(name: 'BookControllerBase.books', context: context);

  @override
  ObservableList<BookItem> get books {
    _$booksAtom.reportRead();
    return super.books;
  }

  @override
  set books(ObservableList<BookItem> value) {
    _$booksAtom.reportWrite(value, super.books, () {
      super.books = value;
    });
  }

  @override
  String toString() {
    return '''
books: ${books}
    ''';
  }
}
