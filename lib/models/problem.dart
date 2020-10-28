class Problem {
  int id;
  String number;

  Problem({this.id, this.number});

  factory Problem.fromJson(Map<String, dynamic> data) {
    return Problem(
      id: data['id'],
      number: data['problem_number'],
    );
  }
}
