import 'package:flutter/material.dart';
import 'package:study/constants.dart';
import 'package:study/provider/chapter_provider.dart';
import 'package:study/screens/problem_screen.dart';
import 'package:study/widgets/details_card.dart';
import 'package:study/widgets/drawer.dart';
import 'package:study/widgets/my_appbar.dart';
import 'package:provider/provider.dart';

class BookDetailsScreen extends StatefulWidget {
  final int bookId;

  const BookDetailsScreen({Key key, @required this.bookId}) : super(key: key);
  @override
  _BookDetailsScreenState createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    try {
      Provider.of<ChapterProvider>(context).fatchBookChapter(widget.bookId);
    } catch (error) {
      print("$error");
    }
    return Consumer<ChapterProvider>(
      builder: (context, data, child) {
        return SafeArea(
          child: Scaffold(
            appBar: defaultAppBar(
                title: data.book != null ? data.book.name : "",
                context: context),
            drawer: MyDrawer(),
            body: Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: data.book != null
                  ? Column(
                      children: <Widget>[
                        BookDetailsCard(
                          edition: data.book.edition,
                          auths: data.book.auths,
                          name: data.book.name,
                          poster:
                              'https://cs.cheggcdn.com/covers2/29180000/29182981_1375631097_Width200.jpg',
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: data.chapterLength,
                            itemBuilder: (context, index) {
                              return Chapter(
                                name: data.chapters[index].name,
                                press: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BookProblemScreen(
                                        chapterId: data.chapters[index].id,
                                        chapterName: data.chapters[index].name,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        )
                      ],
                    )
                  : CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}

class Chapter extends StatelessWidget {
  const Chapter({
    @required this.name,
    @required this.press,
    Key key,
  }) : super(key: key);

  final String name;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kWhitColor,
      child: InkWell(
        onTap: press,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: kBackgoundColor,
                width: 3,
              ),
            ),
          ),
          child: ListTile(
            title: Text(
              name,
              style: TextStyle(fontSize: 18),
            ),
            // onTap: press,
          ),
        ),
      ),
    );
  }
}
