import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:study/Requests/book_request.dart';
import 'package:study/models/problem.dart';

class ProblemProvider extends ChangeNotifier {
  List _problems;
  String errorMessage;

  Future<bool> fatchProblems(chapterId) async {
    await BookRequest().fetchProblems(chapterId).then((data) {
      if (data.statusCode == 200) {
        List problemList = json
            .decode(data.body)
            .map((model) => Problem.fromJson(model))
            .toList();
        setProblems(problemList);
      } else {
        setMessage(json.decode(data.body)['detail']);
      }
    });
    return isProblem();
  }

  void setProblems(value) {
    _problems = value;
    notifyListeners();
  }

  List get problems {
    return _problems;
  }

  void setMessage(value) {
    errorMessage = value;
    notifyListeners();
  }

  String get message {
    return errorMessage;
  }

  bool isProblem() {
    return _problems != null ? true : false;
  }
}
