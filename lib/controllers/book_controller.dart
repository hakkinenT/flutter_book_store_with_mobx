import 'package:flutter_book_store/models/book_item.dart';
import 'package:flutter_book_store/repositories/book_repository.dart';
import 'package:mobx/mobx.dart';

import '../models/book.dart';
part 'book_controller.g.dart';

class BookController = BookControllerBase with _$BookController;

abstract class BookControllerBase with Store {
  BookRepository bookRepository = BookRepository();

  @observable
  ObservableList<BookItem> books = ObservableList<BookItem>.of([]);

  initializeBooks() async {
    final booksInitialized = await _getAllBooks();

    final items = List<BookItem>.generate(booksInitialized.length,
        (index) => BookItem(book: booksInitialized[index]));

    books = items.asObservable();
  }

  Future<List<Book>> _getAllBooks() async {
    return await bookRepository.getAll();
  }
}
