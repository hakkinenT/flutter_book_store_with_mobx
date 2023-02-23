import 'package:flutter_book_store/models/book.dart';

import '../services/book_service.dart';

class BookRepository {
  Future<List<Book>> getAll() async {
    return await BookService().readJson();
  }
}
