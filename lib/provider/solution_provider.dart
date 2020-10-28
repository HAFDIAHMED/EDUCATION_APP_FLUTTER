import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:study/Requests/book_request.dart';
import 'package:study/models/solution.dart';

class SolutionProvider extends ChangeNotifier {
  Solution _solution;
  String errorMessage;

  Future<bool> fatchSolution(id) async {
    await BookRequest().fetchSolution(id).then((data) {
      if (data.statusCode == 200) {
        setSolution(Solution.fromJson(json.decode(data.body)));
      } else {
        setMessage(json.decode(data.body)['detail']);
      }
    });
    return isSolution();
  }

  void setSolution(value) {
    _solution = value;
    notifyListeners();
  }

  Solution get solution {
    return _solution;
  }

  void setMessage(value) {
    errorMessage = value;
    notifyListeners();
  }

  String get message {
    return errorMessage;
  }

  bool isSolution() {
    return _solution != null ? true : false;
  }
}
