import 'package:flutter/material.dart';
import 'package:flutter_book_store/controllers/book_cart_controller.dart';
import 'package:flutter_book_store/pages/books_page.dart';
import 'package:provider/provider.dart';

import 'controllers/book_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => BookController()..initializeBooks()),
        Provider(create: (_) => BookCartController())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            appBarTheme: const AppBarTheme(
              elevation: 0,
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
            )),
        home: const BooksPage(),
      ),
    );
  }
}
