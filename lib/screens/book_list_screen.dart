import 'package:flutter/material.dart';
import 'package:study/models/book_data.dart';
import 'package:study/screens/chapter_screen.dart';
import 'package:study/widgets/book_list_card.dart';
import 'package:study/widgets/drawer.dart';
import 'package:study/widgets/my_appbar.dart';
import 'package:provider/provider.dart';

class BookListhScreen extends StatefulWidget {
  @override
  _BookListhScreenState createState() => _BookListhScreenState();
}

class _BookListhScreenState extends State<BookListhScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<BookData>(context).fetchBooks();

    return LayoutBuilder(
      builder: (context, boxsizing) {
        return SafeArea(
          child: Scaffold(
            drawer: MyDrawer(),
            appBar: defaultAppBar(title: "List Of Books", context: context),
            body: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Consumer<BookData>(
                builder: (context, bookData, child) {
                  return bookData.isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: bookData.getBooks().length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: BookListCard(
                                press: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BookDetailsScreen(
                                        bookId: bookData.getBooks()[index].id,
                                      ),
                                    ),
                                  );
                                },
                                edition: bookData.getBooks()[index].edition,
                                auths: bookData.getBooks()[index].auths,
                                name: bookData.books[index].name,
                                poster:
                                    'https://cs.cheggcdn.com/covers2/29180000/29182981_1375631097_Width200.jpg',
                              ),
                            );
                          },
                        );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
