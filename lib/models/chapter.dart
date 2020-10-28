class Chapter {
  int id;
  String name;
  Chapter({this.id, this.name});

  factory Chapter.fromJson(Map<String, dynamic> data) {
    return Chapter(
      id: data['id'],
      name: data['name'],
    );
  }
}
