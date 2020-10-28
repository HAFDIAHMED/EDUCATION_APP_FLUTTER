import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:study/Requests/book_request.dart';
import 'package:study/models/book.dart';
import 'package:study/screens/chapter_screen.dart';
import 'package:study/widgets/book_card_small.dart';

class BookData extends ChangeNotifier {
  String errorMessage;
  bool _loading = true;
  var books;

  Future<bool> fetchBooks() async {
    // setLoading(true);
    await BookRequest().fetchBooks().then((data) {
      setLoading(false);
      if (data.statusCode == 200) {
        Iterable list = json.decode(data.body)['results'];
        var bookList = list.map((model) => Book.fromJson(model)).toList();
        setBooks(bookList);
      } else {
        setMessage(json.decode(data.body)['detail']);
      }
    });
    return isBooks();
  }

  void setLoading(value) {
    _loading = value;
    notifyListeners();
  }

  bool get isLoading {
    return _loading;
  }

  void setBooks(value) {
    books = value;
    notifyListeners();
  }

  List<Book> getBooks() {
    return books;
  }

  void setMessage(value) {
    errorMessage = value;
    notifyListeners();
  }

  String getMessage() {
    return errorMessage;
  }

  bool isBooks() {
    return books != null ? true : false;
  }
}
