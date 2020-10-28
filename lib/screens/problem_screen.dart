import 'package:flutter/material.dart';
import 'package:study/constants.dart';
import 'package:study/models/problem_grid_count.dart';
import 'package:study/provider/problem_provider.dart';
import 'package:study/screens/solution_screen.dart';
import 'package:study/widgets/drawer.dart';
import 'package:study/widgets/my_appbar.dart';
import 'package:provider/provider.dart';

class BookProblemScreen extends StatefulWidget {
  final int chapterId;
  final String chapterName;

  const BookProblemScreen({
    Key key,
    @required this.chapterId,
    @required this.chapterName,
  }) : super(key: key);

  @override
  _BookProblemScreenState createState() => _BookProblemScreenState();
}

class _BookProblemScreenState extends State<BookProblemScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<ProblemProvider>(context).fatchProblems(widget.chapterId);
    return SafeArea(
      child: Scaffold(
        appBar: defaultAppBar(title: widget.chapterName, context: context),
        drawer: MyDrawer(),
        body: Consumer<ProblemProvider>(
          builder: (context, data, child) {
            return data.problems != null
                ? Padding(
                    padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: GridView.builder(
                      primary: false,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: getProblemGridNumber(
                            MediaQuery.of(context).size.width),
                      ),
                      itemCount: data.problems.length,
                      itemBuilder: (context, index) {
                        return ProblemButton(
                          number: data.problems[index].number,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookSolutionScreen(
                                  number: data.problems[index].number,
                                  problemId: data.problems[index].id,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )
                : CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class ProblemButton extends StatelessWidget {
  final String number;
  final Function press;

  const ProblemButton({
    Key key,
    @required this.number,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: kWhitColor,
      onPressed: press,
      child: Text(
        "$number",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.display1.copyWith(fontSize: 25),
      ),
    );
  }
}
