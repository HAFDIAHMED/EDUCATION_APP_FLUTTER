import 'package:flutter/material.dart';
import 'package:study/constants.dart';
import 'package:study/models/book_data.dart';
import 'package:study/models/card_hight.dart';
import 'package:study/provider/chapter_provider.dart';
import 'package:study/provider/problem_provider.dart';
import 'package:study/provider/solution_provider.dart';

import 'package:study/screens/chapter_screen.dart';
import 'package:study/screens/search_screen.dart';
import 'package:study/ui/sizeInfo.dart';
import 'package:study/ui/ui_utils.dart';
import 'package:study/widgets/book_list_card.dart';
import 'package:study/widgets/drawer.dart';
import 'package:study/widgets/my_appbar.dart';
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      DevicePreview(
        builder: (context) => MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BookData()),
        ChangeNotifierProvider(create: (context) => ChapterProvider()),
        ChangeNotifierProvider(create: (context) => ProblemProvider()),
        ChangeNotifierProvider(create: (context) => SolutionProvider()),
      ],
      child: MaterialApp(
        locale: DevicePreview.of(context).locale, // <--- Add the locale
        builder: DevicePreview.appBuilder,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kBackgoundColor,
          appBarTheme: AppBarTheme(
            color: kWhitColor,
            iconTheme: IconThemeData(color: kBlackColor),
          ),
          textTheme: TextTheme(
            title: kSnigletFont,
            headline: kSnigletFont,
            // subhead: kSnigletFont,
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<BookData>(context).fetchBooks();
    var mediaQuery = MediaQuery.of(context);
    return LayoutBuilder(
      builder: (context, boxSizing) {
        var sizingInformation = SizingInformation(
          orientation: mediaQuery.orientation,
          deviceType: getDeviceType(mediaQuery),
          screenSize: mediaQuery.size,
          localWidgetSize: Size(boxSizing.maxWidth, boxSizing.maxHeight),
        );
        return SafeArea(
          child: Scaffold(
            appBar: homeAppBar(title: "Solution"),
            drawer: MyDrawer(),
            body: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  HomeSearBox(),
                  SizedBox(
                    height: sizingInformation.screenSize.height * 0.03,
                  ),
                  Text(
                    "Recently Added Books",
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: sizingInformation.screenSize.height * .02,
                  ),
                  Expanded(
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
                                            builder: (context) =>
                                                BookDetailsScreen(
                                              bookId:
                                                  bookData.getBooks()[index].id,
                                            ),
                                          ),
                                        );
                                      },
                                      edition:
                                          bookData.getBooks()[index].edition,
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class BookCardSmall extends StatelessWidget {
  const BookCardSmall({
    Key key,
    @required this.sizingInformation,
    @required this.edition,
    @required this.name,
    @required this.auths,
    @required this.poster,
    @required this.press,
  }) : super(key: key);

  final SizingInformation sizingInformation;
  final int edition;
  final String name;
  final String auths;
  final String poster;
  final Function press;

  @override
  Widget build(BuildContext context) {
    double cardHeight = getCardHightSmall(sizingInformation);
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Material(
        color: kWhitColor,
        child: InkWell(
          onTap: press,
          child: Container(
            padding:
                EdgeInsets.all(sizingInformation.localWidgetSize.width * .03),
            height: sizingInformation.localWidgetSize.width * cardHeight,
            child: Row(
              children: <Widget>[
                Image.network(
                  poster,
                  fit: BoxFit.contain,
                  width: sizingInformation.localWidgetSize.width * .18,
                ),
                SizedBox(
                  width: sizingInformation.localWidgetSize.width * .04,
                ),
                Container(
                  width: sizingInformation.screenSize.width * .4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "$name ($edition)",
                        style: Theme.of(context).textTheme.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        auths,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.caption,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeSearBox extends StatelessWidget {
  const HomeSearBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return LayoutBuilder(
      builder: (context, boxSizing) {
        var sizingInformation = SizingInformation(
          orientation: mediaQuery.orientation,
          deviceType: getDeviceType(mediaQuery),
          screenSize: mediaQuery.size,
          localWidgetSize: Size(boxSizing.maxHeight, boxSizing.maxWidth),
        );
        return Material(
          elevation: 3,
          child: Container(
            padding: EdgeInsets.all(16),
            width: sizingInformation.localWidgetSize.width,
            color: kWhitColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.search,
                  color: kPrimaryColor,
                  size: 35,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  "Search What you need",
                  style: Theme.of(context).textTheme.title,
                ),
                Text(
                  "We still add more books hopes you stay with us",
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                SizedBox(
                  width: sizingInformation.localWidgetSize.width,
                  child: RaisedButton(
                    color: kButtonColor,
                    textColor: kWhitColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Search Books",
                      // style: Theme.of(context).textTheme.button,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
