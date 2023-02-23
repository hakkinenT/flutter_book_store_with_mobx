import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/book.dart';

class BookService {
  Future<List<Book>> readJson() async {
    final String response =
        await rootBundle.loadString("assets/api/book_api.json");
    final data = await json.decode(response);
    List<Book> books = (data as List).map((b) => Book.fromJson(b)).toList();
    return books;
  }
}
