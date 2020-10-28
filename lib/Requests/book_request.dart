import 'package:http/http.dart' as http;

class BookRequest {
  final String url = 'http://192.168.0.25/api/books/';

  // final String query = "?client_id=${client_id}&client_secret=${client_secret}";

  // Github(this.userName);

  Future<http.Response> fetchBooks() {
    return http.get(url);
  }

  Future<http.Response> fetchBook(bookId) {
    return http.get("http://192.168.0.25/api/books/$bookId");
  }

  Future<http.Response> fetchChapters(bookId) {
    return http.get("http://192.168.0.25/api/chapters/?book_id=$bookId");
  }

  Future<http.Response> fetchProblems(chapterId) {
    return http.get("http://192.168.0.25/api/problems/?chapter_id=$chapterId");
  }

  Future<http.Response> fetchSolution(problemId) {
    return http.get("http://192.168.0.25/api/problems/$problemId");
  }
}
