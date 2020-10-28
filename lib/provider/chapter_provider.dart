import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:study/Requests/book_request.dart';
import 'package:study/models/book.dart';
import 'package:study/models/chapter.dart';

class ChapterProvider extends ChangeNotifier {
  String errorMessage;
  bool _chapterLoading = true;
  bool _bookLoading = true;
  Book _book;
  List chapterList;

  Future<bool> fatchBookChapter(id) async {
    await BookRequest().fetchBook(id).then((data) {
      setBookLoading(false);
      if (data.statusCode == 200) {
        setBook(Book.fromJson(json.decode(data.body)));
      } else {
        setMessage(json.decode(data.body)['detail']);
      }
    });
    await BookRequest().fetchChapters(id).then((data) {
      setChapterLoading(false);
      if (data.statusCode == 200) {
        var chapterList = json
            .decode(data.body)
            .map((model) => Chapter.fromJson(model))
            .toList();
        setChapters(chapterList);
      } else {
        setMessage(json.decode(data.body)['detail']);
      }
    });
    return isBook();
  }

  void setChapterLoading(value) {
    _chapterLoading = value;
    notifyListeners();
  }

  void setBookLoading(value) {
    _bookLoading = value;
    notifyListeners();
  }

  Object get isLoading {
    return {'chapter': _chapterLoading, "book": _bookLoading};
  }

  void setBook(value) {
    _book = value;
    notifyListeners();
  }

  void setChapters(value) {
    chapterList = value;
    notifyListeners();
  }

  void setMessage(value) {
    errorMessage = value;
    notifyListeners();
  }

  String get message {
    return errorMessage;
  }

  Book get book {
    return _book;
  }

  List get chapters {
    return chapterList;
  }

  int get chapterLength {
    return chapterList != null ? chapterList.length : 0;
  }

  bool isBook() {
    return _book != null ? true : false;
  }
}
