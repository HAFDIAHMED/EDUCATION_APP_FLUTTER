class Solution {
  int id;
  String problemNumber;
  String qn;
  String solutionImage;

  Solution({this.id, this.problemNumber, this.qn, this.solutionImage});

  factory Solution.fromJson(Map<String, dynamic> data) {
    return Solution(
      id: data['id'],
      problemNumber: data['problem_number'],
      qn: data['qn'],
      solutionImage: data['solution'],
    );
  }

  fromJson() {}
}
