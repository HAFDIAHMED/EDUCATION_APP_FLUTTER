class Book {
  final int id;
  final String name;
  final String auths;
  final String poster;
  final int edition;
  Book({this.name, this.auths, this.edition, this.poster, this.id});

  factory Book.fromJson(Map<String, dynamic> data) {
    String auth =
        data['author'].reduce((value, element) => value + ', ' + element);
    return Book(
      name: data['name'],
      id: data['id'],
      auths: auth,
      edition: data['edition'],
      poster: data['poster'],
    );
  }
}
